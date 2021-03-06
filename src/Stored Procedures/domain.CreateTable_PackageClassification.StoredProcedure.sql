USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_PackageClassification]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_PackageClassification]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_PackageClassification]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================
-- Author:		Alex Green (based on original script from Jennifer Vink)
-- Create date: 24-11-2015
-- Description:	Creates the PackageClassification table
-- =====================================================================

CREATE PROCEDURE [domain].[CreateTable_PackageClassification] 

AS
BEGIN
IF OBJECT_ID (N'CustomerIntelligence.domain.PackageClassification', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.PackageClassification

CREATE TABLE CustomerIntelligence.domain.PackageClassification
(
	Environment nchar(3),
	PackageCode nvarchar(50),
	Edition nvarchar(18),
	Product nvarchar(30),
	Solution nvarchar(18)
)
END

CREATE CLUSTERED INDEX EnviroPackage ON PackageClassification (Environment, PackageCode)
GO
