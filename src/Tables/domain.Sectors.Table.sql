USE [CustomerIntelligence]
GO
/****** Object:  Index [SectorCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [SectorCode] ON [domain].[Sectors] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Sectors]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Sectors]
GO
/****** Object:  Table [domain].[Sectors]    Script Date: 24-sept.-18 14:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Sectors](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SectorCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SectorDescription] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SectorCode]    Script Date: 24-sept.-18 14:21:43 ******/
CREATE CLUSTERED INDEX [SectorCode] ON [domain].[Sectors]
(
	[Environment] ASC,
	[SectorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
