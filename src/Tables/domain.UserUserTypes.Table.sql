USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_UserID]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_UserID] ON [domain].[UserUserTypes] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[UserUserTypes]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[UserUserTypes]
GO
/****** Object:  Table [domain].[UserUserTypes]    Script Date: 24-sept.-18 14:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[UserUserTypes](
	[UserID] [uniqueidentifier] NOT NULL,
	[UserTypeID] [uniqueidentifier] NOT NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[InvoiceAccount] [uniqueidentifier] NULL,
	[InvoicedUntil] [date] NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL
) ON [Domain]
GO
/****** Object:  Index [IX_UserID]    Script Date: 24-sept.-18 14:21:46 ******/
CREATE CLUSTERED INDEX [IX_UserID] ON [domain].[UserUserTypes]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
