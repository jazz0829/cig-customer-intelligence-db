USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_AccountsContract_Summary]    Script Date: 08-Nov-18 17:51:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ================================================================================================================================================================================================================================
-- Author:		Alex Green (based on the original script from Ronald Dahne)
-- Create date: 25-11-2015
-- Description:	Loads the AccountsContract_Summary table. This table used to be called ContractsIntial.
-- ================================================================================================================================================================================================================================

-- ==========================================NOTE==================================================================================================================================================================================
-- Ronald previously used EventDate as to calculate the FirstTrialStartDate
-- and the FirstCommStartDate. This was changed to using StartDate (from
-- ContractStatistics) to make the code clearer, as it aligns with using
-- FinalDate to calculate FirstTrialFinalDate and FirstCommercialFinalDate.
 
-- Alex Green - 25/11/2015


-- Use of PackageCode to determine the First and Latest Trial and Commercial packages was changed to 
-- ItemCode. This is because there are instances in the Contracts table where a change in package is
-- indicated in the ItemCode column, but this is not reflected in the PackageCode column.

-- Alex Green - 15/01/2016


-- The script was updated to more accurrately select the latest commercial packages. The 
-- latest commercial package is now selected partly based on the quantity, where packages with a 
-- sum of 1 are selected over any other (to account for upgrades and downgrades to a different package 
-- that occur on the same contract number as the previous package. 

-- There are still some slight differences in counts when compared to the counts at the end of each
-- AccountsContract_PerMonth month. This is due to some noise in the Contracts data, such as some
-- accounts with two different active commercial contract numbers. This is the same reason why the CT and
-- CN ContractEventType codes are not used to select the first commercial contract, as some contracts
-- started in Contracts as an CUP (commercial upgrade) from a trial to commercial, rather than a CT code.

-- Alex Green - 26/01/2016


-- Added the latest number of administrations, archived administrations, and users 

-- Alex Green - 16/02/2016


-- Updated how paying users/free users are calculate

-- Alex Green - 31/03/2016

-- Included code to rebuild the indexes at the end of the script, as these become fragemented each time the table is reloaded
-- Alex Green - 04/10/2016
-- =======================================================================================================================================================================================================================

ALTER PROC [domain].[Load_AccountsContract_Summary] as

--REMOVE THE DATA PREVIOUSLY STORED IN THE TABLE TO POPULATE IT WITH THE UPDATED DATA
TRUNCATE TABLE [domain].[AccountsContract_Summary]

-- 1. FILL THE TABLE WITH ALL ACCOUNTS
INSERT INTO AccountsContract_Summary (Environment, AccountCode, AccountID)

SELECT cs.Environment, cs.AccountCode, AC.AccountID
FROM CustomerIntelligence.domain.Contracts AS cs
JOIN domain.Accounts AC
ON AC.AccountCode=cs.AccountCode AND AC.Environment=cs.Environment
GROUP BY 
	cs.Environment,
	cs.AccountCode,
	AC.AccountID


-- 2. SET DATES AND PACKAGE OF FIRST TRIAL
-- Note: a customer may have multiple trial packages
UPDATE [domain].[AccountsContract_Summary]
SET 
	FirstTrialStartDate = t.StartDate,
	FirstTrialPackage   = t.Package,
	FirstTrialFinalDate   = t.FinalDate

FROM 
(
	SELECT 
		cs.Environment, 
		cs.AccountCode,  
		MIN(cs.StartDate) AS StartDate, --this sets the earliest date of an account's Trial contract type for the FirstTrialStartDate
		MIN(cs.FinalDate) AS FinalDate,
		
		--this sub-query selects the first occurence of the Trial package type for the FirstTrialPackage
		(	SELECT TOP 1 ItemCode 
			FROM [domain].[Contracts]
			WHERE 
				Environment = cs.Environment 
				AND AccountCode = cs.AccountCode 
				AND ContractType = 'T'				--this selects only Trial contract types
				AND LinePackage = 1					--this selects only the row in the Contracts table where there is a change to the package
				AND ContractEventTypeCode = 'TN'	-- this selects only the event type 'New Trial'
				AND InflowOutflow = 'Inflow'		--this selects only the row with an inflow to the contract
				AND EventDate <= GETDATE()		--this ignores changes to contracts that are occurring in the future
			ORDER BY EventDate 
		) AS Package

	FROM [domain].[Contracts] cs
	WHERE 
		cs.ContractType = 'T'
		AND cs.LinePackage  = 1
		AND cs.ContractEventTypeCode = 'TN'
	GROUP BY 
		cs.Environment, 
		cs.AccountCode
) AS t

WHERE 
	AccountsContract_Summary.Environment = t.Environment 
	AND AccountsContract_Summary.AccountCode = t.AccountCode


-- 3. SET DATES AND PACKAGE OF FIRST COMMERCIAL PACKAGE
UPDATE [domain].[AccountsContract_Summary]
SET 
	FirstCommStartDate = t.StartDate,
	FirstCommPackage   = t.Package,
	FirstCommFinalDate   = t.FinalDate
FROM 
(
	SELECT 
		cs.Environment, 
		cs.AccountCode,  
		MIN(cs.StartDate) AS StartDate,			
		MIN(cs.FinalDate) AS FinalDate,

		--this sub-query selects the first occurence of the Commercial package type for the FirstCommPackage	
		(
			SELECT TOP 1 ItemCode 
			FROM [domain].[Contracts] 
			WHERE 
				Environment = cs.Environment 
				AND AccountCode = cs.AccountCode 
				AND ContractType = 'C'			--this selects only the Commercial contract types
				AND LinePackage = 1				--this selects only the row in the Contracts table where there is a change to the package
				AND InflowOutflow = 'Inflow'	--this selects only the row with an inflow to the contract
				AND EventDate <= GETDATE()		--this ignores changes to contracts that are occurring in the future
			ORDER BY EventDate 
		) AS Package
		
		FROM [domain].[Contracts] cs
		WHERE 
			cs.ContractType = 'C'
			AND cs.LinePackage  = 1
		GROUP BY 
			cs.Environment, 
			cs.AccountCode
) AS t
WHERE 
	AccountsContract_Summary.Environment = t.Environment 
	AND AccountsContract_Summary.AccountCode = t.AccountCode		 


-- 4.	SETS INDICATOR WHETHER ACCOUNT HAS HAD A TRIAL OR HAD A COMMERCIAL CONTRACT
UPDATE [domain].[AccountsContract_Summary]
SET 
	HadTrial		= (CASE WHEN AccountsContract_Summary.FirstTrialPackage IS NOT NULL THEN 1 ELSE 0 END),
	HadCommContract = (CASE WHEN AccountsContract_Summary.FirstCommPackage IS NOT NULL THEN 1 ELSE 0 END)

FROM [domain].[AccountsContract_Summary]


-- 5. SETS LATEST COMMERCIAL PACKAGE
UPDATE [domain].[AccountsContract_Summary]
SET LatestCommPackage   = t.PackageCode

FROM
(
	SELECT 
		cs.Environment,
		cs.AccountCode,
			(SELECT TOP 1 ItemCode 
				FROM [domain].[Contracts]
				WHERE 
					Environment = cs.Environment 
					AND AccountCode = cs.AccountCode 					
					AND ContractType = 'C'			--this selects only the Commercial contract types
					AND LinePackage = 1				--this selects only the row in the Contracts table where there is a change to the package
					AND EventDate <= GETDATE()		--this ignores changes to contracts that are occurring in the future
				GROUP BY 
					Environment,
					AccountCode,
					ItemCode,
					FinalDate	
				ORDER BY 
					FinalDate DESC,					-- first this orders by the latest FinalDate of contracts
					SUM(Quantity) DESC				-- this then orders by packages (itemcode) with a positive quantity, so downgraded packages are not selected. 
			) AS PackageCode
	FROM
		[domain].[Contracts] cs
	WHERE 
		cs.ContractType = 'C' 
		AND	cs.LinePackage  = 1
	GROUP BY
		Environment,
		AccountCode

)t
WHERE 
	AccountsContract_Summary.Environment = t.Environment 
	AND AccountsContract_Summary.AccountCode = t.AccountCode		 


--6. SETS LATEST COMMERCIAL START AND FINAL DATES
UPDATE [domain].[AccountsContract_Summary]
SET 
	LatestCommStartDate = t.StartDate,
	LatestCommFinalDate   = t.FinalDate
FROM
(
SELECT 
	cs.Environment , 
	cs.AccountCode ,  
	MAX(cs.StartDate) AS StartDate ,			
	MAX(cs.FinalDate) AS FinalDate ,
	cs.ItemCode
		
	FROM [domain].[Contracts] cs
	WHERE 
		cs.ContractType = 'C' 
		AND	cs.LinePackage  = 1
		AND InflowOutflow = 'Inflow'
		AND EventDate <= GETDATE()			--ignores StartDates and FinalDates that are related to contract changes occurring in the future
	GROUP BY 
		cs.Environment, 
		cs.AccountCode,
		cs.ItemCode
) AS t
WHERE 
	AccountsContract_Summary.Environment = t.Environment 
	AND AccountsContract_Summary.AccountCode = t.AccountCode
	AND AccountsContract_Summary.LatestCommPackage = t.ItemCode


--7. SETS LATEST TRIAL PACKAGE 
UPDATE [domain].[AccountsContract_Summary]
SET LatestTrialPackage   = t.PackageCode

FROM
(
	SELECT 
		cs.Environment,
		cs.AccountCode,
			(SELECT TOP 1 ItemCode 
				FROM [domain].[Contracts] 
				WHERE 
					Environment = cs.Environment 
					AND AccountCode = cs.AccountCode 
					AND ContractType = 'T'			--this selects only the Trial contract types
					AND LinePackage = 1				--this selects only the row in the Contracts table where there is a change to the package
					AND (ContractEventTypeCode = 'TN'	-- this selects only the event type 'New Trial'
					OR ContractEventTypeCode = 'PI')
					AND EventDate <= GETDATE()		--this ignores changes to contracts that are occurring in the future		
				GROUP BY 
					Environment,
					AccountCode,
					ItemCode,
					FinalDate	
				ORDER BY 
					FinalDate DESC,					-- first this orders by the latest FinalDate of contracts
					SUM(Quantity) DESC				-- this then orders by packages (itemcode) with a positive quantity, so downgraded packages are not selected. 
			) AS PackageCode
	FROM
		[domain].[Contracts] cs
	WHERE 
		cs.ContractType = 'T' 
		AND	cs.LinePackage  = 1
	GROUP BY
		Environment,
		AccountCode

)t
WHERE 
	AccountsContract_Summary.Environment = t.Environment 
	AND AccountsContract_Summary.AccountCode = t.AccountCode


--8. SETS LATEST TRIAL START AND FINAL DATES
UPDATE [domain].[AccountsContract_Summary]
SET 
	LatestTrialStartDate = t.StartDate,
	LatestTrialFinalDate   = t.FinalDate
FROM
(
SELECT 
	cs.Environment , 
	cs.AccountCode ,  
	MAX(cs.StartDate) AS StartDate ,			
	MAX(cs.FinalDate) AS FinalDate ,
	cs.ItemCode
		
	FROM [domain].[Contracts] cs
	WHERE 
		cs.ContractType = 'T' 
		AND	cs.LinePackage  = 1
		AND cs.InflowOutflow = 'Inflow'
		AND EventDate <= GETDATE()			--ignores StartDates and FinalDates that are related to contract changes occurring in the future 
	GROUP BY 
		cs.Environment, 
		cs.AccountCode,
		cs.ItemCode
) AS t
WHERE 
	AccountsContract_Summary.Environment = t.Environment 
	AND AccountsContract_Summary.AccountCode = t.AccountCode
	AND AccountsContract_Summary.LatestTrialPackage = t.ItemCode


--9. SETS THE COMMERCIAL LIFETIME OF THE CONTRACT IN MONTHS -- This has the potential problem of continuing to count time for customers who had a break in time between their first and latest contracts.
UPDATE [domain].[AccountsContract_Summary]
SET CommLifetimeMonths = (CASE WHEN HadCommContract = 1 THEN (CASE WHEN LatestCommFinalDate > GETDATE() THEN DATEDIFF(MONTH, FirstCommStartDate, GETDATE()) ELSE DATEDIFF(MONTH, FirstCommStartDate, LatestCommFinalDate) END) ELSE 0 END)  -- If the contract is still active, then tenure is calculated based on today's date.


--10. SETS THE LATEST MRR OF THE CONTRACT -- This only counts commercial contract types.
UPDATE [domain].[AccountsContract_Summary]
SET LatestMRR =	t.LatestMRR
FROM
(	SELECT 
		cs.Environment, 
		cs.AccountCode, 
		ROUND(SUM(cs.ValuePerMonth),2) AS LatestMRR
	FROM [domain].[Contracts] cs
	WHERE
		EventDate <= GETDATE()		--this ignores changes to contracts that are occurring in the future
		AND ContractType = 'C'
	GROUP BY 
		cs.Environment, 
		cs.AccountCode
) as t
WHERE 
	AccountsContract_Summary.Environment = t.Environment 
	AND AccountsContract_Summary.AccountCode = t.AccountCode

--11. SETS THE NUMBER OF AVAILABLE ADMINISTRATIONS, ARCHIVED ADMINISTRATIONS, AND USERS
UPDATE [domain].[AccountsContract_Summary]
SET 
	LatestNumberOfAvailableAdmins =	t.LatestNumberOfAvailableAdmins ,
	LatestNumberOfArchivedAdmins  = t.LatestNumberOfArchivedAdmins ,
	LatestNumberOfUsers			  =	t.LatestNumberOfUsers ,
	LatestNumberPayingUsers		  = t.LatestNumberPayingUsers	,
	LatestNumberFreeUsers		  = t.LatestNumberFreeUsers

FROM
(	SELECT 
		cs.Environment , 
		cs.AccountCode , 
		SUM (CASE WHEN ItemCode != 'EOL9950' THEN NumberOfAdministrations END) AS LatestNumberOfAvailableAdmins ,		--EOL9950 is the ItemCode for an archived administration. This line counts the sum of NumberOfAdministrations that are not archived. 
		SUM (CASE WHEN ItemCode = 'EOL9950' THEN NumberOfAdministrations ELSE 0 END) AS LatestNumberOfArchivedAdmins ,  -- Counts the number of archived administrations 
		SUM(NumberOfUsers) AS LatestNumberOfUsers ,
		SUM (CASE WHEN ValuePerMonth <> 0 THEN NumberOfUsers ELSE 0 END) AS LatestNumberPayingUsers ,					-- Counts the number of customers with a ValuePerMonth value that is not 0
		SUM (CASE WHEN ValuePerMonth = 0 THEN NumberOfUsers ELSE 0 END) AS LatestNumberFreeUsers						-- Counts the number of customers with a ValuePerMonth value that is 0

	FROM [domain].[Contracts] cs
	WHERE
		EventDate <= GETDATE()		--this ignores changes to contracts that are occurring in the future
		AND FinalDate >= GETDATE()
	GROUP BY 
		cs.Environment, 
		cs.AccountCode
) as t
WHERE 
	AccountsContract_Summary.Environment = t.Environment 
	AND AccountsContract_Summary.AccountCode = t.AccountCode


--12. SETS INDICATOR FOR FULL CANCELLATION DATE 
UPDATE [domain].[AccountsContract_Summary]
SET 
	RequestedFullCancellation		=	t.RequestedFullCancellation
	, FullCancellationRequestDate	=	t.FullCancellationRequestDate
FROM
	(SELECT  
	         Environment
			,AccountCode
			,FullCancellationRequestDate
			,RequestedFullCancellation 
			 FROM (
SELECT  
    ROW_NUMBER ( ) OVER ( PARTITION BY [Environment],[AccountCode] order by eventdate desc) as #ROW
    ,[Environment]
    ,[AccountCode]
	,CancellationDate as FullCancellationRequestDate
	,CASE WHEN CancellationDate IS NULL THEN 0 ELSE 1 END AS RequestedFullCancellation
  FROM [CustomerIntelligence].[domain].[Contracts]
  where LinePackage = '1'
  and InflowOutflow = 'inflow'

  ) AS SUB where #ROW = '1'
	) AS t

WHERE 
	AccountsContract_Summary.Environment = t.Environment 
	AND AccountsContract_Summary.AccountCode = t.AccountCode


--13. SETS INDICATOR WHETHER ACCOUNT HAS CHURNED 
UPDATE [domain].[AccountsContract_Summary]
SET Churned =		t.Churned
FROM	
	(SELECT
		Environment
		, AccountCode
		, (CASE WHEN MaxFinalDate >= GETDATE() THEN 0 ELSE 1 END) AS Churned
	FROM
		(SELECT 
				Environment
				, AccountCode
				, MAX(FinalDate) AS MaxFinalDate
		FROM 
			[domain].[Contracts]
		GROUP BY
			Environment
			, AccountCode
		) AS FinalDate
	) AS t
WHERE 
	AccountsContract_Summary.Environment = t.Environment 
	AND AccountsContract_Summary.AccountCode = t.AccountCode



--13. SETS WHETHER CUSTOMER HAS AN ACCOUNTANT LINKED AND THE DATE THEY FIRST LINKED TO AN ACCOUNTANT
UPDATE [domain].[AccountsContract_Summary]
SET 
	AccountantLinked			=		t.AccountantLinked
	, DateFirstLinkedToAccountant =		t.DateFirstLinkedToAccountant

FROM
	(
		SELECT
			ACS.Environment
			, ACS.AccountCode
			, MAX(CASE WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithAccountant' THEN 1 ELSE 0 END) AS AccountantLinked
			, MAX(CASE 
				WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithAccountant' AND FirstCommStartDate >= '2016-02-09' AND LinkStatus = 'Accountant Linked' THEN [Date]
				WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithAccountant' AND FirstCommStartDate >= '2016-02-09' AND LinkStatus IS NULL THEN FirstCommStartDate 		
				WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithoutAccountant' AND FirstCommStartDate >= '2016-02-09' AND LinkStatus = 'Accountant Linked' THEN [Date]		-- This includes the DateFirstLinkedToAccountant for customers that have since removed the link
				ELSE NULL END
				) AS DateFirstLinkedToAccountant					-- This only looks at commercial contracts. There are trial accounts that link to an accountant, but these tend to be the student accounts, or trials accounts that link to the Exacdemy Accountant
		FROM [domain].[AccountsContract_Summary] ACS
			
		INNER JOIN [domain].[Accounts]
			ON ACS.Environment = Accounts.Environment
			AND ACS.AccountCode = Accounts.AccountCode
		
		LEFT JOIN	
			(
				SELECT 
					Environment
					, AccountCode
					, LinkStatus
					, [Date]
					, ROW_NUMBER() OVER(PARTITION BY Environment, AccountCode ORDER BY [Date]) AS RowNumber
				FROM
					[domain].[LinkedAccountantLog]
				WHERE
					LinkStatus = 'Accountant Linked'
			) LAL
		ON ACS.Environment = LAL.Environment
		AND ACS.AccountCode = LAL.AccountCode
		AND RowNumber = 1								-- RowNumber 1 is the first date that the customer linked to an accountant. Customers can change between accountants, but we are most interested in when they first link

		GROUP BY
			ACS.Environment
			, ACS.AccountCode
	) AS t
WHERE  
	t.Environment = AccountsContract_Summary.Environment
	AND t.AccountCode = AccountsContract_Summary.AccountCode

-- ========================================================================================================================================
--Rebuild the indexes

ALTER INDEX ALL ON [domain].AccountsContract_Summary REBUILD
