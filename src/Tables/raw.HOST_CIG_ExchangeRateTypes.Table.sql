USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_ExchangeRateTypes]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_ExchangeRateTypes]
GO
/****** Object:  Table [raw].[HOST_CIG_ExchangeRateTypes]    Script Date: 24-sept.-18 14:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_ExchangeRateTypes](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DescriptionTermID] [int] NULL,
	[Division] [int] NOT NULL,
	[SystemType] [tinyint] NOT NULL,
	[IsDefault] [tinyint] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
