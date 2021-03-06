USE [CustomerIntelligence]
GO
/****** Object:  Index [EnviroAccountCreated]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [EnviroAccountCreated] ON [domain].[Complaints] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Complaints]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Complaints]
GO
/****** Object:  Table [domain].[Complaints]    Script Date: 24-sept.-18 14:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Complaints](
	[ID] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TypeHID] [int] NOT NULL,
	[HID] [int] NULL,
	[TypeDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [date] NULL,
	[AccountCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Approved] [date] NULL,
	[Realised] [date] NULL,
	[Status] [smallint] NULL,
	[ItemCode_1] [nvarchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_01] [nvarchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [Domain] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EnviroAccountCreated]    Script Date: 24-sept.-18 14:21:20 ******/
CREATE CLUSTERED INDEX [EnviroAccountCreated] ON [domain].[Complaints]
(
	[Environment] ASC,
	[Created] ASC,
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
