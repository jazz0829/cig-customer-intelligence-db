USE [CustomerIntelligence]
GO
/****** Object:  Index [AccountsManagerCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [AccountsManagerCode] ON [domain].[AccountsManager] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[AccountsManager]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[AccountsManager]
GO
/****** Object:  Table [domain].[AccountsManager]    Script Date: 24-sept.-18 14:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[AccountsManager](
	[AccountManagerCode] [int] NULL,
	[AccountManagerName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessLineCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessLineDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountManagerID] [uniqueidentifier] NULL,
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [Domain]
GO
/****** Object:  Index [AccountsManagerCode]    Script Date: 24-sept.-18 14:21:12 ******/
CREATE CLUSTERED INDEX [AccountsManagerCode] ON [domain].[AccountsManager]
(
	[AccountManagerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
