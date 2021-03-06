USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[Insert_Activities]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[Insert_Activities]
GO
/****** Object:  StoredProcedure [config].[Insert_Activities]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--==========================================
-- THIS PROCEDURE IS USED IN LOAD_ACTIVITIES
--==========================================

CREATE PROC [config].[Insert_Activities] (
	@ActivityID INT, @ActivitySource NVARCHAR(30), @ActivityField NVARCHAR(30), @ActivityDetail NVARCHAR(max),
	@FirstDate datetime, @UpdateMethod NVARCHAR(30), @UpdateMethodProcedure NVARCHAR(30)) 
AS

BEGIN
-- IF AcitvityType does not exist then insert
	IF (
		SELECT @ActivitySource 
		FROM Activities
		WHERE ActivityID = @ActivityID) IS NULL

		INSERT INTO Activities (ActivityID, ActivitySource, ActivityField, ActivityDetail, FirstDate, UpdateMethod, UpdateMethodProcedure)
		VALUES  (@ActivityID, @ActivitySource, @ActivityField, @ActivityDetail, @FirstDate, @UpdateMethod, @UpdateMethodProcedure)
END

GO
