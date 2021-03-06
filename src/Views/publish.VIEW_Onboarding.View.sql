USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_Onboarding]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_Onboarding]
GO
/****** Object:  View [publish].[VIEW_Onboarding]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_Onboarding]
AS

SELECT
	ACS2.Environment
	, ACS2.AccountCode
	, AccountantLinked
	, HadTrial
	, FirstTrialStartDate
	, FirstTrialPackage
	, FirstTrialProduct
	, FirstTrialEdition
	, FirstCommStartDate
	, LatestCommPackage
	, LatestCommProduct
	, LatestCommEdition
	, LatestCommFinalDate
	, FirstCommPackage
	, FirstCommProduct
	, FirstCommEdition
	, CommercialLifetimeDays
	, RequestedFullCancellation
	, CommercialLifetimeDayCancelRequest
	, Churned
	, Reasons1 AS ChurnAroundReasonCode


FROM
	(
		SELECT
			ACS.Environment
			, ACS.AccountCode
			, (CASE WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithAccountant' THEN 1 ELSE 0 END) AS AccountantLinked
			, HadTrial
			, FirstTrialStartDate
			, FirstTrialPackage
			, PC1.Product AS FirstTrialProduct
			, PC1.Edition AS FirstTrialEdition
			, FirstCommStartDate
			, LatestCommFinalDate
			, FirstCommPackage
			, PC2.Product AS FirstCommProduct
			, PC2.Edition AS FirstCommEdition
			, LatestCommPackage
			, PC3.Product AS LatestCommProduct
			, PC3.Edition AS LatestCommEdition
			, CommercialLifetimeDays
			, RequestedFullCancellation
			, CommercialLifetimeDayCancelRequest
			, Churned
 
		FROM
			(
				SELECT 
					Environment
					, AccountCode
					, HadTrial
					, FirstTrialStartDate
					, FirstTrialPackage
					, FirstCommStartDate
					, LatestCommFinalDate
					, FirstCommPackage	
					, (CASE WHEN LatestCommFinalDate <= GETDATE() THEN CAST(DATEDIFF(DAY, FirstCommStartDate, LatestCommFinalDate) AS FLOAT) ELSE CAST(DATEDIFF(DAY, FirstCommStartDate, GETDATE()) AS FLOAT) END) + 1 AS CommercialLifetimeDays	-- New way of calculating CommLifetimeDays, now excluding the @EndOfActivityPeriod
					, LatestCommPackage
					, RequestedFullCancellation
					, FullCancellationRequestDate
					, (CASE WHEN RequestedFullCancellation = 1 THEN CAST(DATEDIFF(DAY, FirstCommStartDate, FullCancellationRequestDate) AS FLOAT) ELSE NULL END) + 1 AS CommercialLifetimeDayCancelRequest		-- Calculates the commercial lifetime day in which a cancellation request was made. Adds 1 so that the the first day of a contract is Day 1 rather than Day 0.
					--, (CASE WHEN RequestedFullCancellation = 1 AND Churned = 0 THEN 2 ELSE Churned END) AS Churned			-- Churned = 2 if a customer has requested a full contract cancellation, but this has not yet been implemented. This does include some customers who requested a cancellation, then changed their mind.
					, Churned
				FROM 
					domain.AccountsContract_Summary 
						WHERE
							HadCommContract = 1						-- Selects only accounts who had a commercial contract
				)ACS

		JOIN domain.Accounts A
			ON ACS.Environment = A.Environment
			AND ACS.AccountCode = A.AccountCode

		-- Joins trial product/edition
		LEFT JOIN domain.PackageClassification PC1
			ON ACS.Environment = PC1.Environment
			AND ACS.FirstTrialPackage = PC1.PackageCode

		-- Joins first commercial product/edition
		JOIN domain.PackageClassification PC2
			ON ACS.Environment = PC2.Environment
			AND ACS.FirstCommPackage = PC2.PackageCode

		-- Joins first commercial product/edition
		JOIN domain.PackageClassification PC3
			ON ACS.Environment = PC3.Environment
			AND ACS.LatestCommPackage = PC3.PackageCode

		
		WHERE
		-- Selects customers based in following countries
		ACS.Environment IN ('NL', 'BE')
	
		-- Only selects customers who began their contract during a certain window. The dates of these variables are set at the top of the script
		AND (FirstCommStartDate >= '2015-11-01' /*@StartOfEOLContractDatePeriod*/ AND FirstCommStartDate <= '2016-05-31'  /*@EndOfEOLContractDatePeriod*/) 
	
		-- Only selects commercial account types
		AND 
			(AccountClassificationCode = 'EOL'
			OR AccountClassificationCode = 'ACC'
			OR AccountClassificationCode = 'AC7'
			OR AccountClassificationCode = 'JBO')	
	
		-- Only looking at Entrepreneurs
		AND IsAccountant = 'Entrepreneur'
	) ACS2


LEFT JOIN 
	(
		SELECT
			Environment
			, AccountCode
			, Reasons1
			, [Description]
			, ROW_NUMBER() OVER(PARTITION BY Environment, AccountCode ORDER BY Created DESC) AS RowNum
		FROM domain.ChurnAround
	) CA
	ON ACS2.AccountCode = CA.AccountCode
	AND ACS2.Environment = CA.Environment
	AND Churned > 0
	AND RowNum = 1


GROUP BY
	ACS2.Environment
	, ACS2.AccountCode
	, AccountantLinked
	, HadTrial
	, FirstTrialStartDate
	, FirstTrialPackage
	, FirstTrialProduct
	, FirstTrialEdition
	, FirstCommStartDate
	, LatestCommFinalDate
	, FirstCommPackage
	, FirstCommProduct
	, FirstCommEdition
	, LatestCommPackage
	, LatestCommProduct
	, LatestCommEdition
	, CommercialLifetimeDays
	, RequestedFullCancellation
	, CommercialLifetimeDayCancelRequest
	, Churned
	, Reasons1 

GO
