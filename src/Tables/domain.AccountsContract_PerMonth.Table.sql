USE [CustomerIntelligence]
GO
/****** Object:  Index [YearMonth]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [YearMonth] ON [domain].[AccountsContract_PerMonth]
GO
/****** Object:  Index [EnvAccountYearMonth]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [EnvAccountYearMonth] ON [domain].[AccountsContract_PerMonth] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[AccountsContract_PerMonth]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[AccountsContract_PerMonth]
GO
/****** Object:  Table [domain].[AccountsContract_PerMonth]    Script Date: 24-sept.-18 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[AccountsContract_PerMonth](
	[AccountID] [uniqueidentifier] NULL,
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[YearMonth] [int] NULL,
	[PackageCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractType] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractNumber] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NumberOfAvailableAdmins] [int] NULL,
	[NumberOfArchivedAdmins] [int] NULL,
	[NumberOfUsers] [int] NULL,
	[NumberOfPayingUsers] [int] NULL,
	[NumberOfFreeUsers] [int] NULL,
	[MRR] [float] NULL,
	[CommercialLifetimeMonths] [int] NULL,
	[Churned] [int] NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EnvAccountYearMonth]    Script Date: 24-sept.-18 14:21:12 ******/
CREATE CLUSTERED INDEX [EnvAccountYearMonth] ON [domain].[AccountsContract_PerMonth]
(
	[Environment] ASC,
	[AccountCode] ASC,
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [YearMonth]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [YearMonth] ON [domain].[AccountsContract_PerMonth]
(
	[YearMonth] ASC
)
INCLUDE ( 	[Environment],
	[AccountCode],
	[Year],
	[Month],
	[PackageCode],
	[ContractType],
	[CommercialLifetimeMonths]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
