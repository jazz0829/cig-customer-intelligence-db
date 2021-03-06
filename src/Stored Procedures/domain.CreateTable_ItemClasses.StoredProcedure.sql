USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ItemClasses]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ItemClasses]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ItemClasses]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_ItemClasses]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.ItemClasses', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.ItemClasses

CREATE TABLE domain.ItemClasses
	(
	ID uniqueidentifier NOT NULL, 
	Division int NOT NULL, 
	ClassID INT NOT NULL, 
	Code nvarchar(30) NOT NULL, 
	Description nvarchar(60) NULL, 
	DescriptionTermID int NULL, 
	Notes nvarchar(max) NULL, 
	CIGCopyTime datetime NULL, 
	Environment nchar(3), 
	CIGProcessed bit NULL
	)
END
GO
