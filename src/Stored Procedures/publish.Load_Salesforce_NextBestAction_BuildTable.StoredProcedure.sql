USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [publish].[Load_Salesforce_NextBestAction_BuildTable]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [publish].[Load_Salesforce_NextBestAction_BuildTable]
GO
/****** Object:  StoredProcedure [publish].[Load_Salesforce_NextBestAction_BuildTable]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================================================================================================================================================================
-- Author:		Alex Green 
-- Create date: 27-02-2018
-- Description:	Loads the fields used to determine Next Best Action logic for a customer. 
-- ================================================================================================================================================================================================================================

CREATE PROC [publish].[Load_Salesforce_NextBestAction_BuildTable] AS

BEGIN TRY
BEGIN TRANSACTION

TRUNCATE TABLE [publish].[Salesforce_NextBestAction_BuildTable]

INSERT INTO publish.Salesforce_NextBestAction_BuildTable (AccountID, Environment, AccountCode, AccountantLinkRelevant, AccountantLinked, LatestCommPackage, BankLinkFunctionality, SalesInvoiceFunctionality, InsertedDateTime)
SELECT A.AccountID, A.Environment, A.AccountCode, A.AccountantLinkRelevant, A.AccountantLinked, A.LatestCommPackage, A.BankLinkFunctionality, A.SalesInvoiceFunctionality, GETDATE()
FROM 
	(
		SELECT 
			ACS.AccountID
			, ACS.Environment
			, ACS.AccountCode
			, CASE WHEN Accounts.IsAccountant = 'Accountant' THEN 0 WHEN PC.Product = 'Accountancy' THEN 0 WHEN PC.Product = 'Partner' THEN 0 ELSE 1 END AS AccountantLinkRelevant 
			, ACS.AccountantLinked
			, ACS.LatestCommPackage
			, PC.BankLinkFunctionality
			, PC.SalesInvoiceFunctionality
		FROM domain.AccountsContract_Summary ACS
		INNER JOIN domain.PackageClassification PC
			ON PC.Environment = ACS.Environment
			AND PC.PackageCode = ACS.LatestCommPackage
		INNER JOIN domain.Accounts 
			ON Accounts.AccountID = ACS.AccountID 
		WHERE ACS.Churned = 0   -- Only includes customers that have not churned
	) A

-- Updates bank link and total number of SalesInvoices across all non-blocked divisions
UPDATE [publish].[Salesforce_NextBestAction_BuildTable]
SET 
	AutomaticBankLink = SI.AutomaticBankLink
	, SalesInvoiceCount = SI.SalesInvoiceCount
	, BankLinkCapableAccounts = SI.BankLinkCapableAccounts
FROM 
	(
		SELECT
			D.AccountID
			, MAX(AutomaticBankLink) AS AutomaticBankLink
			, SUM(ISNULL(DSS.SalesInvoiceCount, 0)) AS SalesInvoiceCount
			, MAX(CASE WHEN (ABNAMROBankAccounts + INGBankAccounts + RabobankAccounts) >= 1 THEN 1 ELSE 0 END) AS BankLinkCapableAccounts
		FROM domain.Divisions D
		LEFT JOIN domain.DivisionStatistics_Summary DSS
			ON D.Environment = DSS.Environment
			AND D.DivisionCode = DSS.DivisionCode
		WHERE D.BlockingStatusCode < 100 
		GROUP BY D.AccountID
	) SI
WHERE [publish].[Salesforce_NextBestAction_BuildTable].AccountID = SI.AccountID

-- Updates latest datetime that a user from an account access the Salesforce Community
-- Subquery logic based on by Levon Goceryan for his measures for Salesforce KPIs
UPDATE [publish].[Salesforce_NextBestAction_BuildTable]
SET LatestDateTimeCommunityAccessed = BQ.LatestDateTimeCommunityAccessed
FROM 
	(
		SELECT
			U.ExactIDAccount__c AS AccountID
			, MAX(DATEADD(mi, DATEDIFF(mi, GETUTCDATE(), GETDATE()),DateAdd(MS,hits_time,CAST(DATEADD(S, [visitStartTime], '1970-01-01') AS Datetime)))) AS LatestDateTimeCommunityAccessed 
		FROM [raw].[BigQuery_Salesforce] BQ
		INNER JOIN 
			( 
				SELECT
					Id
					, CONVERT( uniqueidentifier, RTRIM(LTRIM(UserID__c))) AS UserID__c		-- Try convert required to return a NULL for values that cannot be converted to unique identifier. This is needed instead of a WHERE statement as the query optimizer was changing the order of the WHERE statement to run it after the regular cast/convert, resulting in an error.
					, UPPER(ExactIDAccount__c) AS ExactIDAccount__c
				FROM [raw].[Salesforce_User_Latest] 		
			) U
			ON BQ.userIdLong = U.Id
		WHERE
			[hits_eventInfo_eventCategory] = 'Article Loaded'
			OR [hits_page_pagePathLevel3] = '/ideas'
			OR [hits_page_pagePathLevel3] = '/question/' 
		GROUP BY U.ExactIDAccount__c
	) BQ
WHERE CAST([publish].[Salesforce_NextBestAction_BuildTable].AccountID AS NVARCHAR(36)) = BQ.AccountID

UPDATE [publish].[Salesforce_NextBestAction_BuildTable]
SET LatestDateMobileDivisionAccessed = AD.LatestDateMobileDivisionAccessed
FROM 	
	(
		SELECT
			AccountID
			, MAX(Date) AS LatestDateMobileDivisionAccessed
		FROM domain.ActivityDaily 
		WHERE ActivityID = 9   -- Number of divisions accessed by the mobile app
		GROUP BY AccountID
	) AD
WHERE [publish].[Salesforce_NextBestAction_BuildTable].AccountID = AD.AccountID

COMMIT
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
