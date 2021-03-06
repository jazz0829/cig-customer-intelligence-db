USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Divisions_MasterDataSetup]    Script Date: 15-Oct-18 20:28:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [domain].[Load_Divisions_MasterDataSetup] AS

-- =========================================================================================================================================================
-- Author:		Alex Green
-- Create date: 20-10-2017
-- Description: This procedure provides a master data setup type classification based on some basic logic and behavior within the division. 

-- =========================================================================================================================================================
-- ADD DIVISION RECORDS
-- First step adds Division records that have not already been added 
INSERT INTO domain.Divisions_MasterDataSetup
SELECT
	D.Environment
	, D.DivisionCode
	, D.AccountID
	, ACS.AccountCode
	, DSS.StartupType
	, D.syscreated
	, NULL AS DivisionFirstAccessed
	, NULL AS MasterDataSetupType 
	, NULL AS MasterDataSetupStatus
	, NULL AS EventStartTime
	, NULL AS EventLatestTime
	, DSS.TemplateDivision
	, NULL AS Notes
FROM domain.Divisions D
INNER JOIN domain.AccountsContract_Summary ACS
	ON D.AccountID = ACS.AccountID 
INNER JOIN domain.DivisionStatistics_Summary DSS
	ON D.Environment = DSS.Environment
	AND D.DivisionCode = DSS.DivisionCode
LEFT JOIN domain.Divisions_MasterDataSetup DMDS
	ON D.Environment = DMDS.Environment
	AND D.DivisionCode = DMDS.DivisionCode
WHERE 
	(
		((CASE WHEN ACS.HadTrial = 1 THEN FirstTrialStartDate ELSE FirstCommStartDate END) >= '2017-01-01')	 -- Takes Divisions for customers that started on or after 1 January 2017 because of when we have been able to capture other data sets (such as Conversions). This will include divisions created based on an Accountant template that were created some time earlier, for example.
		OR D.syscreated >= '2017-01-01'	   -- Also includes divisions created after 1 January 2017 for customers who started before 1 January 2017
	) 
	AND DMDS.DivisionCode IS NULL	  -- Only adds a division record when we do not have a record in the Divisions_MasterDataSetup table for that division + account 

-- =========================================================================================================================================================
-- UPDATE ACCOUNTID FOR DIVISIONS WHERE THIS HAS BEEN TRANSFERED 
-- This updates the AccountID for divisions that have been transfered from one Account to another.
-- This means we only get the 'latest' owner of a Division, as we also do with the domain.Divisions table.
UPDATE DMDS
SET DMDS.AccountID = D.AccountID 
FROM domain.Divisions_MasterDataSetup DMDS
INNER JOIN domain.Divisions D
	ON D.Environment = DMDS.Environment
	AND D.DivisionCode = DMDS.DivisionCode
WHERE DMDS.AccountID <> D.AccountID

-- =========================================================================================================================================================
-- DIVISION FIRST ACCESSED
-- This updates each division with the date/timestamp we have for the first record in the EOLActivityLog for that AccountID for that division
-- This timestamp is used in place of the syscreated fields for Divisions or DivisionStatistics_Summary because these can be created based on the record
-- being generated as part of a division pool (in the case of a template) rather than when the division was created for the customer. In the case of a 
-- conversion the syscreated field can be when the division was first created in a different system rather than when it was availabled in EOL.
-- NOTE: this is currently not being updated when the AccountID changes. So, for example, if a division is created first by an accountant and then transferred to an 
--		 entrepreneur the DivisionFirstAccessed time will stay at the time the Accountant first accessed the division. 
UPDATE domain.Divisions_MasterDataSetup 
SET DivisionFirstAccessed = AL.FirstLogDateTime
FROM 
	(
		   SELECT 
         DMDS.Environment
       , DMDS.AccountID
       , DMDS.DivisionCode
       , MIN(Date) AS FirstLogDateTime
          FROM domain.Divisions_MasterDataSetup DMDS 
              INNER JOIN [domain].[ActivityDaily] AD 
                  ON DMDS.AccountID = AD.AccountID
                      AND DMDS.DivisionCode = AD.DivisionCode
                      AND    DMDS.DivisionFirstAccessed IS NULL
                      AND AD.Date >= DMDS.DivisionCreated
        WHERE AD.ActivityID = '1' 
        GROUP BY 
           DMDS.Environment
         , DMDS.AccountID
         , DMDS.DivisionCode
	) AL
