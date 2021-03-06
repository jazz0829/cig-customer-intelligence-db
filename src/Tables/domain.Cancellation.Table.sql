USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Cancellation]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Cancellation]
GO
/****** Object:  Table [domain].[Cancellation]    Script Date: 24-sept.-18 14:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Cancellation](
	[RequestID] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Environment] [nchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[TypeDescription] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCancellation] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
