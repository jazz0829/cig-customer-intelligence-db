USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DivisionStartupType]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_DivisionStartupType]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DivisionStartupType]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================
-- Author:		Alex Green
-- Create date: 16-01-2017
-- Description:	Creates the DivisionStartupType table. This is a hard-coded table based on the extract from TFS
--				provided by Maarten Wiertz - TFS (Exact.HRM\Jobs\DivisionCopy\DivisionMaintain.vb(316))
-- =====================================================================================================================


CREATE PROCEDURE [domain].[CreateTable_DivisionStartupType]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.DivisionStartupType', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.DivisionStartupType

CREATE TABLE CustomerIntelligence.domain.DivisionStartupType
(	
	StartupType NCHAR(1) NOT NULL,
	StartupTypeDescription NVARCHAR(50) NULL
)

CREATE CLUSTERED INDEX StartupType ON domain.DivisionStartupType (StartupType)

END
GO
