USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_EOLHosting]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[RunDaily_EOLHosting]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_EOLHosting]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [domain].[RunDaily_EOLHosting] 
AS
BEGIN

-- =================================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 08-12-2016
-- Description:	This is the Run Daily component to produce the domain tables from the EOL Hosting raw data coming from the Backup and Restore
--				ETL procedure.
-- =================================================================================================================================================================================

-- TRY STATEMENT CAPTURES ALL OF THE PROCEDURE EXECUTION STATEMENTS OF THE RUN_DAILY JOB. ANY ERRORS THAT ARE OCCUR ARE CAPTURED IN THE CATCH STATEMENT TOWARDS THE BOTTOM OF THE SCRIPT	
BEGIN TRY

-- DIVISIONS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Divisions', 'Start')
	EXEC domain.Load_Divisions
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Divisions', 'End')


-- DIVISIONSTATISTICS_SUMMARY - This is the latest DivisionStatistics row for each Division
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionStatistics_Summary', 'Start')
	EXEC domain.Load_DivisionStatistics_Summary
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionStatistics_Summary', 'End')


-- DIVISIONSTATISTICS_DAILY - This script also includes a command to update the raw DivisionStatistics' Processed field
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionStatistics_Daily', 'Start')
	EXEC domain.Load_DivisionStatistics_Daily
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionStatistics_Daily', 'End')


-- DIVISIONSTATISTICS_DAILYCHANGES
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionStatistics_DailyChanges', 'Start')
	EXEC domain.Load_DivisionStatistics_DailyChanges
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionStatistics_DailyChanges', 'End')


-- USERS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Users', 'Start')
	EXEC domain.Load_Users
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Users', 'End')


-- USERTYPES
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_UserTypes', 'Start')
	EXEC domain.Load_UserTypes
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_UserTypes', 'End')


-- USERUSERTYPES
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_UserUserTypes', 'Start')
	EXEC domain.Load_UserUserTypes
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_UserUserTypes', 'End')


-- PERSONS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Persons', 'Start')
	EXEC domain.Load_Persons
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Persons', 'End')


-- CONTACTS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Contacts', 'Start')
	EXEC domain.Load_Contacts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Contacts', 'End')


-- BLOCKING STATUS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Load_BlockingStatus', 'Start')
	EXEC domain.Load_BlockingStatus
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Load_BlockingStatus', 'End')


-- PAYMENT TERMS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Load_PaymentTerms', 'Start')
	EXEC [raw].Load_PaymentTerms
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Load_PaymentTerms', 'End')

-- USAGE TRANSACTIONS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Load_UsageTransactions', 'Start')
	EXEC domain.Load_UsageTransactions
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Load_UsageTransactions', 'End')


-- NEEDED FOR CONTRACTSTATISTICS
-- ITEMS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Items', 'Start')
	EXEC domain.Load_Items
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Items', 'End')

-- CONTRACTMUTATIONS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ContractMutations', 'Start')
	EXEC domain.Load_ContractMutations
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ContractMutations', 'End')

-- ITEMRELATIONS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ItemRelations', 'Start')
	EXEC domain.Load_ItemRelations
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ItemRelations', 'End')

-- ITEMCLASSES
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ItemClasses', 'Start')
	EXEC domain.Load_ItemClasses
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ItemClasses', 'End')

-- DIVISIONTYPES (STILL TO COME)
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionTypes', 'Start')
--	EXEC domain.Load_DivisionTypes
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionTypes', 'End')

-- ACCOUNTS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Accounts', 'Start')
	EXEC raw.Load_Accounts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Accounts', 'End')

-- ACTIVITYSECTORS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ActivitySectors', 'Start')
	EXEC domain.Load_ActivitySectors
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ActivitySectors', 'End')

---- CompanySizes
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_CompanySizes', 'Start')
--	EXEC domain.Load_CompanySizes
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_CompanySizes', 'End')

---- BUSINESSTYPES
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_BusinessTypes', 'Start')
--	EXEC raw.Load_BusinessTypes
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_BusinessTypes', 'End')

-- CLASSIFICATIONS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Classifications', 'Start')
	EXEC domain.Load_AccountsClassifications
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Classifications', 'End')

-- LEADSOURCES
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_LeadSources', 'Start')
	EXEC domain.Load_LeadSources
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_LeadSources', 'End')

-- CONTRACTEVENTS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ContractEvents', 'Start')
	EXEC domain.Load_ContractEvents
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ContractEvents', 'End')

-- CONTRACTS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Contracts', 'Start')
	EXEC raw.Load_Contracts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Contracts', 'End')

-- CONTRACTLINES
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ContractLines', 'Start')
	EXEC domain.Load_ContractLines
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_ContractLines', 'End')

-- UNITS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Units', 'Start')
	EXEC domain.Load_Units
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_Units', 'End')

-- DIVISIONTYPES
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionTypes', 'Start')
	EXEC domain.Load_DivisionTypes
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionTypes', 'End')

-- DIVISIONDIVISIONTYPES
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionTypes', 'Start')
	EXEC domain.Load_DivisionDivisionTypes
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_DivisionTypes', 'End')


--CREDITMANAGEMENTSTATUS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_CreditManagementStatus', 'Start')
	EXEC domain.Load_CreditManagementStatus
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'EOLHosting_CreditManagementStatus', 'End')

--Person Email
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Persons_Email', 'Start')
	EXEC raw.Load_Persons_Email
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Persons_Email', 'End')

--Users GoogleID
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'User_GoogleID', 'Start')
	EXEC raw.Load_Users_GoogleClientID
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'User_GoogleID', 'End')

--DivisionsLog
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'DivisionsLog', 'Start')
	EXEC domain.Load_DivisionsLog
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'DivisionsLog', 'End')


--CustomerSubscriptionStatistics
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'CustomerSubscriptionStatistics', 'Start')
	EXEC domain.Load_CustomerSubscriptionStatistics
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'CustomerSubscriptionStatistics', 'End')

--SurveyResults
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'SurveyResults', 'Start')
	EXEC domain.Load_SurveyResults
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'SurveyResults', 'End')

--SurveyResults_NotLinkToAccountant
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'SurveyResults_NotLinkToAccountant', 'Start')
	EXEC domain.Load_SurveyResults_NotLinkToAccountant
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'SurveyResults_NotLinkToAccountant', 'End')


-- SubscriptionQuotations
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'SubscriptionQuotations', 'Start')
	EXEC domain.Load_SubscriptionQuotations
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'SubscriptionQuotations', 'End')


-- SalesHandoverDocument
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'SalesHandoverDocument', 'Start')
	EXEC domain.Load_SalesHandoverDocument
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'SalesHandoverDocument', 'End')


END TRY

-- CAPTURES ANY ERRORS THAT OCCUR IN THE STORED PROCEDURES AND INSERTS THEM INTO THE ERRORLOG TABLE	
BEGIN CATCH
    INSERT INTO CustomerIntelligence.config.ErrorLog
		(
			Occurrence 
			, ErrorProcedure 
			, ErrorMessage 
			, ErrorNumber 
			, ErrorSeverity 
			, ErrorState 
			, ErrorLine
		)
	SELECT 
		   GETDATE() AS Occurrence 
		 , ERROR_PROCEDURE() AS ErrorProcedure 
		 , ERROR_MESSAGE() AS ErrorMessage
		 , ERROR_NUMBER() AS ErrorNumber 
         , ERROR_SEVERITY() AS ErrorSeverity 
         , ERROR_STATE() as ErrorState 
         , ERROR_LINE() as ErrorLine;

END CATCH

END
GO
