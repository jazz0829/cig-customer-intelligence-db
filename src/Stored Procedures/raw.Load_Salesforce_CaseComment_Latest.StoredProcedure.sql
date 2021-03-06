USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_CaseComment_Latest]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Salesforce_CaseComment_Latest]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_CaseComment_Latest]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-02-05
-- Description:	Load Procedure Latest Salesforce Table
-- =============================================
CREATE PROCEDURE [raw].[Load_Salesforce_CaseComment_Latest] 

AS

BEGIN 
TRUNCATE TABLE raw.Salesforce_CaseComment_Latest
END
BEGIN
	
WITH Salesforce_CaseComment_Latest
	(
	Id, 
	CommentBody, 
	CreatedById, 
	CreatedDate, 
	IsDeleted, 
	IsPublished, 
	LastModifiedById, 
	LastModifiedDate, 
	ParentId, 
	EtlInsertTime, 
	RN)
	AS
	(
		SELECT 
			Id, 
			CommentBody, 
			CreatedById, 
			CreatedDate, 
			IsDeleted, 
			IsPublished, 
			LastModifiedById, 
			LastModifiedDate, 
			ParentId, 
			EtlInsertTime,
			ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
		FROM [raw].[Salesforce_CaseComment]
	)

INSERT INTO raw.Salesforce_CaseComment_Latest
	(
	[Id], 
	[CommentBody], 
	[CreatedById], 
	[CreatedDate], 
	[IsDeleted], 
	[IsPublished],
	[LastModifiedById], 
	[LastModifiedDate], 
	[ParentId], 
	[EtlInsertTime]
	)
	SELECT 
		Id, 
		CommentBody, 
		CreatedById, 
		CreatedDate, 
		IsDeleted, 
		IsPublished, 
		LastModifiedById, 
		LastModifiedDate, 
		ParentId, 
		EtlInsertTime
	FROM Salesforce_CaseComment_Latest
	WHERE RN = 1
END
GO
