USE [CustomerIntelligence]
GO
/****** Object:  Index [ItemType]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [ItemType] ON [domain].[ItemClassification]
GO
/****** Object:  Index [ItemCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [ItemCode] ON [domain].[ItemClassification] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[ItemClassification]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ItemClassification]
GO
/****** Object:  Table [domain].[ItemClassification]    Script Date: 24-sept.-18 14:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ItemClassification](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ItemCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ItemDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemType] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ItemCode]    Script Date: 24-sept.-18 14:21:28 ******/
CREATE CLUSTERED INDEX [ItemCode] ON [domain].[ItemClassification]
(
	[Environment] ASC,
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ItemType]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [ItemType] ON [domain].[ItemClassification]
(
	[Environment] ASC,
	[ItemType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
