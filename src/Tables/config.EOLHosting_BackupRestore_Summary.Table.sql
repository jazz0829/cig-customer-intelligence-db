USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[EOLHosting_BackupRestore_Summary]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[EOLHosting_BackupRestore_Summary]
GO
/****** Object:  Table [config].[EOLHosting_BackupRestore_Summary]    Script Date: 24-sept.-18 14:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[EOLHosting_BackupRestore_Summary](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BackupDateTime] [datetime] NULL,
	[RestoredDateTime] [datetime] NULL
) ON [PRIMARY]
GO
