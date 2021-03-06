USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Eloqua_Activities_WebVisits_ContactId]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Activities_WebVisits_ContactId] ON [raw].[Eloqua_Activities_WebVisits]
GO
/****** Object:  Index [CIX_Eloqua_Activities_WebVisits]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [CIX_Eloqua_Activities_WebVisits] ON [raw].[Eloqua_Activities_WebVisits] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Eloqua_Activities_WebVisits]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Eloqua_Activities_WebVisits]
GO
/****** Object:  Table [raw].[Eloqua_Activities_WebVisits]    Script Date: 24-sept.-18 14:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Eloqua_Activities_WebVisits](
	[ActivityId] [bigint] NOT NULL,
	[ActivityType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ActivityDate] [datetime] NOT NULL,
	[ContactId] [int] NULL,
	[CampaignId] [int] NULL,
	[VisitorId] [int] NULL,
	[VisitorExternalId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReferrerUrl] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IpAddress] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NumberOfPages] [int] NOT NULL,
	[FirstPageViewUrl] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Duration] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExternalId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_Eloqua_Activities_WebVisits]    Script Date: 24-sept.-18 14:21:58 ******/
CREATE CLUSTERED INDEX [CIX_Eloqua_Activities_WebVisits] ON [raw].[Eloqua_Activities_WebVisits]
(
	[ActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Eloqua_Activities_WebVisits_ContactId]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Activities_WebVisits_ContactId] ON [raw].[Eloqua_Activities_WebVisits]
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