WHERE
	domain.Divisions_MasterDataSetup.AccountID = AL.AccountID 
	AND domain.Divisions_MasterDataSetup.DivisionCode = AL.DivisionCode

-- =========================================================================================================================================================
-- TEMPORARY DIVISIONS
-- Updates the table with divisions that were created and deleted (scheduled for deletion) on the same day that we get Hosting data for.
UPDATE DMDS
SET
	DMDS.MasterDataSetupType = 'TemporaryDivision'
FROM domain.Divisions_MasterDataSetup DMDS
INNER JOIN
	(
		SELECT
			Environment
			, DivisionCode
			, BlockingStatusCode		
		FROM
			(		
				SELECT
					Environment
					, Code AS DivisionCode
					, BlockingStatus AS BlockingStatusCode
					, ROW_NUMBER() OVER(PARTITION BY Environment, Code ORDER BY CIGCopyTime) AS RN 
				FROM [raw].HOST_CIG_Divisions
			) FirstRec
		WHERE RN = 1
	) TemporaryDivs
	ON DMDS.Environment = TemporaryDivs.Environment
	AND DMDS.DivisionCode = TemporaryDivs.DivisionCode
WHERE 
	DMDS.MasterDataSetupType IS NULL
	AND TemporaryDivs.BlockingStatusCode >= 100		-- When the first record we have for a Division in the raw data table is 100 or higher this means the division was scheduled to be deleted as soon as we receive it. 

-- =========================================================================================================================================================
-- DEMO TEMPLATE
-- When a division has the Y startup type this is a demo company template used for trial purposes. 
-- This template contains prefilled master data and some existing transactions. This type of template should not be used for actual financial administration.
UPDATE DMDS
SET
	DMDS.MasterDataSetupType = 'Demo'
FROM domain.Divisions_MasterDataSetup DMDS
WHERE 
	DMDS.MasterDataSetupType IS NULL
	AND DMDS.DivisionStartupTypeCode = 'Y'

--=========================================================================================================================================================
-- CONVERSION
-- This updates the divisions master data setup type based on Conversions from the ConversionSource view. 
UPDATE DMDS
SET 
	DMDS.MasterDataSetupType = 'Conversion'
	, DMDS.MasterDataSetupStatus = (CASE WHEN ConvSQ.ConversionStatusDescription = 'csHandedOver' THEN 'Success'  WHEN ConvSQ.ConversionStatusDescription = 'csHandoverFailed' THEN 'Failure' ELSE 'InProgress' END)  -- Only look to handover (to customer) as ultimate success factor, otherwise set to 'in progress'
	, DMDS.EventStartTime = (CASE WHEN ConvSQ.FirstConvTime IS NOT NULL THEN ConvSQ.FirstConvTime ELSE ConvSQ.syscreated END)
	, DMDS.EventLatestTime = ConvSQ.sysmodified
	, DMDS.Notes = CONCAT('Converted from ', ConvSQ.ConversionSourceDescription)
FROM domain.Divisions_MasterDataSetup DMDS
INNER JOIN 
	(
		  SELECT 
                      CS.Environment
                      , CS.DivisionCode
                      , CS.ConversionSource
                      , CS.ConversionSourceDescription
                      , CS.ConversionStatusCode
                      , CS.ConversionStatusDescription
                      , CS.syscreated
                      , CS.sysmodified
                      , D.LinkedDivision
                      , FC.FirstConvTime
              FROM domain.ConversionSource CS
              INNER JOIN domain.Divisions D
                      ON CS.Environment = D.Environment
                      AND CS.DivisionCode = D.DivisionCode
              LEFT JOIN 
                      (
                             SELECT
                                      Environment
                                    , [DivisionCode]
                                    , MIN(Date) AS FirstConvTime
                             FROM [domain].[ActivityDaily]
                             WHERE  
                                    ActivityID IN 
                                    (
                                    '840000', -- EOL Conversion Tool Cubic Dos
                                    '840100',  -- EOL Conversion Tool for DOS
                                    '840200',  -- EOL Conversion Tool for Exact for Windows
                                    '840300',  -- EOL Conversion Tool
                                    '840400'   -- TwinfieldConversion
                                    )
                             GROUP BY
                                    Environment
                                    ,[DivisionCode]
                                    ) FC
                      ON CS.Environment = FC.Environment
                      AND CS.DivisionCode = FC.DivisionCode
	) ConvSQ
	ON DMDS.Environment = ConvSQ.Environment
	AND DMDS.DivisionCode = ConvSQ.LinkedDivision
