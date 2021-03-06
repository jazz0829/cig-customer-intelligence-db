USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_ID_CIGCopyTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_ID_CIGCopyTime] ON [raw].[HOST_CIG_TimeCostTransactions] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_TimeCostTransactions]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_TimeCostTransactions]
GO
/****** Object:  Table [raw].[HOST_CIG_TimeCostTransactions]    Script Date: 24-sept.-18 14:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_TimeCostTransactions](
	[ID] [uniqueidentifier] NOT NULL,
	[Notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [smallint] NOT NULL,
	[Division] [int] NOT NULL,
	[HourStatus] [smallint] NOT NULL,
	[Employee] [uniqueidentifier] NULL,
	[Account] [uniqueidentifier] NULL,
	[Project] [uniqueidentifier] NULL,
	[Item] [uniqueidentifier] NULL,
	[Quantity] [float] NOT NULL,
	[PriceFC] [float] NULL,
	[AmountFC] [float] NULL,
	[Currency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date] [datetime] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Attachment] [uniqueidentifier] NULL,
	[EntryNumber] [int] NOT NULL,
	[ErrorText] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[ShopOrder] [uniqueidentifier] NULL,
	[RoutingStepPlan] [uniqueidentifier] NULL,
	[RoutingStepRealization] [uniqueidentifier] NULL,
	[WorkCenter] [uniqueidentifier] NULL,
	[Source] [smallint] NOT NULL,
	[ManufacturingTimeType] [smallint] NULL,
	[LaborHours] [float] NULL,
	[ProducedQuantity] [float] NULL,
	[SetupComplete] [tinyint] NULL,
	[PercentComplete] [float] NULL,
	[LaborRate] [float] NULL,
	[LaborBurdenRate] [float] NULL,
	[MachineBurdenRate] [float] NULL,
	[GeneralBurdenRate] [float] NULL,
	[AmountDC] [float] NULL,
	[RateFC] [float] NULL,
	[Backflushed] [tinyint] NULL,
	[BackflushTransaction] [uniqueidentifier] NULL,
	[ProjectWBS] [uniqueidentifier] NULL,
	[PurchaseAmountFC] [float] NULL,
	[PurchaseMarkupPercentage] [float] NULL,
	[PurchaseTransactionLine] [uniqueidentifier] NULL,
	[InternalRateDC] [float] NULL,
	[CostAmountDC] [float] NULL,
	[Subscription] [uniqueidentifier] NULL,
	[TimedTimeTransaction] [uniqueidentifier] NULL,
	[IsOperationFinished] [tinyint] NULL,
	[CorrectedTimeCostTransaction] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ID_CIGCopyTime]    Script Date: 24-sept.-18 14:22:17 ******/
CREATE CLUSTERED INDEX [IX_ID_CIGCopyTime] ON [raw].[HOST_CIG_TimeCostTransactions]
(
	[ID] ASC,
	[CIGCopyTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
