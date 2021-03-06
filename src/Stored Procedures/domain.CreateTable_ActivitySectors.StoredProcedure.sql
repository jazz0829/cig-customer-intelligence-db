USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ActivitySectors]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ActivitySectors]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ActivitySectors]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_ActivitySectors]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.ActivitySectors', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.ActivitySectors
CREATE TABLE domain.ActivitySectors
	(
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermID] [int] NULL,
	[Parent] [uniqueidentifier] NULL
	)
END
GO
