USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Users]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Users]
GO
/****** Object:  StoredProcedure [domain].[Load_Users]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 28-09-2016
-- Description:	This job truncates the existing domain.Users table and inserts the most recent backup record from the raw Users table.
-- ============================================================================================================================================================

CREATE PROCEDURE [domain].[Load_Users]

AS
BEGIN

TRUNCATE TABLE CustomerIntelligence.domain.Users; 

WITH CTE_BackupUsers 
AS
	(
		SELECT
			Environment
			,[ID] AS UserID
			,[HID]
			,[Customer] AS AccountID
			,[Person] AS PersonID
			,[FullName]
			,[Digipass]	
			,[AuthenticationType]
			,[LockoutTime]
			,[LockoutAttempts]
			,[Blocked]
			,[StartDate]
			,[EndDate]
			,[ValidationDate]
			,[ValidationID]
			,[LastLogin]
			,[syscreator]
			,[syscreated]
			,[sysmodifier]
			,[sysmodified]
			,[CIGCopyTime]
			,[TotpRegistrationUtcDate] 
			,[TotpSkippedUtc]
			,[TotpForcedByExactUtc] 
			,[MarketingOptInDate] 
			,[MarketingOptOutDate] 
			, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RowNumber
			
		FROM
			CustomerIntelligence.[raw].HOST_CIG_Users
	) 

INSERT INTO CustomerIntelligence.domain.Users
(
	   [Environment]
      ,[UserID]
	  ,[HID]
      ,[AccountID]
      ,[PersonID]
      ,[FullName]
      ,[Digipass]
      ,[AuthenticationType]
      ,[LockoutTime]
      ,[LockoutAttempts]
      ,[Blocked]
      ,[StartDate]
      ,[EndDate]
      ,[ValidationDate]
      ,[ValidationID]
      ,[LastLogin]
      ,[syscreator]
      ,[syscreated]
      ,[sysmodifier]
      ,[sysmodified]
      ,[CIGCopyTime]
	  ,[TotpRegistrationUtcDate] 
	  ,[TotpSkippedUtc]
	  ,[TotpForcedByExactUtc] 
	  ,[MarketingOptInDate] 
	  ,[MarketingOptOutDate] 
)

SELECT 
	Environment
	,UserID
	,HID
	,AccountID
	,PersonID
	,[FullName]
	,[Digipass]	
	,[AuthenticationType]
	,[LockoutTime]
	,[LockoutAttempts]
	,[Blocked]
	,[StartDate]
	,[EndDate]
	,[ValidationDate]
	,[ValidationID]
	,[LastLogin]
	,[syscreator]
	,[syscreated]
	,[sysmodifier]
	,[sysmodified]
	,[CIGCopyTime]
	,[TotpRegistrationUtcDate] 
	,[TotpSkippedUtc]
	,[TotpForcedByExactUtc] 
	,[MarketingOptInDate] 
	,[MarketingOptOutDate] 
FROM
	CTE_BackupUsers
WHERE 
	RowNumber = 1

END
GO
