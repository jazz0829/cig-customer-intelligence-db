USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_LiveChatVisitor]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Salesforce_LiveChatVisitor]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_LiveChatVisitor]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [domain].[Load_Salesforce_LiveChatVisitor] 
AS
BEGIN 
TRUNCATE TABLE domain.Salesforce_LiveChatVisitor
END
BEGIN

WITH Salesforce_LiveChatVisitor_Latest
(
		[Id]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[Name]
      ,[SessionKey]
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
      ,[Name]
      ,[SessionKey]
      ,[SystemModstamp]
      ,[EtlInsertTime],
	  ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
	  FROM [CustomerIntelligence].[raw].[Salesforce_LiveChatVisitor]
)

INSERT INTO [domain].[Salesforce_LiveChatVisitor]
	(
		[Id]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[Name]
      ,[SessionKey]
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
      ,[Name]
      ,[SessionKey]
      ,[SystemModstamp]
      ,[EtlInsertTime]
	  FROM Salesforce_LiveChatVisitor_Latest
	  WHERE RN = 1

END
GO
