USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Loop_ActivityLogDailyDate]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Loop_ActivityLogDailyDate]
GO
/****** Object:  StoredProcedure [domain].[Loop_ActivityLogDailyDate]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-02-20
-- Description:	Daily loop procedure for running ActivityDaily for the ActivityLog part
-- =============================================
CREATE PROCEDURE [domain].[Loop_ActivityLogDailyDate] (@ActivityID INT, @ActivitySource NVARCHAR(MAX), @ActivityField NVARCHAR(MAX), @ActivityDetail NVARCHAR(MAX), @ActivityAction INT, @LogText NVARCHAR(MAX)) AS

DECLARE @StartDate Datetime
DECLARE @EndDate datetime

--StartDate is the lastUpdatedDatetime for that ActivityID
SET @StartDate = (SELECT ISNULL (cast(DATEADD(dd,1,LastUpdatedDateTime) as Datetime), FirstDate) FROM config.Activities WHERE ActivityID = @ActivityID)
--The EndDate is the max(logdatetime) minus 1 day from the raw ActivityLog
SET @EndDate = (Select (DATEADD(d,-1, CONVERT(Date,StartDate))) FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported])

WHILE @StartDate <= @EndDate

BEGIN
	IF ((@ActivityID BETWEEN '1' AND '3') OR (@ActivityID BETWEEN '8' AND '9') OR (@ActivityID BETWEEN '14' AND '15') OR (@ActivityID BETWEEN '5000' AND '60000000')) AND @ActivityID NOT BETWEEN '800000' AND'835313'
	BEGIN
	EXEC [domain].[Load_ActivityDaily_ActivityLog] @StartDate, @ActivityID, @ActivitySource, @ActivityField, @ActivityDetail, @ActivityAction, @LogText
	   UPDATE [config].[Activities] SET LastUpdatedDateTime = @StartDate Where ActivityID=@ActivityID
	END
SET @StartDate = @StartDate + 1;
END
GO
