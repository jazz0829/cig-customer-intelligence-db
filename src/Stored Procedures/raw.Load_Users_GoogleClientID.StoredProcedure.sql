USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Users_GoogleClientID]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Users_GoogleClientID]
GO
/****** Object:  StoredProcedure [raw].[Load_Users_GoogleClientID]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 09-03-2018
-- Description:	This job truncates the existing raw.Users_GoogleClientID table and inserts the most recent backup record from the raw Users table.
-- ============================================================================================================================================================
CREATE PROCEDURE [raw].[Load_Users_GoogleClientID]

AS
BEGIN

TRUNCATE TABLE [raw].Users_GoogleClientID;

WITH CTE_BackupUsers
AS

	(
		SELECT
		  [ID]
		  ,[GoogleClientID]
		  , ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RowNumber	-- Creates a row number grouped on the PersonID with the latest CIGCopyTime record with row number 1
		FROM
			[raw].HOST_CIG_Users
	)


INSERT INTO [raw].Users_GoogleClientID
(
		  [UserID]
		  ,[GoogleClientID]
)

SELECT
	[ID] AS [UserID]
	,[GoogleClientID]

FROM
	CTE_BackupUsers

WHERE
	RowNumber = 1					-- Selects the latest CIGCopyTime row to insert into the domain table

END
GO
