USE [CustomerIntelligence]
GO
/****** Object:  Table [publish].[Divisions_AdoptionChangePoints]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [publish].[Divisions_AdoptionChangePoints]
GO
/****** Object:  Table [publish].[Divisions_AdoptionChangePoints]    Script Date: 24-sept.-18 14:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [publish].[Divisions_AdoptionChangePoints](
	[DivisionCode] [int] NULL,
	[Environment] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Index] [int] NULL,
	[Type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsChangePoint] [float] NULL,
	[IsAdoptionPoint] [float] NULL,
	[DateProcessed] [datetime] NULL
) ON [PRIMARY]
GO
