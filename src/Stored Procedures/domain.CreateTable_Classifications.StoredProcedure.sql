USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Classifications]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Classifications]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Classifications]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Classifications]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.Classifications', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.Classifications

CREATE TABLE domain.Classifications
	(
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Code] [nchar](3) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermID] [int] NULL,
	[CreditManagementScenario] [uniqueidentifier] NULL
	)
END
GO
