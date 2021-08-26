USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[AccountsClassifications]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[AccountsClassifications]
GO
/****** Object:  Table [domain].[AccountsClassifications]    Script Date: 24-sept.-18 14:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[AccountsClassifications](
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[AccountClassificationCode] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountClassificationDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermID] [int] NULL,
	[CreditManagementScenario] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
