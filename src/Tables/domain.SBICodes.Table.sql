USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[SBICodes]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[SBICodes]
GO
/****** Object:  Table [domain].[SBICodes]    Script Date: 24-sept.-18 14:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[SBICodes](
	[table] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[code] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[termid] [float] NULL,
	[legislation] [float] NULL,
	[parent] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sector] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subsector] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
