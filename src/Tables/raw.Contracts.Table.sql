USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Contracts]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Contracts]
GO
/****** Object:  Table [raw].[Contracts]    Script Date: 24-sept.-18 14:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Contracts](
	[ID] [uniqueidentifier] NOT NULL,
	[Number] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Account] [uniqueidentifier] NOT NULL,
	[Type] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ContractEvent] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EndDate] [datetime] NULL,
	[FinalDate] [datetime] NULL,
	[CancellationDate] [datetime] NULL,
	[CancellationEvent] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[TimeUnit] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NULL,
	[sysmodifier] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
