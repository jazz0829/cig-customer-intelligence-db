USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_SkillProfile]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Salesforce_SkillProfile]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_SkillProfile]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [domain].[Load_Salesforce_SkillProfile] 
AS
BEGIN 
TRUNCATE TABLE domain.Salesforce_SkillProfile
END
BEGIN

WITH Salesforce_SkillProfile_Latest
(
		[Id]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[ProfileId]
      ,[SkillId]
      ,[SystemModstamp]
      ,[EtlInsertTime],
	  RN
)
AS
(
	SELECT
	 [Id]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[ProfileId]
      ,[SkillId]
      ,[SystemModstamp]
      ,[EtlInsertTime],
	  ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
	  FROM [CustomerIntelligence].[raw].[Salesforce_SkillProfile]
)

INSERT INTO [domain].[Salesforce_SkillProfile]
	(
		[Id]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[ProfileId]
      ,[SkillId]
      ,[SystemModstamp]
      ,[EtlInsertTime]
	)

	SELECT
		[Id]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[ProfileId]
      ,[SkillId]
      ,[SystemModstamp]
      ,[EtlInsertTime]
	  FROM Salesforce_SkillProfile_Latest
	  WHERE RN = 1

END
GO
