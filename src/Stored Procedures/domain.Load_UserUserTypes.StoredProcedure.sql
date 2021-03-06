USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_UserUserTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_UserUserTypes]
GO
/****** Object:  StoredProcedure [domain].[Load_UserUserTypes]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 30-09-2016
-- Description:	This job truncates the existing domain.UserUserTypes table and inserts the most recent backup record from the raw UserUserTypes 
--				table.
-- ============================================================================================================================================================

CREATE PROCEDURE [domain].[Load_UserUserTypes]

AS
BEGIN

TRUNCATE TABLE CustomerIntelligence.domain.UserUserTypes ;

WITH CTE_BackupUserUserTypes
AS
	(
		SELECT
		   [UserID]
		  ,[UserType]
		  ,[StartDate]
		  ,[syscreated]
		  ,[sysmodified]
		  ,[sysmodifier]
		  ,[CIGCopyTime]
		  ,[Environment]
		  ,[syscreator]
		  ,[EndDate]
		  ,[InvoiceAccount]
		  ,[InvoicedUntil]
		  , ROW_NUMBER() OVER(PARTITION BY [UserID] ORDER BY CIGCopyTime desc, sysCreated desc) AS RowNumber	-- Creates a row number grouped on the UserID with the latest CIGCopyTime record with row number 1
			
		FROM
			CustomerIntelligence.[raw].[HOST_CIG_UserUserTypes]
	)

INSERT INTO CustomerIntelligence.domain.UserUserTypes
(		
	   [UserID]
      ,[UserTypeID]
      ,[Environment]
      ,[StartDate]
      ,[EndDate]
      ,[InvoiceAccount]
      ,[InvoicedUntil]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[CIGCopyTime]
)

SELECT 
   	   [UserID]
      ,[UserType] AS [UserTypeID]
      ,[Environment]
      ,[StartDate]
      ,[EndDate]
      ,[InvoiceAccount]
      ,[InvoicedUntil]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[CIGCopyTime]    
	   

FROM
	CTE_BackupUserUserTypes

WHERE 
	RowNumber = 1					 -- Selects the latest CIGCopyTime row to insert into the domain table

END
GO
