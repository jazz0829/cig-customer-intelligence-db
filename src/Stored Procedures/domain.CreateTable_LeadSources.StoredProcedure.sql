USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_LeadSources]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_LeadSources]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_LeadSources]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_LeadSources]

AS
BEGIN

-- =========================================================
-- Author:		Alex Green
-- Create date: 2-12-2015
-- Description:	Loads the LeadSources Accounts support table
-- =========================================================

IF OBJECT_ID (N'CustomerIntelligence.domain.LeadSources', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.LeadSources

CREATE TABLE CustomerIntelligence.domain.LeadSources
(	
	Environment  NCHAR(3) NOT NULL,
	LeadSourceCode NVARCHAR(10) NOT NULL,
	LeadSourceDescription NVARCHAR(60) NULL
)

CREATE CLUSTERED INDEX LeadSourceCode ON LeadSources (Environment, LeadSourceCode)

END
GO
