USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[DivisionTypes]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[DivisionTypes]
GO
/****** Object:  Table [domain].[DivisionTypes]    Script Date: 24-sept.-18 14:21:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[DivisionTypes](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DescriptionTermId] [int] NULL,
	[Item] [uniqueidentifier] NOT NULL,
	[Modules] [bigint] NULL,
	[syscreated] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
