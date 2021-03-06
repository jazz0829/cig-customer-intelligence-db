USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_BusinessTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_BusinessTypes]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_BusinessTypes]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_BusinessTypes]

AS
BEGIN

-- ==============================================================
-- Author:		Alex Green
-- Create date: 1-12-2015
-- Description:	Loads the BusinessTypes Accounts support table
-- ==============================================================

IF OBJECT_ID (N'CustomerIntelligence.domain.BusinessTypes', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.BusinessTypes

CREATE TABLE CustomerIntelligence.domain.BusinessTypes
(	
	Environment  NCHAR(3) NOT NULL,
	BusTypeCode NVARCHAR(10) NOT NULL,
	BusTypeDescription NVARCHAR(150) NULL,
)
END

GO
