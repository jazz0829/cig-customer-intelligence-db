USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[ChurnaroundCategorie1]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[ChurnaroundCategorie1]
GO
/****** Object:  Table [config].[ChurnaroundCategorie1]    Script Date: 24-sept.-18 14:20:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[ChurnaroundCategorie1](
	[Code] [float] NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Explanation] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Combinations with CAT 2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[F5] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
