USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_CustomerSubscriptionStatistics]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_CustomerSubscriptionStatistics]
GO
/****** Object:  Table [raw].[HOST_CIG_CustomerSubscriptionStatistics]    Script Date: 24-sept.-18 14:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_CustomerSubscriptionStatistics](
	[ID] [uniqueidentifier] NOT NULL,
	[Account] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[Package] [uniqueidentifier] NULL,
	[Reseller] [uniqueidentifier] NULL,
	[Accountant] [uniqueidentifier] NULL,
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
