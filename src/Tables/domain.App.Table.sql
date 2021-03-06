USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[App]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[App]
GO
/****** Object:  Table [domain].[App]    Script Date: 24-sept.-18 14:21:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[App](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[App] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Partner] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartnerCode] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Category] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
