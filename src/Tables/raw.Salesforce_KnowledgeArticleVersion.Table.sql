USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_KnowledgeArticleVersion]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_KnowledgeArticleVersion]
GO
/****** Object:  Table [raw].[Salesforce_KnowledgeArticleVersion]    Script Date: 24-sept.-18 14:22:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_KnowledgeArticleVersion](
	[Id] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ArticleNumber] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Summary] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ArticleType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PublishStatus] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UrlName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Language] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SourceId] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[ArticleCreatedDate] [datetime] NULL,
	[FirstPublishedDate] [datetime] NULL,
	[LastPublishedDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
	[EtlInsertTime] [datetime] NULL
) ON [PRIMARY]
GO
