USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[ContractStatistics_LastCheckTEST]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[ContractStatistics_LastCheckTEST]
GO
/****** Object:  Table [config].[ContractStatistics_LastCheckTEST]    Script Date: 24-sept.-18 14:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[ContractStatistics_LastCheckTEST](
	[Environment] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Occurrences] [int] NULL,
	[LastCheck] [datetime] NULL
) ON [PRIMARY]
GO
