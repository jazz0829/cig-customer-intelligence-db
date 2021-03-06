USE [CustomerIntelligence]
GO
/****** Object:  Index [NonClusteredIndex-20180418-132349]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [NonClusteredIndex-20180418-132349] ON [domain].[MonthlyAppUsage]
GO
/****** Object:  Index [ClusteredIndex-20180418-132157]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [ClusteredIndex-20180418-132157] ON [domain].[MonthlyAppUsage] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[MonthlyAppUsage]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[MonthlyAppUsage]
GO
/****** Object:  Table [domain].[MonthlyAppUsage]    Script Date: 24-sept.-18 14:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[MonthlyAppUsage](
	[ID] [uniqueidentifier] NOT NULL,
	[Environment] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppUsageFreeReason] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[App] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EntryID] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstAppUsageDate] [date] NULL,
	[IsFreeConnection] [int] NULL,
	[Partner] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartnerCode] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartnerName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsageMonth] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsageYear] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsedByCustomer] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsedByCustomerCode] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsedByCustomerName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsedDivision] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsedDivisionName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ClusteredIndex-20180418-132157]    Script Date: 24-sept.-18 14:21:31 ******/
CREATE CLUSTERED INDEX [ClusteredIndex-20180418-132157] ON [domain].[MonthlyAppUsage]
(
	[UsageYear] ASC,
	[UsageMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20180418-132349]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180418-132349] ON [domain].[MonthlyAppUsage]
(
	[UsedDivision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
