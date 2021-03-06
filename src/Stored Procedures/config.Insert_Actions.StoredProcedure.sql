USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[Insert_Actions]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[Insert_Actions]
GO
/****** Object:  StoredProcedure [config].[Insert_Actions]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 07-09-2016
-- Description:	
-- =============================================
CREATE PROCEDURE [config].[Insert_Actions] (
	-- Add the parameters for the stored procedure here
	@ActionID INT, @ActionType NVARCHAR(50), @ActionSystem NVARCHAR(50), @ActionDescription NVARCHAR(max),
	@ActionPerformedBy NVARCHAR(50), @ActionCurrentlyActive int, @StoredProcedure nvarchar(100),
	@DateStoredProcedureLastRun datetime,@DateStoredProcedureNextRun datetime, @FurtherInformation NVARCHAR(max),@DaysOfActionFrequency int)
AS
BEGIN
-- IF AcitvityType does not exist then insert
	IF (
		SELECT @ActionSystem 
		FROM Actions
		WHERE ActionID = @ActionID) IS NULL

		INSERT INTO Actions (ActionID, ActionType, ActionSystem, ActionDescription, ActionPerformedBy, ActionCurrentlyActive, StoredProcedure, DateStoredProcedureLastRun, DateStoredProcedureNextRun, FurtherInformation, DaysOfActionFrequency)
		VALUES  (@ActionID, @ActionType, @ActionSystem, @ActionDescription, @ActionPerformedBy, @ActionCurrentlyActive, @StoredProcedure, @DateStoredProcedureLastRun, @DateStoredProcedureNextRun, @FurtherInformation, @DaysOfActionFrequency)
END


GO
