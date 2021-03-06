USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[ChurnPredictionModelEvaluation]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[ChurnPredictionModelEvaluation]
GO
/****** Object:  Table [config].[ChurnPredictionModelEvaluation]    Script Date: 24-sept.-18 14:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[ChurnPredictionModelEvaluation](
	[Product] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phase] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrainDate] [datetime] NULL,
	[ModelName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReferenceDateEvaluation] [datetime] NULL,
	[AUC] [float] NULL
) ON [PRIMARY]
GO
