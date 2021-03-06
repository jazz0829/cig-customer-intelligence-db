USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_BlockingStatus]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_BlockingStatus]
GO
/****** Object:  StoredProcedure [domain].[Load_BlockingStatus]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 30-09-2016
-- Description:	This job truncates the existing domain.BlockingStatus table and inserts the most recent backup record from the raw BlockingStatus 
--				table. The 
-- ============================================================================================================================================================

CREATE PROCEDURE [domain].[Load_BlockingStatus]

AS
BEGIN

TRUNCATE TABLE CustomerIntelligence.domain.BlockingStatus

INSERT INTO CustomerIntelligence.domain.BlockingStatus
(		
	   [BlockingStatusCode] 
      ,[BlockingStatusDescription] 
      ,[DescriptionTermID] 
      ,[DescriptionSuffix] 
      ,[DescriptionSuffixTermID] 
      ,[CIGCopyTime] 
)

SELECT 
	[ID] AS [BlockingStatusCode] 
	,[Description] AS [BlockingStatusDescription]  
	,[DescriptionTermID] 
	,[DescriptionSuffix] 
	,[DescriptionSuffixTermID] 
	,[CIGCopyTime]	

FROM
	(
		SELECT
		   [ID] 
		  ,[Description] 
		  ,[DescriptionTermID] 
		  ,[DescriptionSuffix] 
		  ,[DescriptionSuffixTermID] 
		  ,[CIGCopyTime]
		  , ROW_NUMBER() OVER(PARTITION BY [ID] ORDER BY CIGCopyTime DESC) AS RowNumber	-- Creates a row number grouped on the BlockingStatusID with the latest CIGCopyTime record with row number 1
			
		FROM
			CustomerIntelligence.raw.HOST_CIG_BlockingStatus
		
		WHERE
			Environment = 'NL'			 -- Selects the NL environment as the basis of the table (as the records are identical across environments) 
	
	) AS [Backup]

WHERE 
	RowNumber = 1					 -- Selects the latest CIGCopyTime row to insert into the domain table


DELETE FROM CustomerIntelligence.raw.HOST_CIG_BlockingStatus
WHERE NOT EXISTS  
	(
		SELECT 1
		FROM CustomerIntelligence.domain.BlockingStatus
		WHERE
			CustomerIntelligence.raw.HOST_CIG_BlockingStatus.[ID] = CustomerIntelligence.domain.BlockingStatus.[BlockingStatusCode] 
			AND CustomerIntelligence.raw.HOST_CIG_BlockingStatus.[CIGCopyTime] = CustomerIntelligence.domain.BlockingStatus.[CIGCopyTime] 
	)

	
END	
GO
