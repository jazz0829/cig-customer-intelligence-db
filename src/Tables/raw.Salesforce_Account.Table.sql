USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Salesforce_Account_LastModifiedDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Account_LastModifiedDate] ON [raw].[Salesforce_Account] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Salesforce_Account]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_Account]
GO
/****** Object:  Table [raw].[Salesforce_Account]    Script Date: 24-sept.-18 14:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_Account](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exact_ID__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[EtlInsertTime] [datetime] NULL,
	[Active__c] [bit] NULL,
	[Business_Type__c] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Company_Size__c] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contract_value__c] [float] NULL,
	[ControlledRelease__c] [bit] NULL,
	[Enddate__c] [datetime] NULL,
	[Industry] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsPartner] [bit] NULL,
	[Name] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Package__c] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sector__c] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subscription__c] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Account_LastModifiedDate]    Script Date: 24-sept.-18 14:22:24 ******/
CREATE CLUSTERED INDEX [IX_Salesforce_Account_LastModifiedDate] ON [raw].[Salesforce_Account]
(
	[LastModifiedDate] DESC,
	[EtlInsertTime] DESC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
