USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_BusinessTypes]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_BusinessTypes]
GO
/****** Object:  Table [raw].[HOST_CIG_BusinessTypes]    Script Date: 24-sept.-18 14:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_BusinessTypes](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermID] [int] NULL,
	[Country] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortDescriptionTermID] [int] NULL
) ON [PRIMARY]
GO
