USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[SubscriptionQuotations]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[SubscriptionQuotations]
GO
/****** Object:  Table [domain].[SubscriptionQuotations]    Script Date: 24-sept.-18 14:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[SubscriptionQuotations](
	[SubscriptionQuotationID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[MainLine] [tinyint] NOT NULL,
	[DiscountAmount] [float] NULL,
	[DiscountPeriod] [smallint] NULL,
	[DiscountDescription] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [smallint] NOT NULL,
	[TotalMRR] [float] NOT NULL,
	[Notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExtraServiceDiscountDescription] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExtraServiceDiscountNotes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DiscountType] [smallint] NULL,
	[Approver] [uniqueidentifier] NULL,
	[ExtraServiceNumberOfDays] [float] NULL,
	[ExtraServiceTotalDiscountAmount] [float] NULL,
	[FirstYearNoCancellation] [tinyint] NOT NULL,
	[ContractTerm] [uniqueidentifier] NULL,
	[ExtraServiceGrossAmount] [float] NULL,
	[CIGCopyTime] [datetime] NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
