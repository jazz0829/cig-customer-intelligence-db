USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_UserTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_UserTypes]
GO
/****** Object:  StoredProcedure [domain].[Load_UserTypes]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 30-09-2016
-- Description:	This job truncates the existing domain.UserTypes table and inserts the most recent backup record from the raw UserTypes 
--				table.
-- ============================================================================================================================================================

CREATE PROCEDURE [domain].[Load_UserTypes]

AS
BEGIN

TRUNCATE TABLE CustomerIntelligence.domain.UserTypes ;

WITH CTE_BackupUserTypes 
AS
	( 
		SELECT
		   [Item]
		  ,[ID]
		  ,[Code]
		  ,[Description]
		  ,[sysmodified]
		  ,[syscreated]
		  ,[syscreator]
		  ,[sysmodifier]
		  ,[GettingStartedPage]
		  ,[CIGCopyTime]
		  ,[Environment]
		  ,[DescriptionTermId]
		  ,[StartPage]
		  ,[PortalMenu]
		  , ROW_NUMBER() OVER(PARTITION BY [ID], [Item] ORDER BY Environment DESC, CIGCopyTime DESC) AS RowNumber	-- Creates a row number grouped on the UserTypeID with the latest CIGCopyTime record with row number 1. In the case of a single ID with multiple descriptions across environments it is selected in descending country order (so first US, or if no US then UK, or if no UK then NL etc)
			
		FROM
			CustomerIntelligence.[raw].HOST_CIG_UserTypes
	)

INSERT INTO CustomerIntelligence.domain.UserTypes
(		

	  [UserTypeID]
      ,[UserTypeCode]
      ,[UserTypeDescription]
      ,[UserTypeDescriptionTermId]
      ,[Item]
      ,[StartPage]
      ,[PortalMenu]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[GettingStartedPage]
	  ,[Environment]
      ,[CIGCopyTime] 
)

SELECT 
	  [ID] AS [UserTypeID]
      ,[Code] AS [UserTypeCode]
      ,[Description] AS [UserTypeDescription]
      ,[DescriptionTermId] AS [UserTypeDescriptionTermId]
      ,[Item]
      ,[StartPage]
      ,[PortalMenu]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[GettingStartedPage]
	  ,[Environment]
      ,[CIGCopyTime] 

FROM
	CTE_BackupUserTypes 

WHERE 
	RowNumber = 1					 -- Selects the latest CIGCopyTime row to insert into the domain table

END
GO
