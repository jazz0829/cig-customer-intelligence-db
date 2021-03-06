USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[LinkedAccountantLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[LinkedAccountantLog]
GO
/****** Object:  Table [domain].[LinkedAccountantLog]    Script Date: 24-sept.-18 14:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[LinkedAccountantLog](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LinkStatus] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date] [date] NULL,
	[NewAccountantCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PreviousAccountantCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
