USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[Salesforce_DataExportLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[Salesforce_DataExportLog]
GO
/****** Object:  Table [config].[Salesforce_DataExportLog]    Script Date: 24-sept.-18 14:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[Salesforce_DataExportLog](
	[ObjectName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[InsertTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
