USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[GDPR_Delete_Accounts]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[GDPR_Delete_Accounts]
GO
/****** Object:  StoredProcedure [raw].[GDPR_Delete_Accounts]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 22-05-2018
-- Description:	
-- =============================================
CREATE PROCEDURE [raw].[GDPR_Delete_Accounts] 

AS
BEGIN
WITH CTE_A
AS
(
	Select Distinct A.ID as AccountID
	From raw.HOST_CIG_Accounts A --The Load procedure should run before this procedure
	WHERE IsAnonymized='1'
)


--ADD NEW ACCOUNTID'S TO THE LOG
INSERT INTO config.GDPR_AccountsDeletionLog (AccountID, DateTimeSelect)
SELECT AccountID, getdate()
FROM CTE_A
WHERE AccountID NOT IN (SELECT AccountID FROM config.GDPR_AccountsDeletionLog)


BEGIN TRY
BEGIN TRANSACTION

--DELETES HISTORY OF ACCOUNTS TABLE RECORDS WHERE THE ACCOUNT ISANONYMIZED, LEAVING ONLY THE LATEST ANONYMIZED RECORD
DELETE SUBA
FROM 
(
	SELECT *,
		ROW_NUMBER() OVER (Partition BY ID Order by CIGCopyTime desc) as RowNumber
	FROM raw.HOST_CIG_Accounts
	WHERE ID IN (
					SELECT Distinct AccountID
					From config.GDPR_AccountsDeletionLog
					--WHERE Processed = 0  --NOT IN USE ANYMORE
				)
) SUBA
WHERE RowNumber>1

-- ANOMYNIZE DIVISIONS TABLE OF ALL DIVISIONS BELONGING TO AN ACCOUNT THAT HAS BEEN ANONYMIZED 
-- We keep the history, rather than delete so that we can keep a history of when a particular division became active or moved between accounts (e.g. when moved to an accountant)
UPDATE raw.HOST_CIG_Divisions   -- NEED TO CHANGE NAME 
SET
	Description = '####'
	, ChamberOfCommerce = '####'
	, City = '####'
	, PostCode = '####'
	, DunsNumber = '####'
	, Website = '####'
WHERE Customer IN 
				(
					SELECT Distinct AccountID
					From config.GDPR_AccountsDeletionLog
					--WHERE Processed = 0  --NOT IN USE ANYMORE
				)

-- DELETE SALESFORCE RAW ACCOUNT RECORDS FOR ISANONYMIZED ACCOUNTS
DELETE SF_Accounts_GDPR
FROM 
(
	SELECT *,
		ROW_NUMBER() OVER (Partition BY ID Order by ETLInsertTime desc, LastModifiedDate desc) as RowNumber
	FROM raw.Salesforce_Account   -- NEED TO CHANGE TO REAL TABLE NAME
	WHERE Exact_ID__c IN (
					SELECT Distinct CAST(AccountID AS varchar(50))   -- Needs to cast to the GUID to a varchar as this is how we capture the raw data from Salesforce
					From config.GDPR_AccountsDeletionLog
					--WHERE Processed = 0  --NOT IN USE ANYMORE 
				)
) SF_Accounts_GDPR
WHERE RowNumber > 1  -- Deletes all records except the latest one 



-- DELETE ELOQUA ACCOUNT RAW RECORDS PRIOR TO AN ACCOUNT BEING ANONYMIZED 
-- This deletes the history of any records (deltas) for Eloqua accounts that have not been anonymized. This leaves on the latest (post anonymized) records
DELETE ElqA
FROM [raw].Eloqua_Accounts ElqA  
INNER JOIN
	(
		SELECT 
			eA.EOLAccountID
			, eA.DateModified
			, ROW_NUMBER() OVER(PARTITION BY eA.EOLAccountID ORDER BY eA.DateModified DESC) AS RN  -- Orders by most recent date modified for any Eloqua Account that has been anonymized. This is used to delete any raw records that occur before this record.
		FROM [raw].Eloqua_Accounts eA    -- NEED TO CHANGE TO ACTUAL TABLE NAME
		INNER JOIN config.GDPR_AccountsDeletionLog GDPRlog
			ON CAST(GDPRlog.AccountID AS VARCHAR(50)) = eA.EOLAccountID 
		--WHERE GDPRlog.Processed = 0  --NOT IN USE ANYMORE 
	) ToDelete
ON ToDelete.EOLAccountID = ElqA.EOLAccountID
AND ToDelete.DateModified = ElqA.DateModified
WHERE RN > 1  -- Only deletes records prior to the most recent record

--UPDATE config.GDPR_AccountsDeletionLog
--SET Processed='1'
--WHERE Processed = 0


-- DELETE THE REQUESTS RAW DATA RECORDS PRIOR TO THE LATEST RECORD
-- This removes the history of any requests for anonymized accounts  
DELETE GDPR_Requests
FROM	
	(
		SELECT *,
			ROW_NUMBER() OVER (Partition BY ID Order by CIGCopyTime desc) as RowNumber
		FROM raw.HOST_CIG_Requests
		WHERE Account IN (
							SELECT Distinct AccountID
							From config.GDPR_AccountsDeletionLog
						 )
	) GDPR_Requests
WHERE RowNumber > 1


COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH



END
GO
