USE [CustomerIntelligence]
GO
/****** Object:  Index [CIX_DataSyncMap]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [CIX_DataSyncMap] ON [config].[DataSyncMap] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [config].[DataSyncMap]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[DataSyncMap]
GO
/****** Object:  Table [config].[DataSyncMap]    Script Date: 24-sept.-18 14:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[DataSyncMap](
	[ApplicationName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TableName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SourceId] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SyncedRecordTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CIX_DataSyncMap]    Script Date: 24-sept.-18 14:21:02 ******/
CREATE CLUSTERED INDEX [CIX_DataSyncMap] ON [config].[DataSyncMap]
(
	[ApplicationName] ASC,
	[TableName] ASC,
	[SourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
