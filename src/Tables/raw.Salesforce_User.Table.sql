USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Salesforce_User_Id]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_User_Id] ON [raw].[Salesforce_User]
GO
/****** Object:  Index [IX_Salesforce_User_LastModifiedDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_User_LastModifiedDate] ON [raw].[Salesforce_User] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Salesforce_User]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_User]
GO
/****** Object:  Table [raw].[Salesforce_User]    Script Date: 24-sept.-18 14:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_User](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CommunityNickname] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserType] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProfileId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExactIDAccount__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[EtlInsertTime] [datetime] NOT NULL,
	[Alias] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MiddleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_User_LastModifiedDate]    Script Date: 24-sept.-18 14:22:32 ******/
CREATE CLUSTERED INDEX [IX_Salesforce_User_LastModifiedDate] ON [raw].[Salesforce_User]
(
	[LastModifiedDate] DESC,
	[EtlInsertTime] DESC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_User_Id]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Salesforce_User_Id] ON [raw].[Salesforce_User]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
