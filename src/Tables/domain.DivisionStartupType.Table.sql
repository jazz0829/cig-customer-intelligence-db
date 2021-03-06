USE [CustomerIntelligence]
GO
/****** Object:  Index [StartupType]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [StartupType] ON [domain].[DivisionStartupType] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[DivisionStartupType]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[DivisionStartupType]
GO
/****** Object:  Table [domain].[DivisionStartupType]    Script Date: 24-sept.-18 14:21:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[DivisionStartupType](
	[StartupType] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartupTypeDescription] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [StartupType]    Script Date: 24-sept.-18 14:21:26 ******/
CREATE CLUSTERED INDEX [StartupType] ON [domain].[DivisionStartupType]
(
	[StartupType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
