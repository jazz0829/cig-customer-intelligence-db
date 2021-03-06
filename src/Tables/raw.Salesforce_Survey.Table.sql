USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Salesforce_Survey_LastModifiedDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Survey_LastModifiedDate] ON [raw].[Salesforce_Survey] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Salesforce_Survey]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_Survey]
GO
/****** Object:  Table [raw].[Salesforce_Survey]    Script Date: 24-sept.-18 14:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_Survey](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Answer_1__c] [int] NULL,
	[Answer_2__c] [int] NULL,
	[Answer_3__c] [int] NULL,
	[Answer_4__c] [int] NULL,
	[Answer_5__c] [int] NULL,
	[Answer_6__c] [int] NULL,
	[Answer_7__c] [int] NULL,
	[Answer_8__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Average_A1_A4__c] [float] NOT NULL,
	[Average_A4_7__c] [float] NOT NULL,
	[Case__c] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Converted_Answer_1__c] [float] NOT NULL,
	[Converted_Answer_2__c] [float] NOT NULL,
	[Converted_Answer_3__c] [float] NOT NULL,
	[Converted_Answer_4__c] [float] NOT NULL,
	[Converted_Answer_5__c] [float] NOT NULL,
	[Converted_Answer_6__c] [float] NOT NULL,
	[Converted_Answer_7__c] [float] NOT NULL,
	[CreatedById] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrencyIsoCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Detractor__c] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LastActivityDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedById] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Answer_1__c] [int] NULL,
	[New_Answer_2__c] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Answer_3__c] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Answer_4__c] [int] NULL,
	[New_Answer_5__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Converted_Answer_1__c] [float] NOT NULL,
	[New_Converted_Answer_4__c] [float] NOT NULL,
	[New_Question_1__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Question_2__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Question_3__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Question_4__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Question_5__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Promoter__c] [bit] NOT NULL,
	[Question_1__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question_2__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question_3__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question_4__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question_5__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question_6__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question_7__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question_8__c] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EtlInsertTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Survey_LastModifiedDate]    Script Date: 24-sept.-18 14:22:32 ******/
CREATE CLUSTERED INDEX [IX_Salesforce_Survey_LastModifiedDate] ON [raw].[Salesforce_Survey]
(
	[LastModifiedDate] DESC,
	[EtlInsertTime] DESC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
