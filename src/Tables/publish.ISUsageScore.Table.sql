USE [CustomerIntelligence]
GO
/****** Object:  Table [publish].[ISUsageScore]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [publish].[ISUsageScore]
GO
/****** Object:  Table [publish].[ISUsageScore]    Script Date: 24-sept.-18 14:21:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [publish].[ISUsageScore](
	[Environment] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCode] [int] NULL,
	[PackageCode] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Score] [float] NULL,
	[ReferenceDate] [datetime] NULL,
	[PredictDate] [datetime] NULL,
	[Phase] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
