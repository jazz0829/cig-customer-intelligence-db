USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [publish].[Load_Salesforce_NextBestActions]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [publish].[Load_Salesforce_NextBestActions]
GO
/****** Object:  StoredProcedure [publish].[Load_Salesforce_NextBestActions]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================================================================================================================================================================================
-- Author:		Alex Green 
-- Create date: 19-03-2018
-- Description: Uses the logic of the Salesforce_NextBestAction_BuildTable to insert next best action events into the Salesforce_NextBestAction_EventLog.
--				These events are then sent to Salesforce to trigger the next best actions for Support staff to recommend on the call.
--				
-- ================================================================================================================================================================================================================================

CREATE PROC [publish].[Load_Salesforce_NextBestActions] AS

-- These variables are the GUIDs of the Customer Intelligence external ID used by Salesforce. 
DECLARE @NextBestActionID_AccountantLink UNIQUEIDENTIFIER
SET @NextBestActionID_AccountantLink = '697FDDD7-1FD3-4A5E-873B-706BB0DDE0FB' 

DECLARE @NextBestActionID_BankLink UNIQUEIDENTIFIER
SET @NextBestActionID_BankLink = 'D907EE8B-4827-4CB9-9B5C-9072D44B98F6'		

DECLARE @NextBestActionID_SalesInvoice UNIQUEIDENTIFIER
SET @NextBestActionID_SalesInvoice = 'EA9AE836-2892-4BBC-A2BD-F4D8EE24023D' 

DECLARE @NextBestActionID_MobileApp UNIQUEIDENTIFIER
SET @NextBestActionID_MobileApp = 'A9549824-3828-4D59-93B2-66E590A2256C' 

DECLARE @NextBestActionID_SalesforceCommunity UNIQUEIDENTIFIER
SET @NextBestActionID_SalesforceCommunity = '7FD6F460-C4EB-4936-A30E-A9D704941191' 


--BEGIN TRY
--BEGIN TRANSACTION
-- ADD BEGIN TRY AT EACH STEP???

--CREATE PROCEDURE publish.Load_Salesforce_NextBestActions

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Accountant link Next Best Action logic
INSERT INTO publish.Salesforce_NextBestActions (CI_EventID, AccountID, NextBestActionID, DateTimeSelectedForAction, Suggest, DateTimeLastModified)
SELECT 
	NEWID() AS CI_EventID
	, AccountID	
	, @NextBestActionID_AccountantLink AS NextBestActionID
	, GETDATE() AS DateTimeInserted
	, 1 AS Suggest
	, GETDATE() AS DateTimeLastModified
FROM publish.Salesforce_NextBestAction_BuildTable  BT
WHERE 
	(AccountantLinkRelevant = 1 AND AccountantLinked = 0) -- Two criteria need to be met for this action to be recommended - the customer should not be using an accountancy or partner product (or is recognized as an accountant), and the customer 
	AND NOT EXISTS    -- Only adds new records if this customer has not already had this next best action recommended before
		(SELECT 1 
		FROM publish.Salesforce_NextBestActions NBA
		WHERE 
		BT.AccountID = NBA.AccountID 
		AND NBA.NextBestActionID = @NextBestActionID_AccountantLink   -- This is the Next Best Action as identified above
		)


UPDATE publish.Salesforce_NextBestActions   -- Updates the accountant linked next best action suggest to 0 if action is no longer relevant
SET
	Suggest = 0   -- Suggest changed to 0 so it is no longer suggested as an action by Support
	, DateTimeLastModified = GETDATE()  
FROM
	(
		SELECT 
			CI_EventID
			, BT.AccountID
		FROM publish.Salesforce_NextBestActions NBA
		INNER JOIN  publish.Salesforce_NextBestAction_BuildTable  BT  
			ON BT.AccountID = NBA.AccountID
		WHERE 
			NBA.NextBestActionID = @NextBestActionID_AccountantLink
			AND NBA.Suggest = 1
			AND (BT.AccountantLinkRelevant = 0 OR AccountantLinked = 1)  -- Where customer now has an accountancy/partner product, is identified as an accountant, or has linked an accountant
	) AL
WHERE 			
	publish.Salesforce_NextBestActions.CI_EventID = AL.CI_EventID

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Bank link Next Best Action logic
INSERT INTO publish.Salesforce_NextBestActions (CI_EventID, AccountID, NextBestActionID, DateTimeSelectedForAction, Suggest, DateTimeLastModified)
SELECT 
	NEWID() AS CI_EventID
	, AccountID
	, @NextBestActionID_BankLink AS NextBestActionID
	, GETDATE() AS DateTimeInserted
	, 1 AS Suggest
	, GETDATE() AS DateTimeLastModified
FROM publish.Salesforce_NextBestAction_BuildTable  BT
WHERE 
	(BankLinkFunctionality = 1  AND AutomaticBankLink = 0 AND BankLinkCapableAccounts = 1)  -- Three criteria need to be met from the NextBestAction_BuildTable - the customer needs to have a package that has the bank link capable functionality, the customer needs to have added a bank account from ING, ABN ARO or Rabobank, and the customer does not already have a bank link in place
	AND NOT EXISTS    -- Only adds new records if this customer has not already had this next best action recommended before
		(SELECT 1 
		FROM publish.Salesforce_NextBestActions NBA
		WHERE 
		BT.AccountID = NBA.AccountID 
		AND NBA.NextBestActionID = @NextBestActionID_BankLink   -- This is the Next Best Action as identified above
		)
	
UPDATE publish.Salesforce_NextBestActions  -- Updates the Next Best Actions if the previously suggested bank link action is no longer relevant
SET
	Suggest = 0  -- Suggest changed to 0 so it is no longer suggested as an action by Support
	, DateTimeLastModified = GETDATE() 
FROM
	(
		SELECT 
			CI_EventID
			, BT.AccountID
		FROM publish.Salesforce_NextBestActions NBA
		INNER JOIN  publish.Salesforce_NextBestAction_BuildTable  BT  
			ON BT.AccountID = NBA.AccountID
		WHERE 
			NBA.NextBestActionID = @NextBestActionID_BankLink
			AND NBA.Suggest = 1
			AND (BT.AutomaticBankLink = 1 OR BT.BankLinkFunctionality = 0 OR BT.BankLinkCapableAccounts = 0)
	) BL_BT
WHERE 			
	publish.Salesforce_NextBestActions.CI_EventID = BL_BT.CI_EventID

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sales invoice functionality next best action
INSERT INTO publish.Salesforce_NextBestActions (CI_EventID, AccountID, NextBestActionID, DateTimeSelectedForAction, Suggest, DateTimeLastModified)
SELECT 
	NEWID() AS CI_EventID
	, AccountID
	, @NextBestActionID_SalesInvoice AS NextBestActionID
	, GETDATE() AS DateTimeInserted
	, 1 AS Suggest
	, GETDATE() AS DateTimeLastModified
FROM publish.Salesforce_NextBestAction_BuildTable  BT
WHERE
	(SalesInvoiceFunctionality = 1 AND (SalesInvoiceCount = 0 OR SalesInvoiceCount IS NULL))  -- Two criteria need to be met to recommend the sales invoice functionality - the customer should have the functionality available and they have never created a salesinvoicecount record
	AND NOT EXISTS    -- Only adds new records if this customer has not already had this next best action recommended before
		(SELECT 1 
		FROM publish.Salesforce_NextBestActions NBA
		WHERE 
		BT.AccountID = NBA.AccountID 
		AND NBA.NextBestActionID = @NextBestActionID_SalesInvoice   -- This is the Next Best Action as identified above
		)

UPDATE publish.Salesforce_NextBestActions  -- Updates the Next Best Actions if the previously suggested sales invoice action is no longer relevant
SET
	Suggest = 0   -- Suggest changed to 0 so it is no longer suggested as an action by Support
	, DateTimeLastModified = GETDATE() 
FROM
	(
		SELECT 
			CI_EventID
			, BT.AccountID
		FROM publish.Salesforce_NextBestActions NBA
		INNER JOIN  publish.Salesforce_NextBestAction_BuildTable  BT  
			ON BT.AccountID = NBA.AccountID
		WHERE 
			NBA.NextBestActionID = @NextBestActionID_SalesInvoice
			AND NBA.Suggest = 1
			AND (SalesInvoiceFunctionality = 0 OR (SalesInvoiceCount > 0)) -- Sales invoice next best action no longer relevant if customer no longer has a package that features the functionality, or they have created a sales invoice
	) SI
WHERE 			
	publish.Salesforce_NextBestActions.CI_EventID = SI.CI_EventID

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mobile app next best action
INSERT INTO publish.Salesforce_NextBestActions (CI_EventID, AccountID, NextBestActionID, DateTimeSelectedForAction, Suggest, DateTimeLastModified)
SELECT
	NEWID() AS CI_EventID
	, AccountID
	, @NextBestActionID_MobileApp AS NextBestActionID
	, GETDATE() AS DateTimeInserted
	, 1 AS Suggest
	, GETDATE() AS DateTimeLastModified
FROM publish.Salesforce_NextBestAction_BuildTable  BT
WHERE
	BT.LatestDateMobileDivisionAccessed IS NULL  -- Selects customer for action where no user has ever accessed a division using the mobile app before
	AND NOT EXISTS    -- Only adds new records if this customer has not already had this next best action recommended before
		(SELECT 1 
		FROM publish.Salesforce_NextBestActions NBA
		WHERE 
		BT.AccountID = NBA.AccountID 
		AND NBA.NextBestActionID = @NextBestActionID_MobileApp   -- This is the Next Best Action as identified above
		)

UPDATE publish.Salesforce_NextBestActions  -- Updates the Next Best Actions if the previously suggested EOL mobile app is no longer relevant once a user has accessed a division of their license using the mobile app
SET
	Suggest = 0
	, DateTimeLastModified = GETDATE() 
FROM
	(
		SELECT 
			CI_EventID
			, BT.AccountID
		FROM publish.Salesforce_NextBestActions NBA
		INNER JOIN  publish.Salesforce_NextBestAction_BuildTable  BT  
			ON BT.AccountID = NBA.AccountID
		WHERE 
			NBA.NextBestActionID = @NextBestActionID_MobileApp
			AND NBA.Suggest = 1
			AND BT.LatestDateMobileDivisionAccessed IS NOT NULL
	) MA
WHERE publish.Salesforce_NextBestActions.CI_EventID = MA.CI_EventID

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Salesforce Community next best action
-- NOTE this action will only be recommended once. However, in the future we may want to have it on repeat everytime a customer calls an is eligble for the action (such as they did not access the Community in the seven days before the call). This will require new logic.
INSERT INTO publish.Salesforce_NextBestActions (CI_EventID, AccountID, NextBestActionID, DateTimeSelectedForAction, Suggest, DateTimeLastModified)
SELECT
	NEWID() AS CI_EventID
	, AccountID
	, @NextBestActionID_SalesforceCommunity AS NextBestActionID
	, GETDATE() AS DateTimeInserted
	, 1 AS Suggest
	, GETDATE() AS DateTimeLastModified
FROM publish.Salesforce_NextBestAction_BuildTable  BT
WHERE
	(BT.LatestDateTimeCommunityAccessed IS NULL OR DATEDIFF(DAY, LatestDateTimeCommunityAccessed, GETDATE()) >=7 ) -- Selects customer for action when no user from the license has accessed the Salesforce Community, or the last access was more 7 days ago or longer
	AND NOT EXISTS    -- Only adds new records if this customer has not already had this next best action recommended before
		(SELECT 1 
		FROM publish.Salesforce_NextBestActions NBA
		WHERE 
		BT.AccountID = NBA.AccountID 
		AND NBA.NextBestActionID = @NextBestActionID_SalesforceCommunity   -- This is the Next Best Action as identified above
		)


UPDATE publish.Salesforce_NextBestActions  -- Updates the Next Best Actions if the previously suggested recommend Salesforce Community is no longer relevant - if the customer has accessed it recently
SET
	Suggest = 0
	, DateTimeLastModified = GETDATE() 
FROM
	(
		SELECT 
			CI_EventID
			, BT.AccountID
		FROM publish.Salesforce_NextBestActions NBA
		INNER JOIN  publish.Salesforce_NextBestAction_BuildTable  BT  
			ON BT.AccountID = NBA.AccountID
		WHERE 
			NBA.NextBestActionID = @NextBestActionID_SalesforceCommunity
			AND NBA.Suggest = 1
			AND DATEDIFF(DAY, LatestDateTimeCommunityAccessed, GETDATE()) < 7  -- No longer suggests the action if a user has accessed the Salesforce Community in the last seven days
	) SC
WHERE publish.Salesforce_NextBestActions.CI_EventID = SC.CI_EventID


-- ADD INDEXES TO TABLES


GO
