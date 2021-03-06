USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_Opportunities]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_Opportunities]
GO
/****** Object:  Table [raw].[HOST_CIG_Opportunities]    Script Date: 24-sept.-18 14:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_Opportunities](
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Name] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Account] [uniqueidentifier] NOT NULL,
	[Owner] [uniqueidentifier] NOT NULL,
	[OwnerRead] [tinyint] NOT NULL,
	[CloseDate] [datetime] NULL,
	[OpportunityStage] [uniqueidentifier] NOT NULL,
	[Probability] [float] NOT NULL,
	[Currency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AmountFC] [float] NOT NULL,
	[AmountDC] [float] NOT NULL,
	[RateFC] [float] NULL,
	[LeadSource] [uniqueidentifier] NULL,
	[SalesType] [uniqueidentifier] NULL,
	[ReasonCode] [uniqueidentifier] NULL,
	[Notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NextAction] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActionDate] [datetime] NULL,
	[ExchangeRateType] [uniqueidentifier] NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[Project] [uniqueidentifier] NULL,
	[Competitor] [uniqueidentifier] NULL,
	[Campaign] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[InvolvementType] [smallint] NULL,
	[Accountant] [uniqueidentifier] NULL,
	[Reseller] [uniqueidentifier] NULL,
	[OpportunityType] [smallint] NULL,
	[OpportunityDepartment] [smallint] NULL,
	[Extension] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
