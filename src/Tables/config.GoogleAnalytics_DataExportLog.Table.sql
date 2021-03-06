USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[GoogleAnalytics_DataExportLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[GoogleAnalytics_DataExportLog]
GO
/****** Object:  Table [config].[GoogleAnalytics_DataExportLog]    Script Date: 24-sept.-18 14:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[GoogleAnalytics_DataExportLog](
	[JobName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[InsertTime] [datetime] NULL
) ON [PRIMARY]
GO
