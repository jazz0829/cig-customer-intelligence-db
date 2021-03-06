USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [publish].[Load_MasterActions]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [publish].[Load_MasterActions]
GO
/****** Object:  StoredProcedure [publish].[Load_MasterActions]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================
-- Author:		Jennifer Vink
-- Create date: 07-09-2016
-- Description:	
-- =====================================================================================================================
CREATE PROCEDURE [publish].[Load_MasterActions] (@ActionID INT, @ActionType NVARCHAR(MAX), @ActionSystem NVARCHAR(MAX), @ActionPerformedBy NVARCHAR(MAX), 
											@ActionCurrentlyActive INT, @StoredProcedure NVARCHAR(MAX), @DateStoredProcedureLastRun datetime, 
											@DateStoredProcedureNextRun datetime, @DaysOfActionFrequency INT)
AS

DECLARE @TODAY Date

SET @TODAY= GETDATE()

IF Cast(@DateStoredProcedureNextRun as date) <= Cast(@TODAY as date)
BEGIN
EXEC @StoredProcedure

UPDATE config.Actions
SET DateStoredProcedureLastRun=Cast(@TODAY as date) Where @ActionID=ActionID
UPDATE config.Actions
SET DateStoredProcedureNextRun=Cast(DATEADD(dd,@DaysOfActionFrequency,@TODAY)AS date) Where @ActionID=ActionID

END
GO
