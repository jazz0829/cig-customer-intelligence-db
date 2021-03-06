USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[VerintColumn]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[VerintColumn]
GO
/****** Object:  Table [config].[VerintColumn]    Script Date: 24-sept.-18 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[VerintColumn](
	[VerintColumnID] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ MeasureGroup] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ Measure] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ AdditionalInformation] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
