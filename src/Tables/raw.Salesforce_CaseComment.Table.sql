USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Salesforce_CaseComment_LastModifiedDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Salesforce_CaseComment_LastModifiedDate] ON [raw].[Salesforce_CaseComment] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Salesforce_CaseComment]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_CaseComment]
GO
/****** Object:  Table [raw].[Salesforce_CaseComment]    Script Date: 24-sept.-18 14:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_CaseComment](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CommentBody] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedById] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsPublished] [bit] NULL,
	[LastModifiedById] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[ParentId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EtlInsertTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salesforce_CaseComment_LastModifiedDate]    Script Date: 24-sept.-18 14:22:26 ******/
CREATE CLUSTERED INDEX [IX_Salesforce_CaseComment_LastModifiedDate] ON [raw].[Salesforce_CaseComment]
(
	[LastModifiedDate] DESC,
	[EtlInsertTime] DESC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
