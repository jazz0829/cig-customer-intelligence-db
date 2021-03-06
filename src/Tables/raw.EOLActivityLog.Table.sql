USE [CustomerIntelligence]
GO
/****** Object:  Index [LogDateTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [LogDateTime] ON [raw].[EOLActivityLog]
GO
/****** Object:  Table [raw].[EOLActivityLog]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[EOLActivityLog]
GO
/****** Object:  Table [raw].[EOLActivityLog]    Script Date: 24-sept.-18 14:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[EOLActivityLog](
	[LogDateTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCode] [nchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [nchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AdministrationCode] [int] NULL,
	[UserID] [nchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [smallint] NULL,
	[Action] [smallint] NULL,
	[App] [nvarchar](2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ApplicationID] [nchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Count] [int] NULL,
	[Duration] [int] NULL,
	[LogText] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
/****** Object:  Index [LogDateTime]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE CLUSTERED COLUMNSTORE INDEX [LogDateTime] ON [raw].[EOLActivityLog] WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0) ON [PRIMARY]
GO
