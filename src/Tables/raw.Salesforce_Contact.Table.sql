USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Salesforce_Contact_LastModifiedDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_Contact_LastModifiedDate] ON [raw].[Salesforce_Contact] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Salesforce_Contact]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_Contact]
GO
/****** Object:  Table [raw].[Salesforce_Contact]    Script Date: 24-sept.-18 14:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_Contact](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsEmailBounced] [bit] NULL,
	[LastActivityDate] [datetime] NULL,
	[LastCURequestDate] [datetime] NULL,
	[LastCUUpdateDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastViewedDate] [datetime] NULL,
	[Enddate__c] [datetime] NULL,
	[UserID__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOL_User__c] [bit] NULL,
	[Exact_ID__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gender__c] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Language__c] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Startdate__c] [datetime] NULL,
	[EtlInsertTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_Contact_LastModifiedDate]    Script Date: 24-sept.-18 14:22:27 ******/
CREATE CLUSTERED INDEX [IX_Salesforce_Contact_LastModifiedDate] ON [raw].[Salesforce_Contact]
(
	[LastModifiedDate] DESC,
	[EtlInsertTime] DESC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
