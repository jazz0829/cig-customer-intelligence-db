USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_SkillUser]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_SkillUser]
GO
/****** Object:  Table [raw].[Salesforce_SkillUser]    Script Date: 24-sept.-18 14:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_SkillUser](
	[Id] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[LastModifiedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[SkillId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SystemModstamp] [datetime] NULL,
	[UserId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EtlInsertTime] [datetime] NULL
) ON [PRIMARY]
GO
