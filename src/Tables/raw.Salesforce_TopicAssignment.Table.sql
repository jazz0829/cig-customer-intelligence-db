USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_TopicAssignment]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_TopicAssignment]
GO
/****** Object:  Table [raw].[Salesforce_TopicAssignment]    Script Date: 24-sept.-18 14:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_TopicAssignment](
	[Id] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TopicId] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EntityId] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NetworkId] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EntityKeyPrefix] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EntityType] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [bit] NULL,
	[LastModifiedDate] [datetime] NULL,
	[SystemModstamp] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedById] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EtlInsertTime] [datetime] NULL
) ON [PRIMARY]
GO
