USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[ContractEvents]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ContractEvents]
GO
/****** Object:  Table [domain].[ContractEvents]    Script Date: 24-sept.-18 14:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ContractEvents](
	[ID] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermId] [int] NULL,
	[CreationType] [int] NULL
) ON [PRIMARY]
GO
