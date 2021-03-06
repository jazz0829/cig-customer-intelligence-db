USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[SalesForce_NextBestActions_Dashboard]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[SalesForce_NextBestActions_Dashboard]
GO
/****** Object:  View [publish].[SalesForce_NextBestActions_Dashboard]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[SalesForce_NextBestActions_Dashboard]
AS


SELECT 
	AccountID
	, 'Promote use of bank link' AS NextBestAction
	, 1 AS NextBestActionOrder
FROM publish.Salesforce_NextBestAction_BuildTable 
WHERE BankLinkFunctionality = 1 AND AutomaticBankLink = 0 AND BankLinkCapableAccounts = 1

-- Recommend using the Salesforce Community for customers that have not had a user access it		
UNION
SELECT
	AccountID
	, 'Promote Salesforce Community' AS NextBestAction
	, 2 AS NextBestActionOrder
FROM publish.Salesforce_NextBestAction_BuildTable 
WHERE LatestDateTimeCommunityAccessed IS NULL

-- Recommend using the sales invoice functionality for customers who have it available as part of their package but have not created a sales invoice in a current active division
UNION
SELECT 
	AccountID
	, 'Promote sales invoice functionality in package' AS NextBestAction
	, 3 AS NextBestActionOrder
FROM publish.Salesforce_NextBestAction_BuildTable
WHERE (SalesInvoiceFunctionality = 1 AND (SalesInvoiceCount = 0 OR SalesInvoiceCount IS NULL))

-- Recommend linking an accountant if there is not accountant currently linked
UNION
SELECT 
	AccountID
	, 'Recommend linking accountant if possible' AS NextBestAction
	, 4 AS NextBestActionOrder
FROM publish.Salesforce_NextBestAction_BuildTable
WHERE AccountantLinked = 0

-- Recommend our EOL mobile app for a customer that has never accessed a division using it
UNION
SELECT 
	AccountID 
	, 'Promote EOL mobile app' AS NextBestAction
	, 5 AS NextBestActionOrder
FROM publish.Salesforce_NextBestAction_BuildTable 
WHERE LatestDateMobileDivisionAccessed IS NULL


GO
