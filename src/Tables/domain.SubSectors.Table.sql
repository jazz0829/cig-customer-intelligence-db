USE [CustomerIntelligence]
GO
/****** Object:  Index [SubSectorCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [SubSectorCode] ON [domain].[SubSectors] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[SubSectors]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[SubSectors]
GO
/****** Object:  Table [domain].[SubSectors]    Script Date: 24-sept.-18 14:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[SubSectors](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SubSectorCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SubSectorDescription] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SubSectorCode]    Script Date: 24-sept.-18 14:21:43 ******/
CREATE CLUSTERED INDEX [SubSectorCode] ON [domain].[SubSectors]
(
	[Environment] ASC,
	[SubSectorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
