USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CompanySize]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_CompanySize]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CompanySize]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_CompanySize]

AS
BEGIN

-- ==============================================================
-- Author:		Alex Green
-- Create date: 1-12-2015
-- Description:	Creates the CompanySize Accounts support table
-- ==============================================================

IF OBJECT_ID (N'CustomerIntelligence.domain.CompanySize', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.CompanySize

CREATE TABLE CustomerIntelligence.domain.CompanySize
(	
	Environment  NCHAR(3) NOT NULL,
	CompSizeCode NVARCHAR(10) NOT NULL,
	CompSizeDescription NVARCHAR(60) NULL,
)

CREATE CLUSTERED INDEX CompSizeCode ON CompanySize (Environment, CompSizeCode)

END
GO
