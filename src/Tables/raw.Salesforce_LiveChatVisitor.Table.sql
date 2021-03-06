USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_LiveChatVisitor]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_LiveChatVisitor]
GO
/****** Object:  Table [raw].[Salesforce_LiveChatVisitor]    Script Date: 24-sept.-18 14:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_LiveChatVisitor](
	[Id] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[LastModifiedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SessionKey] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SystemModstamp] [datetime] NULL,
	[EtlInsertTime] [datetime] NULL
) ON [PRIMARY]
GO
