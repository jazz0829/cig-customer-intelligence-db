USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_ContractStatistics]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[RunDaily_ContractStatistics]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_ContractStatistics]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jennifer Vink
-- Create date: 28-09-2016
-- Description:	Run Daily procedure for Tables coming from ContractStatistics
-- =============================================
CREATE PROCEDURE [domain].[RunDaily_ContractStatistics] 
AS
BEGIN

-- TRY STATEMENT CAPTURES ALL OF THE PROCEDURE EXECUTION STATEMENTS OF THE RUN_DAILY JOB. ANY ERRORS THAT ARE OCCUR ARE CAPTURED IN THE CATCH STATEMENT TOWARDS THE BOTTOM OF THE SCRIPT	
BEGIN TRY

--LINKED ACCOUNTANT CHANGES - THIS NEEDS TO RUN FIRST AS IT DOES A COMPARISON BETWEEN THE NEW CONTRACT STATISTICS TABLE AND OUR DAY OLD ACCOUNTS TABLE
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_LinkedAccountantLog', 'Start')
	EXEC domain.Load_LinkedAccountantLog
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_LinkedAccountantLog', 'End')

-- Contracts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_Contracts', 'Start')
	EXEC domain.Load_Contracts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_Contracts', 'End')

-- Accounts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_Accounts', 'Start')
	EXEC domain.Load_Accounts
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_Accounts', 'End')

-- Account Contracts Summary
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_AccountsContract_Summary', 'Start')
	EXEC domain.Load_AccountsContract_Summary
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_AccountsContract_Summary', 'End')

-- Account Contracts Per Month
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_AccountsContract_PerMonth', 'Start')
	EXEC domain.Loop_AccountsContract_PerMonth 
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_AccountsContract_PerMonth', 'End')

-- Package Classification (original table: ContractData.dbo.EOL_ReportingStructure)
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_PackageClassification', 'Start')
	EXEC domain.Load_PackageClassification
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_PackageClassification', 'End')

-- Item Classification
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_ItemClassification', 'Start')
	EXEC domain.Load_ItemClassification
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_ItemClassification', 'End')

-- Contract Event Types
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_ContractEventTypes', 'Start')
	EXEC domain.Load_ContractEventTypes
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_ContractEventTypes', 'End')

-- Accountants
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_Accountants', 'Start')
	EXEC domain.Load_Accountants
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_Accountants', 'End')

-- Accounts Classifications
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_AccountsClassifications', 'Start')
	EXEC domain.Load_AccountsClassifications
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_AccountsClassifications', 'End')

--Accounts Manager
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_AccountsManager', 'Start')
	EXEC domain.Load_AccountsManager
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_AccountsManager', 'End')

--Reseller
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_Reseller', 'Start')
	EXEC domain.Load_Reseller
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_Reseller', 'End')

-- Business Types
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_BusinessTypes', 'Start')
	EXEC domain.Load_BusinessTypes
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_BusinessTypes', 'End')

-- Company Size
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_CompanySize', 'Start')
	EXEC domain.Load_CompanySize
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_CompanySize', 'End')

-- Sectors
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_Sectors', 'Start')
	EXEC domain.Load_Sectors
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_Sectors', 'End')

--Sub Sectors
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_SubSectors', 'Start')
	EXEC domain.Load_SubSectors
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ContractStatistics_SubSectors', 'End')

--Contracthistory
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'CustomerProfile_ContractHistory', 'Start')
	EXEC publish.Load_CustomerProfile_ContractHistory
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'CustomerProfile_ContractHistory', 'End')


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
