USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Contacts]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Contacts]
GO
/****** Object:  StoredProcedure [domain].[Load_Contacts]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [domain].[Load_Contacts]

AS
BEGIN

-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 12-12-2016
-- Description:	This job truncates the existing domain.Contacts table and inserts the most recent backup record from the raw Contacts table
-- ============================================================================================================================================================

TRUNCATE TABLE CustomerIntelligence.domain.Contacts; 

WITH CTE_BackupContacts
AS
	(
		SELECT
			[ID] AS ContactID
			,[Person] AS PersonID
			,[Division] AS DivisionCode
			,[Account] AS AccountID
			,[IsMailingExcluded]
			,[syscreated]
			,[sysmodified]
			,[IsUXParticipant]
			,[CIGCopyTime]
			,[Environment]
			,[sysmodifier]
			,[syscreator]
			,[StartDate]
			,[EndDate]
			,[JobTitleDescription]
			, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RowNumber
			
		FROM
			CustomerIntelligence.[raw].HOST_CIG_Contacts
	) 

INSERT INTO CustomerIntelligence.domain.Contacts
(
	[ContactID],
	[PersonID] ,
	[AccountID] ,	
	[DivisionCode] ,
	[JobTitleDescription] ,	
	[StartDate] ,
	[EndDate] ,	
	[IsMailingExcluded] ,
	[IsUXParticipant] ,
	[Environment] ,
	[syscreated] ,	
	[syscreator] ,
	[sysmodifier] ,
	[sysmodified] ,
	[CIGCopyTime] 
)

SELECT 
	[ContactID],
	[PersonID] ,
	[AccountID] ,	
	[DivisionCode] ,
	[JobTitleDescription] ,	
	[StartDate] ,
	[EndDate] ,	
	[IsMailingExcluded] ,
	[IsUXParticipant] ,
	[Environment] ,
	[syscreated] ,	
	[syscreator] ,
	[sysmodifier] ,
	[sysmodified] ,
	[CIGCopyTime] 

FROM
	CTE_BackupContacts
WHERE 
	RowNumber = 1

END
GO