WHERE 
	ConvSQ.syscreated IS NOT NULL  -- Updates only if there is a conversion record
	AND (DMDS.MasterDataSetupType IS NULL OR (DMDS.MasterDataSetupType = 'Conversion' AND DMDS.MasterDataSetupStatus NOT IN('Success', 'Failure')))	-- Updates if a classification is not already given to the MasterDataSetupType OR if there is an 'In Progress' Conversion
	

-- This step then deletes the division rows of the 'holding' divisions created as part of the conversion process
DELETE FROM domain.Divisions_MasterDataSetup 
WHERE EXISTS
	(
		SELECT 1
		FROM domain.ConversionSource 
		WHERE 
			domain.Divisions_MasterDataSetup .Environment = domain.ConversionSource.Environment
			AND domain.Divisions_MasterDataSetup .DivisionCode = domain.ConversionSource.DivisionCode
	)

--=========================================================================================================================================================
-- DIVISION TRANSFER
-- This updates the divisions master data setup type based on a division transfer from another customer account.
-- This transfer can occur when a division has moved from an accountant to an entrepreneur, but also a transfer between entrepreneur accounts (often the same customer running multiple accounts).
UPDATE DMDS
SET 
	DMDS.MasterDataSetupType = 'DivisionTransfer'
	, DMDS.MasterDataSetupStatus = CASE WHEN TransferRequest.ETR_Description = 'Request To Transfer' THEN 'Success' WHEN TransferRequest.ETR_Description = 'Error on Transfer' THEN 'Failure' WHEN TransferRequest.TR_Status = 5 THEN 'Rejected' WHEN TransferRequest.ETR_Description IS NULL THEN 'In Progress' ELSE NULL END		-- Some transfer requests are rejected  -- When there is no linked ExecuteTransferRequest then classified as in progress
	, DMDS.EventStartTime = TransferRequest.TR_Created
	, DMDS.EventLatestTime = (CASE WHEN TransferRequest.ETR_Realized IS NOT NULL THEN TransferRequest.ETR_Realized WHEN TransferRequest.TR_Status = 5 THEN TransferRequest.TR_Created END)
FROM domain.Divisions_MasterDataSetup DMDS
INNER JOIN
	(
		SELECT
			TR.Environment
			, LEFT(LTRIM(SUBSTRING(ETR.RequestComments, PATINDEX('%[0-9]%', ETR.RequestComments), LEN(ETR.RequestComments))), CHARINDEX(':',SUBSTRING(ETR.RequestComments, PATINDEX('%[0-9]%', ETR.RequestComments), LEN(ETR.RequestComments)))- 2) AS DivisionCode	-- Trims the RequestComments section to get the DivisionCode that is embedded in the text
			, TR.Created AS TR_Created
			, TR.Realized AS TR_Realized
			, TR.Status AS TR_Status
			, TR.TypeDescription AS TR_TypeDescription
			, ETR.Description AS ETR_Description
			, ETR.Created AS ETR_Created
			, ETR.Realized AS ETR_Realized
		FROM domain.Requests_TransferRequest TR
		LEFT JOIN domain.Requests_ExecuteTransferRequest ETR
			ON TR.RequestID = ETR.RelatedRequest
		LEFT JOIN domain.Contacts C
			ON ETR.ContactID = C.ContactID
		LEFT JOIN domain.Users U
			ON C.PersonID = U.PersonID
	) TransferRequest
	ON DMDS.Environment = TransferRequest.Environment
	AND DMDS.DivisionCode = TransferRequest.DivisionCode
WHERE 
	TransferRequest.TR_Created IS NOT NULL
	AND (DMDS.MasterDataSetupType IS NULL OR (DMDS.MasterDataSetupType = 'DivisionTransfer' AND DMDS.MasterDataSetupStatus NOT IN ('Success', 'Failure', 'Rejected')))  -- Updates Division records where there is not MasterDataSetupType already or there is a DivisionTransfer category that is not ended

--=========================================================================================================================================================
-- RUNS THE UPDATE FOR DIVISIONS THAT ATTEMPTED A XML/CSV IMPORT OF GL ACCOUNTS
-- THIS LOGIC CAN BE IMPROVED IN A NUMBER OF WAYS: 
--		- NOT ONLY LOOKING AT XML/CSV IMPORT BUT OTHER IMPORT BEHAVIORS
--  CURRENTLY THIS PART OF THE CODE ALSO RUNS AFTER THE EXACT TEMPLATE AND EMPTY SECTIONS OF THE CODE. THIS MEANS THAT THE MasterDataSetupStatus
--  IS ALSO APPEARING FOR RECORDS THAT FIRST MEET THIS SETUP TYPE CATEGORY - THIS NEEDS TO BE FIXED
UPDATE DMDS
SET 
	DMDS.MasterDataSetupType = 'XML/CSV_Import'
	, DMDS.MasterDataSetupStatus = (CASE WHEN XML_CSV.EventLatestTime IS NOT NULL THEN 'Success' ELSE 'Started' END)
	, DMDS.EventStartTime = XML_CSV.EventStartTime
	, DMDS.EventLatestTime = XML_CSV.EventLatestTime
