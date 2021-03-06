USE [CustomerIntelligence]
GO
/****** Object:  Index [YearMonth]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [YearMonth] ON [domain].[ActivityMonthly]
GO
/****** Object:  Index [EnvAccountYearMonthID]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [EnvAccountYearMonthID] ON [domain].[ActivityMonthly] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[ActivityMonthly]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ActivityMonthly]
GO
/****** Object:  Table [domain].[ActivityMonthly]    Script Date: 24-sept.-18 14:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ActivityMonthly](
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionCode] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityID] [int] NULL,
	[Quantity] [int] NULL,
	[AverageDuration] [float] NULL,
	[YearMonth] [int] NULL,
	[AccountID] [uniqueidentifier] NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EnvAccountYearMonthID]    Script Date: 24-sept.-18 14:21:13 ******/
CREATE CLUSTERED INDEX [EnvAccountYearMonthID] ON [domain].[ActivityMonthly]
(
	[Environment] ASC,
	[AccountCode] ASC,
	[YearMonth] ASC,
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [YearMonth]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [YearMonth] ON [domain].[ActivityMonthly]
(
	[Environment] ASC,
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
