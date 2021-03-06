USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_AccountID] ON [raw].[HOST_CIG_ContractMutations] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_ContractMutations]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_ContractMutations]
GO
/****** Object:  Table [raw].[HOST_CIG_ContractMutations]    Script Date: 24-sept.-18 14:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_ContractMutations](
	[sysmodified] [datetime] NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[HID] [bigint] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Index [IX_AccountID]    Script Date: 24-sept.-18 14:22:05 ******/
CREATE CLUSTERED INDEX [IX_AccountID] ON [raw].[HOST_CIG_ContractMutations]
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
