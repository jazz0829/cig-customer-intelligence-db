USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[CoCreate_ColumnDefinitions]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[CoCreate_ColumnDefinitions]
GO
/****** Object:  Table [config].[CoCreate_ColumnDefinitions]    Script Date: 24-sept.-18 14:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[CoCreate_ColumnDefinitions](
	[VerintColumnID] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MeasureGroup] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Measure] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AdditionalInformation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
