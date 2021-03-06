USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[CreateTable_LeadSources]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[CreateTable_LeadSources]
GO
/****** Object:  StoredProcedure [raw].[CreateTable_LeadSources]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [raw].[CreateTable_LeadSources]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.raw.Leadsources', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.raw.LeadSources

CREATE TABLE raw.LeadSources
	(
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[Active] [tinyint] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[Notes] [nvarchar](max) NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermID] [int] NULL
	)
END
GO
