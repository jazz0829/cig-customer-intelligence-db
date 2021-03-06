USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_MonthlyAppUsage]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_MonthlyAppUsage]
GO
/****** Object:  Table [raw].[HOST_CIG_MonthlyAppUsage]    Script Date: 24-sept.-18 14:22:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_MonthlyAppUsage](
	[ID] [uniqueidentifier] NOT NULL,
	[OAuthClient] [uniqueidentifier] NOT NULL,
	[Account] [uniqueidentifier] NOT NULL,
	[UsageYear] [smallint] NOT NULL,
	[UsageMonth] [tinyint] NOT NULL,
	[UsedDivision] [int] NOT NULL,
	[UsedByCustomer] [uniqueidentifier] NOT NULL,
	[AppUsageFreeReason] [smallint] NULL,
	[EntryID] [uniqueidentifier] NULL,
	[FirstAppUsageDate] [datetime] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
