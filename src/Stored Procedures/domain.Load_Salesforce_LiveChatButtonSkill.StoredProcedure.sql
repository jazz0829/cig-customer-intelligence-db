USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_LiveChatButtonSkill]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Salesforce_LiveChatButtonSkill]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_LiveChatButtonSkill]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [domain].[Load_Salesforce_LiveChatButtonSkill] 
AS
BEGIN 
TRUNCATE TABLE domain.Salesforce_LiveChatButtonSkill
END
BEGIN

WITH Salesforce_LiveChatButtonSkill_Latest
(
		[Id]
      ,[ButtonId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[SkillId]
      ,[SystemModstamp]
      ,[EtlInsertTime],
	  RN
)
AS
(
	SELECT
	 [Id]
      ,[ButtonId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[SkillId]
      ,[SystemModstamp]
      ,[EtlInsertTime],
	  ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
	  FROM [CustomerIntelligence].[raw].[Salesforce_LiveChatButtonSkill]
)

INSERT INTO [domain].[Salesforce_LiveChatButtonSkill]
	(
		[Id]
      ,[ButtonId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[SkillId]
      ,[SystemModstamp]
      ,[EtlInsertTime]
	)

	SELECT
		[Id]
      ,[ButtonId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[SkillId]
      ,[SystemModstamp]
      ,[EtlInsertTime]
	  FROM Salesforce_LiveChatButtonSkill_Latest
	  WHERE RN = 1

END
GO
