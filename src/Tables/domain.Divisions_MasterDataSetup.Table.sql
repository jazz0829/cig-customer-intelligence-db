USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_EnvDivisionCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_EnvDivisionCode] ON [domain].[Divisions_MasterDataSetup] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Divisions_MasterDataSetup]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Divisions_MasterDataSetup]
GO
/****** Object:  Table [domain].[Divisions_MasterDataSetup]    Script Date: 24-sept.-18 14:21:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Divisions_MasterDataSetup](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DivisionCode] [int] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DivisionStartupTypeCode] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionCreated] [datetime] NULL,
	[DivisionFirstAccessed] [datetime] NULL,
	[MasterDataSetupType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MasterDataSetupStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventStartTime] [datetime] NULL,
	[EventLatestTime] [datetime] NULL,
	[TemplateDivisionCode] [int] NULL,
	[Notes] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EnvDivisionCode]    Script Date: 24-sept.-18 14:21:25 ******/
CREATE CLUSTERED INDEX [IX_EnvDivisionCode] ON [domain].[Divisions_MasterDataSetup]
(
	[Environment] ASC,
	[DivisionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
