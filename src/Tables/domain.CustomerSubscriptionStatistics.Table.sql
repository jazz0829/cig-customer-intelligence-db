USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[CustomerSubscriptionStatistics]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[CustomerSubscriptionStatistics]
GO
/****** Object:  Table [domain].[CustomerSubscriptionStatistics]    Script Date: 24-sept.-18 14:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[CustomerSubscriptionStatistics](
	[CustomerSubscriptionStatisticID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[Package] [uniqueidentifier] NULL,
	[ResellerID] [uniqueidentifier] NULL,
	[AccountantID] [uniqueidentifier] NULL,
	[UseSimpleWizard] [tinyint] NOT NULL,
	[CampaignName] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CampaignSource] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CampaignMedium] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CampaignTerm] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CampaignContent] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[Endorsement] [uniqueidentifier] NULL,
	[CampaignReferrer] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CampaignSpecifics] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[Source] [smallint] NULL
) ON [PRIMARY]
GO
