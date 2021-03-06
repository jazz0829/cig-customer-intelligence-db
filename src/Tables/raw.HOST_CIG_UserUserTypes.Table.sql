USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_UserID_CIGCopyTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_UserID_CIGCopyTime] ON [raw].[HOST_CIG_UserUserTypes] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_UserUserTypes]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_UserUserTypes]
GO
/****** Object:  Table [raw].[HOST_CIG_UserUserTypes]    Script Date: 24-sept.-18 14:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_UserUserTypes](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[UserType] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[EndDate] [datetime] NULL,
	[InvoiceAccount] [uniqueidentifier] NULL,
	[InvoicedUntil] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID_CIGCopyTime]    Script Date: 24-sept.-18 14:22:19 ******/
CREATE CLUSTERED INDEX [IX_UserID_CIGCopyTime] ON [raw].[HOST_CIG_UserUserTypes]
(
	[UserID] ASC,
	[CIGCopyTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
