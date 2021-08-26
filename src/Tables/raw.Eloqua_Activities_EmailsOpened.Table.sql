USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Eloqua_Activities_EmailsOpened_EmailAddress]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Activities_EmailsOpened_EmailAddress] ON [raw].[Eloqua_Activities_EmailsOpened]
GO
/****** Object:  Index [IX_Eloqua_Activities_EmailsOpened_ContactId]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Activities_EmailsOpened_ContactId] ON [raw].[Eloqua_Activities_EmailsOpened]
GO
/****** Object:  Index [Eloqua_Activities_EmailsOpened]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [Eloqua_Activities_EmailsOpened] ON [raw].[Eloqua_Activities_EmailsOpened] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Eloqua_Activities_EmailsOpened]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Eloqua_Activities_EmailsOpened]
GO
/****** Object:  Table [raw].[Eloqua_Activities_EmailsOpened]    Script Date: 24-sept.-18 14:21:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Eloqua_Activities_EmailsOpened](
	[ActivityId] [bigint] NOT NULL,
	[ActivityType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ActivityDate] [datetime] NOT NULL,
	[EmailAddress] [varchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactId] [int] NULL,
	[IpAddress] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VisitorId] [int] NULL,
	[EmailRecipientId] [varchar](38) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssetType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssetName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssetId] [int] NULL,
	[SubjectLine] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailWebLink] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VisitorExternalId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CampaignId] [int] NULL,
	[ExternalId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DeploymentId] [int] NULL,
	[EmailSendType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
/****** Object:  Index [Eloqua_Activities_EmailsOpened]    Script Date: 24-sept.-18 14:21:56 ******/
CREATE CLUSTERED INDEX [Eloqua_Activities_EmailsOpened] ON [raw].[Eloqua_Activities_EmailsOpened]
(
	[ActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Eloqua_Activities_EmailsOpened_ContactId]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Activities_EmailsOpened_ContactId] ON [raw].[Eloqua_Activities_EmailsOpened]
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_Activities_EmailsOpened_EmailAddress]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Activities_EmailsOpened_EmailAddress] ON [raw].[Eloqua_Activities_EmailsOpened]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
