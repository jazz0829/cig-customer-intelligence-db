USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_Units]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_Units]
GO
/****** Object:  Table [raw].[HOST_CIG_Units]    Script Date: 24-sept.-18 14:22:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_Units](
	[Type] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Active] [bit] NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Code] [nchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Main] [tinyint] NOT NULL,
	[LengthUnit] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AreaUnit] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VolumeUnit] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WeightUnit] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermID] [int] NULL,
	[TimeUnit] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
