USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Contracts]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Contracts]
GO
/****** Object:  Table [domain].[Contracts]    Script Date: 24-sept.-18 14:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Contracts](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractNumber] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractType] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[FinalDate] [date] NULL,
	[EventDate] [date] NULL,
	[InflowOutflow] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractEventTypeCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PackageCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LinePackage] [tinyint] NULL,
	[Quantity] [int] NULL,
	[NumberOfAdministrations] [int] NULL,
	[NumberOfUsers] [int] NULL,
	[ContractLineValue] [float] NULL,
	[ValuePerMonth] [float] NULL,
	[ValuePerYear] [float] NULL,
	[ContractLineValueDC] [float] NULL,
	[ValuePerMonthDC] [float] NULL,
	[ValuePerYearDC] [float] NULL,
	[ExchangeRate] [float] NULL,
	[ItemBasePricePerMonth] [float] NULL,
	[ItemBasePricePeryear] [float] NULL,
	[Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventYearMonth] [int] NULL,
	[EventYear] [int] NULL,
	[EventMonth] [int] NULL,
	[EventType] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Item] [uniqueidentifier] NULL,
	[ItemDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemType] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CancellationDate] [date] NULL
) ON [PRIMARY]
GO
