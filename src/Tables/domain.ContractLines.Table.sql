USE [CustomerIntelligence]
GO
/****** Object:  Index [ClusteredIndex-20170606-115625]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [ClusteredIndex-20170606-115625] ON [domain].[ContractLines] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[ContractLines]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ContractLines]
GO
/****** Object:  Table [domain].[ContractLines]    Script Date: 24-sept.-18 14:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ContractLines](
	[ID] [uniqueidentifier] NOT NULL,
	[ContractID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ContractEvent] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FinalDate] [datetime] NULL,
	[CancellationDate] [datetime] NULL,
	[CancellationEvent] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[Unitcode] [nchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NULL,
	[sysmodifier] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ClusteredIndex-20170606-115625]    Script Date: 24-sept.-18 14:21:22 ******/
CREATE CLUSTERED INDEX [ClusteredIndex-20170606-115625] ON [domain].[ContractLines]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
