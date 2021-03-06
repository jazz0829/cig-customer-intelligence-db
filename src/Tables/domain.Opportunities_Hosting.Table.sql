USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Opportunities_Hosting]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Opportunities_Hosting]
GO
/****** Object:  Table [domain].[Opportunities_Hosting]    Script Date: 24-sept.-18 14:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Opportunities_Hosting](
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
	[OpportunityType] [smallint] NULL,
	[OpportunityDepartment] [smallint] NULL,
	[Extensions] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
