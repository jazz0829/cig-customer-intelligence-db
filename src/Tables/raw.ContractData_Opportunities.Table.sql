USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[ContractData_Opportunities]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[ContractData_Opportunities]
GO
/****** Object:  Table [raw].[ContractData_Opportunities]    Script Date: 24-sept.-18 14:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[ContractData_Opportunities](
	[ID] [uniqueidentifier] NOT NULL,
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCode] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActionDate] [datetime] NULL,
	[AmountFC] [float] NULL,
	[AmountDC] [float] NULL,
	[CloseDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Currency] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityStageDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityStatus] [int] NULL,
	[Probability] [float] NULL,
	[OwnerFullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RateFC] [float] NULL,
	[SalesTypeDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReasonCodeDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProjectCode] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProjectDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CampaignDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadSourceDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
