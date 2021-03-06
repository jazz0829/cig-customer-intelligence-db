USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Run_Daily]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Run_Daily]
GO
/****** Object:  StoredProcedure [domain].[Run_Daily]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================================================================================================
-- Author:		Alex Green (based on original script from Ronald Dahne)
-- Create date: 2/12/2015
-- Description:	This is the script scheduled to run daily that executes all the load table stored procedures. The start and end times for each 
--				stored procedure are recorded in the JobLog. Any errors that occur are stored in the ErrorLog table.
--=============================================================================================================================================

CREATE PROC [domain].[Run_Daily] AS

BEGIN

-- TRY STATEMENT CAPTURES ALL OF THE PROCEDURE EXECUTION STATEMENTS OF THE RUN_DAILY JOB. ANY ERRORS THAT ARE OCCUR ARE CAPTURED IN THE CATCH STATEMENT TOWARDS THE BOTTOM OF THE SCRIPT	
BEGIN TRY

--LINKED ACCOUNTANT CHANGES - THIS NEEDS TO RUN FIRST AS IT DOES A COMPARISON BETWEEN THE NEW CONTRACT STATISTICS TABLE AND OUR DAY OLD ACCOUNTS TABLE
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'LinkedAccountantLog', 'Start')
	EXEC domain.Load_LinkedAccountantLog
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'LinkedAccountantLog', 'End')


--ACTIVITY RELATED DATA
--Activities
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Activities', 'Start')
--	EXEC domain.Load_Activities
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Activities', 'End')

--Cancellation
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Cancellation', 'Start')
	EXEC domain.Load_Cancellation
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Cancellation', 'End')

--CONTRACT RELATED DATA	
-- Contracts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Contracts', 'Start')
	EXEC domain.Load_Contracts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Contracts', 'End')

--ACCOUNT RELATED DATA
-- Accounts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Accounts', 'Start')
	EXEC domain.Load_Accounts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Accounts', 'End')

--CONTRACT RELATED DATA	CONTINUED
-- Account Contracts Summary
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'AccountsContract_Summary', 'Start')
	EXEC domain.Load_AccountsContract_Summary
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'AccountsContract_Summary', 'End')

-- Account Contracts Per Month
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'AccountsContract_PerMonth', 'Start')
	EXEC domain.Loop_AccountsContract_PerMonth 
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'AccountsContract_PerMonth', 'End')

-- Package Classification
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'PackageClassification', 'Start')
	EXEC domain.Load_PackageClassification
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'PackageClassification', 'End')

-- Item Classification
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ItemClassification', 'Start')
	EXEC domain.Load_ItemClassification
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ItemClassification', 'End')

-- Contract Event Types
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractEventTypes', 'Start')
	EXEC domain.Load_ContractEventTypes
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractEventTypes', 'End')


--ACCOUNT RELATED DATA CONTINUED
-- Accountants
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Accountants', 'Start')
	EXEC domain.Load_Accountants
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Accountants', 'End')

-- Accounts Classifications
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'AccountsClassifications', 'Start')
	EXEC domain.Load_AccountsClassifications
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'AccountsClassifications', 'End')

--Accounts Manager
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'AccountsManager', 'Start')
	EXEC domain.Load_AccountsManager
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'AccountsManager', 'End')

--Lead Sources
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'LeadSources', 'Start')
	EXEC domain.Load_LeadSources
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'LeadSources', 'End')

--Reseller
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Reseller', 'Start')
	EXEC domain.Load_Reseller
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Reseller', 'End')

-- THE FOLLOWING ACCOUNT SUPPORT TABLES DO NOT NECESSARILY NEED TO BE RUN EVERYDAY 
-- Business Types
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'BusinessTypes', 'Start')
	EXEC domain.Load_BusinessTypes
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'BusinessTypes', 'End')

-- Company Size
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'CompanySize', 'Start')
	EXEC domain.Load_CompanySize
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'CompanySize', 'End')

-- Sectors
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Sectors', 'Start')
	EXEC domain.Load_Sectors
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Sectors', 'End')

--Sub Sectors
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'SubSectors', 'Start')
	EXEC domain.Load_SubSectors
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'SubSectors', 'End')

--Opportunities
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Opportunities', 'Start')
	EXEC domain.Load_Opportunities
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Opportunities', 'End')


--REQUEST RELATED DATA
-- Complaints Import
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Complaints', 'Start')
	EXEC domain.Load_Complaints
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Complaints', 'End')

--Consultancy Import
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Consultancy', 'Start')
	EXEC domain.Load_Consultancy
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Consultancy', 'End')


-- Daily Activity | Support Cases
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'DailyActivity', 'Start')
--	EXEC Loop_ActivitiesActivityID
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'DailyActivity', 'End')

-- Churn Around based on Support Cases
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ChurnAround', 'Start')
	EXEC domain.Load_ChurnAround
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ChurnAround', 'End')


---- COCREATE

-- CoCreate Data summarised
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'CoCreate', 'Start')
	EXEC domain.Load_CoCreate_Execute
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'CoCreate', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'CoCreate raw to domain', 'Start')
	EXEC domain.Load_CoCreate_RawToDomain
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'CoCreate raw to domain', 'End')


---- PRODUCT SUMMARY
---- Load the ActivityMonthly_ProductSummary table that the Product Summary is built on
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ProductSummary', 'Start')
	EXEC publish.Load_ActivityMonthly_ProductSummary
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ProductSummary', 'End')


----ASPX INFORMATION
--Load_AspxProductEdition
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'AspxProductEdition', 'Start')
	EXEC config.Load_AspxProductEdition
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'AspxProductEdition', 'End')


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