FROM domain.Divisions_MasterDataSetup DMDS
INNER JOIN
	(
	SELECT
         DMDS.Environment
       , DMDS.AccountID
       , AL.DivisionCode
       , MIN(AL.Date) AS EventStartTime
       , MAX(CASE WHEN ActivityID IN ('5304202','5334202') THEN AL.Date END) AS EventLatestTime    
    FROM domain.Divisions_MasterDataSetup DMDS 
          INNER JOIN [domain].[ActivityDaily] AL
          ON DMDS.AccountID = AL.AccountID
          AND DMDS.DivisionCode = AL.DivisionCode
          WHERE 
          ActivityID IN  ('5304','5335','5304202','5334202')
          AND AL.Date >= DMDS.DivisionCreated
          GROUP BY
            DMDS.Environment
          , DMDS.AccountID
          , AL.DivisionCode
	) XML_CSV
	ON DMDS.Environment = XML_CSV.Environment 
	AND DMDS.DivisionCode = XML_CSV.DivisionCode
WHERE 
	DMDS.MasterDataSetupType IS NULL 
	OR (DMDS.MasterDataSetupType = 'XML/CSV_Import' AND DMDS.MasterDataSetupStatus NOT IN ('Success'))
	OR (DMDS.MasterDataSetupType = 'ExactTemplate')
	OR (DMDS.MasterDataSetupType = 'Empty')

-- NEED TO ADD LOGIC TO LOOK AT TEMPLATES TOO!!!!!!!! ALSO ACCOUNTANT TEMPLATE

--=========================================================================================================================================================
-- EXACT TEMPLATE
-- For the Exact Legislation template a division starts with approximately 124 GL Accounts already created. This enables the user to have a starting base of financial master data.
UPDATE DMDS
SET 
	DMDS.MasterDataSetupType = 'ExactTemplate'
	, MasterDataSetupStatus = 
			CASE 
			WHEN SaveActions.FifthSave IS NOT NULL THEN 'GLChangesMade' 
			WHEN SaveActions.FirstSave IS NOT NULL AND SaveActions.FifthSave IS NULL THEN 'GLChangesStarted' 
			ELSE 'StandardTemplate' 
			END
	, DMDS.EventStartTime = SaveActions.FirstSave		-- Selects the first save date/time as the start of the process
	, DMDS.EventLatestTime = SaveActions.FifthSave		-- Selects the fifth save date/time as the end of the process
FROM domain.Divisions_MasterDataSetup DMDS
LEFT JOIN
	(		
	SELECT 
         [Date]
        ,Environment
        ,[AccountCode]
        ,[DivisionCode]
        ,FirstSave
        ,FifthSave  
       FROM 
	   (
           SELECT ROW_NUMBER () OVER 
		   ( PARTITION BY Environment,AccountCode,DivisionCode,SAVEMOMENT ORDER BY Date ASC) 
		   AS #ROW
           ,[Date]
           ,Environment
           ,[AccountCode]
           ,[DivisionCode]
           ,CASE WHEN SAVEMOMENT = 1 or SAVEMOMENT = 5 THEN Date ELSE NULL END AS FirstSave
           ,CASE WHEN SAVEMOMENT = 5 THEN Date ELSE NULL END AS FifthSave  
              FROM 
			   (
			     SELECT
                   [Date]
                  ,[AccountCode]
                  ,[DivisionCode]
                  ,Environment
                  ,CASE WHEN SUM(Quantity) OVER (PARTITION BY AccountCode,DivisionCode ORDER BY date ASC) <= 5  THEN 1 
                   WHEN SUM(Quantity) OVER (PARTITION BY AccountCode,DivisionCode ORDER BY date ASC) >= 5 THEN 5 ELSE 
                   NULL END AS SAVEMOMENT
                 FROM [CustomerIntelligence].[domain].[ActivityDaily]
                  WHERE ActivityID = '511006'
			) AS SA
       ) AS SA2
  WHERE #ROW = 1 -- Takes the rows from the first and fifth GL Account saves for a division.

) SaveActions
	ON DMDS.Environment = SaveActions.Environment
	AND DMDS.AccountCode = SaveActions.AccountCode
	AND DMDS.DivisionCode = SaveActions.DivisionCode
