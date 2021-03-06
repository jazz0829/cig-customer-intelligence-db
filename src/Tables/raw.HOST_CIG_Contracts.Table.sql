USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_Contracts]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_Contracts]
GO
/****** Object:  Table [raw].[HOST_CIG_Contracts]    Script Date: 24-sept.-18 14:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_Contracts](
	[ID] [uniqueidentifier] NOT NULL,
	[Number] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Account] [uniqueidentifier] NOT NULL,
	[Type] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ContractEvent] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[sysmodifier] [uniqueidentifier] NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TimePeriod] [smallint] NULL,
	[EndDate] [datetime] NULL,
	[Currency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Document] [uniqueidentifier] NULL,
	[IsValid] [bit] NULL,
	[ContractTerm] [uniqueidentifier] NULL,
	[ContractEventID] [uniqueidentifier] NULL,
	[ErrorText] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProcessingStatus] [smallint] NULL,
	[ExtenderDayPart] [int] NULL,
	[ExtensionPeriod] [smallint] NULL,
	[ExtensionUnit] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProlongDayPart] [int] NULL,
	[YourRef] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
