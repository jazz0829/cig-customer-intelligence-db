USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Eloqua_Activities_Subscriptions_EmailAddress]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Activities_Subscriptions_EmailAddress] ON [raw].[Eloqua_Activities_Subscriptions]
GO
/****** Object:  Index [CIX_Eloqua_Activities_Subscriptions]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [CIX_Eloqua_Activities_Subscriptions] ON [raw].[Eloqua_Activities_Subscriptions] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Eloqua_Activities_Subscriptions]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Eloqua_Activities_Subscriptions]
GO
/****** Object:  Table [raw].[Eloqua_Activities_Subscriptions]    Script Date: 24-sept.-18 14:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Eloqua_Activities_Subscriptions](
	[ActivityId] [bigint] NOT NULL,
	[ActivityType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ActivityDate] [datetime] NOT NULL,
	[EmailAddress] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailRecipientId] [varchar](38) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssetType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssetName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssetId] [int] NULL,
	[CampaignId] [int] NULL,
	[ExternalId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_Eloqua_Activities_Subscriptions]    Script Date: 24-sept.-18 14:21:57 ******/
CREATE CLUSTERED INDEX [CIX_Eloqua_Activities_Subscriptions] ON [raw].[Eloqua_Activities_Subscriptions]
(
	[ActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_Activities_Subscriptions_EmailAddress]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Activities_Subscriptions_EmailAddress] ON [raw].[Eloqua_Activities_Subscriptions]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
