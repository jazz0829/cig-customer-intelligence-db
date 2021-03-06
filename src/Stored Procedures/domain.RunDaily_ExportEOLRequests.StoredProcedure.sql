USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_ExportEOLRequests]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[RunDaily_ExportEOLRequests]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_ExportEOLRequests]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2016-09-28
-- Description:	Run Daily procedure to build tables from ExportEOLRequests
-- =============================================
CREATE PROCEDURE [domain].[RunDaily_ExportEOLRequests] 
AS
BEGIN

-- TRY STATEMENT CAPTURES ALL OF THE PROCEDURE EXECUTION STATEMENTS OF THE RUN_DAILY JOB. ANY ERRORS THAT ARE OCCUR ARE CAPTURED IN THE CATCH STATEMENT TOWARDS THE BOTTOM OF THE SCRIPT	
BEGIN TRY

--Cancellation
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ExportEOLRequests_Cancellation', 'Start')
	EXEC domain.Load_Cancellation
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ExportEOLRequests_Cancellation', 'End')

-- Complaints 
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ExportEOLRequests_Complaints', 'Start')
	EXEC domain.Load_Complaints
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ExportEOLRequests_Complaints', 'End')

--Consultancy 
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ExportEOLRequests_Consultancy', 'Start')
	EXEC domain.Load_Consultancy
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ExportEOLRequests_Consultancy', 'End')

-- Churn Around 
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ExportEOLRequests_ChurnAround', 'Start')
	EXEC domain.Load_ChurnAround
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ExportEOLRequests_ChurnAround', 'End')

-- Customer Progress Request
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ExportEOLRequests_CustomerProgressRequest', 'Start')
--	EXEC domain.Load_CustomerProgressRequest
--INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ExportEOLRequests_CustomerProgressRequest', 'End')

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
