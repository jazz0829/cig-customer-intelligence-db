USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[AccountIDsHashed]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[AccountIDsHashed]
GO
/****** Object:  Table [domain].[AccountIDsHashed]    Script Date: 24-sept.-18 14:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[AccountIDsHashed](
	[AccountId] [uniqueidentifier] NOT NULL,
	[AccountIdHashed] [char](28) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountIdHashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
