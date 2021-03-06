USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Salesforce_RecordType_LastModifiedDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_RecordType_LastModifiedDate] ON [raw].[Salesforce_RecordType] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Salesforce_RecordType]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_RecordType]
GO
/****** Object:  Table [raw].[Salesforce_RecordType]    Script Date: 24-sept.-18 14:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_RecordType](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NULL,
	[BusinessProcessId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedById] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[DeveloperName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedById] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[NamespacePrefix] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SobjectType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SystemModstamp] [datetime] NULL,
	[EtlInsertTime] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_RecordType_LastModifiedDate]    Script Date: 24-sept.-18 14:22:31 ******/
CREATE CLUSTERED INDEX [IX_Salesforce_RecordType_LastModifiedDate] ON [raw].[Salesforce_RecordType]
(
	[LastModifiedDate] DESC,
	[EtlInsertTime] DESC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