WHERE 
	(DMDS.MasterDataSetupType IS NULL OR (DMDS.MasterDataSetupType = 'XML/CSV_Import' AND DMDS.MasterDataSetupStatus NOT IN ('Success')))	--Will do an update when there has not been a different MasterDataSetupType established or there has been a XML_CSV import that has not been completed
	AND DivisionStartupTypeCode IN ('X')		-- Exact Legislation template startup type

--=========================================================================================================================================================
-- ACCOUNTANT TEMPLATE
-- When a division is started based on an Accountant template the assumption is that the division already has the master data deemed appropriate by the
-- accountant available to the user.
UPDATE DMDS
SET
	DMDS.MasterDataSetupType = 'AccountantTemplate'
FROM domain.Divisions_MasterDataSetup DMDS
WHERE 
	DMDS.MasterDataSetupType IS NULL
  	AND DMDS.DivisionStartupTypeCode = 'A'

--=========================================================================================================================================================
-- DIVISION COPY
UPDATE DMDS
SET
	DMDS.MasterDataSetupType = 'DivisionCopy'
FROM domain.Divisions_MasterDataSetup DMDS
LEFT JOIN domain.DivisionStatistics_Summary DSS
	ON DMDS.Environment = DSS.Environment
	AND DMDS.DivisionCode = DSS.DivisionCode
WHERE 
	DMDS.MasterDataSetupType IS NULL
	AND DMDS.DivisionStartupTypeCode = 'D'

--=========================================================================================================================================================
-- EMPTY DIVISION
-- A division can start without any master data. This is not uncommon to see when a customer starts 
UPDATE DMDS
SET 
	DMDS.MasterDataSetupType = 'Empty'
	, MasterDataSetupStatus = 
			CASE 
			WHEN SaveActions.FifthSave IS NOT NULL THEN 'GLAccountsAdded' 
			WHEN SaveActions.FirstSave IS NOT NULL AND SaveActions.FifthSave IS NULL THEN 'GLAccountsStarted' 
			ELSE 'NoChanges' 
			END
	, DMDS.EventStartTime = SaveActions.FirstSave		-- Selects the first save date/time as the start of the process
	, DMDS.EventLatestTime = SaveActions.FifthSave		-- Selects the fifth save date/time as the end of the process
FROM domain.Divisions_MasterDataSetup DMDS
LEFT JOIN
	(		
	SELECT 
         [Date]
        ,Environment
        ,[AccountCode]
        ,[DivisionCode]
        ,FirstSave
        ,FifthSave  
       FROM 
	   (
           SELECT ROW_NUMBER () OVER 
		   ( PARTITION BY Environment,AccountCode,DivisionCode,SAVEMOMENT ORDER BY Date ASC) 
		   AS #ROW
           ,[Date]
           ,Environment
           ,[AccountCode]
           ,[DivisionCode]
           ,CASE WHEN SAVEMOMENT = 1 or SAVEMOMENT = 5 THEN Date ELSE NULL END AS FirstSave
           ,CASE WHEN SAVEMOMENT = 5 THEN Date ELSE NULL END AS FifthSave  
              FROM 
			   (
			     SELECT
                   [Date]
                  ,[AccountCode]
                  ,[DivisionCode]
                  ,Environment
                  ,CASE WHEN SUM(Quantity) OVER (PARTITION BY AccountCode,DivisionCode ORDER BY date ASC) <= 5  THEN 1 
                   WHEN SUM(Quantity) OVER (PARTITION BY AccountCode,DivisionCode ORDER BY date ASC) >= 5 THEN 5 ELSE 
                   NULL END AS SAVEMOMENT
                 FROM [CustomerIntelligence].[domain].[ActivityDaily]
                  WHERE ActivityID = '511006'
			) AS SA
       ) AS SA2
  WHERE #ROW = 1 -- Takes the rows from the first and fifth GL Account saves for a division.
  ) SaveActions
	ON DMDS.Environment = SaveActions.Environment
	AND DMDS.AccountCode = SaveActions.AccountCode
	AND DMDS.DivisionCode = SaveActions.DivisionCode
WHERE 
	DMDS.MasterDataSetupType IS NULL 
	AND DivisionStartupTypeCode IN ('E')		-- Empty startup type