USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[KeyEvents_All]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[KeyEvents_All]
GO
/****** Object:  Table [domain].[KeyEvents_All]    Script Date: 24-sept.-18 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[KeyEvents_All](
	[AccountID] [uniqueidentifier] NOT NULL,
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionCode] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Key Event] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Key Event timestamp] [datetime] NULL,
	[InsertedDatetime] [datetime] NULL
) ON [PRIMARY]
GO
