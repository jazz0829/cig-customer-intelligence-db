USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_ContactID_CIGCopyTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_ContactID_CIGCopyTime] ON [raw].[HOST_CIG_Contacts] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_Contacts]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_Contacts]
GO
/****** Object:  Table [raw].[HOST_CIG_Contacts]    Script Date: 24-sept.-18 14:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_Contacts](
	[ID] [uniqueidentifier] NOT NULL,
	[Person] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Account] [uniqueidentifier] NOT NULL,
	[IsMailingExcluded] [tinyint] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[IsUXParticipant] [tinyint] NOT NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[JobTitleDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContactID_CIGCopyTime]    Script Date: 24-sept.-18 14:22:04 ******/
CREATE CLUSTERED INDEX [IX_ContactID_CIGCopyTime] ON [raw].[HOST_CIG_Contacts]
(
	[ID] ASC,
	[CIGCopyTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
