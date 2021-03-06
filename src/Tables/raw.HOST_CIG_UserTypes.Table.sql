USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_UserType_CIGCopyTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_UserType_CIGCopyTime] ON [raw].[HOST_CIG_UserTypes] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_UserTypes]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_UserTypes]
GO
/****** Object:  Table [raw].[HOST_CIG_UserTypes]    Script Date: 24-sept.-18 14:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_UserTypes](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Item] [uniqueidentifier] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[GettingStartedPage] [smallint] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[StartPage] [smallint] NULL,
	[PortalMenu] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DescriptionTermId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserType_CIGCopyTime]    Script Date: 24-sept.-18 14:22:19 ******/
CREATE CLUSTERED INDEX [IX_UserType_CIGCopyTime] ON [raw].[HOST_CIG_UserTypes]
(
	[ID] ASC,
	[CIGCopyTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
