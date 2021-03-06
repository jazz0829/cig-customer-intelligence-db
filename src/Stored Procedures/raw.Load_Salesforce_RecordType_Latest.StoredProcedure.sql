USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_RecordType_Latest]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Salesforce_RecordType_Latest]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_RecordType_Latest]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-02-05
-- Description:	Load Procedure Latest Salesforce Table
-- =============================================
CREATE PROCEDURE [raw].[Load_Salesforce_RecordType_Latest] 

AS

BEGIN 
TRUNCATE TABLE raw.Salesforce_RecordType_Latest
END
BEGIN
WITH Salesforce_RecordType_Latest
	(
	Id, 
	Name, 
	Description, 
	IsActive, 
	BusinessProcessId, 
	CreatedById, 
	CreatedDate, 
	DeveloperName, 
	LastModifiedById, 
	LastModifiedDate, 
	NamespacePrefix, 
	SobjectType, 
	SystemModstamp, 
	EtlInsertTime, 
	RN)
	AS
	(
		SELECT 
			Id, 
			Name, 
			Description, 
			IsActive, 
			BusinessProcessId, 
			CreatedById, 
			CreatedDate, 
			DeveloperName,
			LastModifiedById, 
			LastModifiedDate, 
			NamespacePrefix, 
			SobjectType, 
			SystemModstamp, 
			EtlInsertTime,
			ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
		FROM [raw].[Salesforce_RecordType]
	)

INSERT INTO raw.Salesforce_RecordType_Latest
	(
	[Id], 
	[Name], 
	[Description], 
	[IsActive], 
	[BusinessProcessId], 
	[CreatedById], 
	[CreatedDate], 
	[DeveloperName], 
	[LastModifiedById],
	[LastModifiedDate], 
	[NamespacePrefix], 
	[SobjectType], 
	[SystemModstamp], 
	[EtlInsertTime]
	)
SELECT 
	Id, 
	Name, 
	Description, 
	IsActive, 
	BusinessProcessId,
	CreatedById, 
	CreatedDate, 
	DeveloperName, 
	LastModifiedById, 
	LastModifiedDate, 
	NamespacePrefix, 
	SobjectType, 
	SystemModstamp, 
	EtlInsertTime
FROM Salesforce_RecordType_Latest
WHERE RN = 1

END
GO
