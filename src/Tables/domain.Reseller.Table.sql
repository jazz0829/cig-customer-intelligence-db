USE [CustomerIntelligence]
GO
/****** Object:  Index [ResellerCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [ResellerCode] ON [domain].[Reseller] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Reseller]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Reseller]
GO
/****** Object:  Table [domain].[Reseller]    Script Date: 24-sept.-18 14:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Reseller](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ResellerCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ResellerName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ResellerCode]    Script Date: 24-sept.-18 14:21:40 ******/
CREATE CLUSTERED INDEX [ResellerCode] ON [domain].[Reseller]
(
	[Environment] ASC,
	[ResellerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
