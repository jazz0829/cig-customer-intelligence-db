USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[ActivityMonthly_Apps_RajivTest]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ActivityMonthly_Apps_RajivTest]
GO
/****** Object:  Table [domain].[ActivityMonthly_Apps_RajivTest]    Script Date: 24-sept.-18 14:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ActivityMonthly_Apps_RajivTest](
	[ID] [uniqueidentifier] NOT NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[YearMonth] [int] NULL,
	[ApplicationID] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [nchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCode] [nchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [nchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionCode] [int] NULL,
	[Action] [smallint] NULL,
	[Endpoint] [nvarchar](2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Quantity] [bigint] NULL,
	[AverageDuration] [float] NULL
) ON [PRIMARY]
GO
