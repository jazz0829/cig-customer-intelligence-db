USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_Verint]    Script Date: 08-Nov-18 17:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2016-08-28
-- Description:	Procedure Run Daily that builds tables from the verint Verint survey data
-- =============================================
ALTER PROCEDURE [domain].[RunDaily_Verint] 
AS
BEGIN

-- TRY STATEMENT CAPTURES ALL OF THE PROCEDURE EXECUTION STATEMENTS OF THE RUN_DAILY JOB. ANY ERRORS THAT ARE OCCUR ARE CAPTURED IN THE CATCH STATEMENT TOWARDS THE BOTTOM OF THE SCRIPT	
BEGIN TRY

-- CoCreate Data summarised
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Verint_CoCreate', 'Start')
--	EXEC domain.Load_CoCreate_Execute
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Verint_CoCreate', 'End')

-- CoCreate from raw to domain table
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Verint_CoCreateRawToDomain', 'Start')
	EXEC domain.Load_CoCreate_RawToDomain
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Verint_CoCreateRawToDomain', 'End')

-- Cleaning CoCreate domain table 
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Verint_CleaningCoCreate', 'Start')
	EXEC domain.Load_CleaningCoCreate
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Verint_CleaningCoCreate', 'End')

-- Cleaning CoCreate domain table 
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Verint_CoCreateRawToDomain_NewSurvey', 'Start')
	EXEC [domain].[Load_CoCreate_RawToDomain_NewSurvey]
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Verint_CoCreateRawToDomain_NewSurvey', 'End')

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
