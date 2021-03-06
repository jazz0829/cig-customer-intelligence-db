USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Loop_AppUsageMonthlyDate]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Loop_AppUsageMonthlyDate]
GO
/****** Object:  StoredProcedure [domain].[Loop_AppUsageMonthlyDate]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-07-10
-- Description:	Loop for getting the right month to run the load procedure to fill the ActivityMonthly table
-- =============================================
CREATE PROCEDURE  [domain].[Loop_AppUsageMonthlyDate] (@LastUpdatedMonth Date, @AppID uniqueidentifier) AS
DECLARE 
	@EndMonth date,
	@StartMonth date

SET @StartMonth = Cast((SELECT ISNULL (Cast(DATEADD(MM,1,LastUpdatedMonth)as datetime), Cast('2018-03-01' as Date)) FROM config.Activities_Apps WHERE ApplicationID = @AppID)as date)

SET @EndMonth = '2018-08-01'

--SET @EndMonth = (Select Cast(dateadd(dd,-(day((Select Cast(StartDate AS DATE) FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported]))-1),(Select StartDate FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported])) As Date)) 

WHILE @StartMonth < @EndMonth 
BEGIN
   -- Executes the Load_AccountsContract_PerMonth procedure. This is executed as long as the previous fetch succeeds.
   BEGIN
   EXEC domain.Load_ActivityMonthly_AppUsage @StartMonth, @AppID, @LastUpdatedMonth		--@EndDate is the output variable used for InputEndDate in the Load_AccountsContract_PerMonth procedure
   UPDATE config.Activities_Apps SET LastUpdatedMonth = @StartMonth Where ApplicationID=@AppID 
   END

   SET @StartMonth = DATEADD(month, 1, @StartMonth);
   
 
END
GO
