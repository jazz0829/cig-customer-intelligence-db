USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[OpportunityStages]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[OpportunityStages]
GO
/****** Object:  Table [domain].[OpportunityStages]    Script Date: 24-sept.-18 14:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[OpportunityStages](
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DescriptionTermID] [int] NULL,
	[SortOrder] [int] NOT NULL,
	[Probability] [float] NOT NULL,
	[OpportunityStatus] [int] NOT NULL,
	[ForecastType] [int] NOT NULL,
	[Active] [tinyint] NOT NULL,
	[Notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[Color] [int] NOT NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
