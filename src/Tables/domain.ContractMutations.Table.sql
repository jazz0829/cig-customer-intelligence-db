USE [CustomerIntelligence]
GO
/****** Object:  Index [NonClusteredIndex-20170606-115451]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [NonClusteredIndex-20170606-115451] ON [domain].[ContractMutations]
GO
/****** Object:  Index [ClusteredIndex-20170606-115440]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [ClusteredIndex-20170606-115440] ON [domain].[ContractMutations] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[ContractMutations]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ContractMutations]
GO
/****** Object:  Table [domain].[ContractMutations]    Script Date: 24-sept.-18 14:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ContractMutations](
	[sysmodified] [datetime] NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[HID] [bigint] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[Division] [int] NULL,
	[EventDate] [datetime] NULL,
	[Event] [uniqueidentifier] NULL,
	[Account] [uniqueidentifier] NULL,
	[Contract] [uniqueidentifier] NULL,
	[ContractLine] [uniqueidentifier] NULL,
	[Item] [uniqueidentifier] NULL,
	[Quantity] [int] NULL,
	[ContractLineValue] [float] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ClusteredIndex-20170606-115440]    Script Date: 24-sept.-18 14:21:22 ******/
CREATE CLUSTERED INDEX [ClusteredIndex-20170606-115440] ON [domain].[ContractMutations]
(
	[ID] ASC,
	[EventDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20170606-115451]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20170606-115451] ON [domain].[ContractMutations]
(
	[Division] ASC,
	[Event] ASC,
	[Account] ASC,
	[Contract] ASC,
	[ContractLine] ASC,
	[Item] ASC,
	[Quantity] ASC,
	[ContractLineValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
