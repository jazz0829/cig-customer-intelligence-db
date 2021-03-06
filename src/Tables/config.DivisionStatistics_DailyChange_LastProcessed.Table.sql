USE [CustomerIntelligence]
GO
/****** Object:  Index [Environment]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [Environment] ON [config].[DivisionStatistics_DailyChange_LastProcessed] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [config].[DivisionStatistics_DailyChange_LastProcessed]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[DivisionStatistics_DailyChange_LastProcessed]
GO
/****** Object:  Table [config].[DivisionStatistics_DailyChange_LastProcessed]    Script Date: 24-sept.-18 14:21:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[DivisionStatistics_DailyChange_LastProcessed](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DateLastProcessed] [date] NOT NULL,
	[DateForNextRun] [date] NULL,
	[Sequence] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Environment]    Script Date: 24-sept.-18 14:21:02 ******/
CREATE CLUSTERED INDEX [Environment] ON [config].[DivisionStatistics_DailyChange_LastProcessed]
(
	[Environment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
