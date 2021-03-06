USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [publish].[Loop_ActionID]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [publish].[Loop_ActionID]
GO
/****** Object:  StoredProcedure [publish].[Loop_ActionID]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 07-09-2016
-- Description:	Loop for the actionID
-- =============================================
CREATE PROCEDURE [publish].[Loop_ActionID] 
AS
DECLARE @ActionID INT,
		@ActionType NVARCHAR(MAX),
		@ActionSystem NVARCHAR(MAX),
		@ActionPerformedBy NVARCHAR(MAX),
		@ActionCurrentlyActive INT,
		@StoredProcedure NVARCHAR(MAX),
		@DateStoredProcedureLastRun datetime,
		@DateStoredProcedureNextRun datetime,
		@DaysOfActionFrequency int
		
DECLARE ActionCursor CURSOR FOR 
		SELECT ActionID, ActionType, ActionSystem, ActionPerformedBy, ActionCurrentlyActive, StoredProcedure, DateStoredProcedureLastRun, DateStoredProcedureNextRun,DaysOfActionFrequency
		FROM [CustomerIntelligence].[config].[Actions]
		WHERE ActionID='4'
		ORDER BY ActionID

OPEN ActionCursor

FETCH NEXT FROM ActionCursor
INTO 
		@ActionID, 
		@ActionType, 
		@ActionSystem,
		@ActionPerformedBy, 
		@ActionCurrentlyActive, 
		@StoredProcedure, 
		@DateStoredProcedureLastRun, 
		@DateStoredProcedureNextRun, 
		@DaysOfActionFrequency

WHILE @@FETCH_STATUS = 0
BEGIN

	EXEC [publish].[Load_MasterActions] @ActionID, @ActionType, @ActionSystem, @ActionPerformedBy, @ActionCurrentlyActive, @StoredProcedure, @DateStoredProcedureLastRun, @DateStoredProcedureNextRun, @DaysOfActionFrequency

	FETCH NEXT FROM ActionCursor
	INTO 
		@ActionID, 
		@ActionType, 
		@ActionSystem,
		@ActionPerformedBy, 
		@ActionCurrentlyActive, 
		@StoredProcedure, 
		@DateStoredProcedureLastRun, 
		@DateStoredProcedureNextRun, 
		@DaysOfActionFrequency
		
END

CLOSE ActionCursor
DEALLOCATE ActionCursor
GO
