USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Sectors]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Sectors]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Sectors]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =========================================================
-- Author:		Alex Green
-- Create date: 1-12-2015
-- Description:	Creates the Sectors Accounts support table
-- =========================================================

CREATE PROCEDURE [domain].[CreateTable_Sectors]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.Sectors', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.Sectors

CREATE TABLE CustomerIntelligence.domain.Sectors
(	
	Environment  NCHAR(3) NOT NULL,
	SectorCode NVARCHAR(10) NOT NULL,
	SectorDescription NVARCHAR(150) NULL,
)

CREATE CLUSTERED INDEX SectorCode ON Sectors(Environment, SectorCode)

END

GO
