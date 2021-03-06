USE [CustomerIntelligence]
GO
/****** Object:  Index [EnvironmentAccount]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [EnvironmentAccount] ON [domain].[ChurnAround]
GO
/****** Object:  Index [Created]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [Created] ON [domain].[ChurnAround] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[ChurnAround]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ChurnAround]
GO
/****** Object:  Table [domain].[ChurnAround]    Script Date: 24-sept.-18 14:21:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ChurnAround](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RequestID] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reasons1] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reasons2] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reasons3] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [datetime] NULL,
	[AccountID] [uniqueidentifier] NULL
) ON [Domain] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [Created]    Script Date: 24-sept.-18 14:21:18 ******/
CREATE CLUSTERED INDEX [Created] ON [domain].[ChurnAround]
(
	[Created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EnvironmentAccount]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [EnvironmentAccount] ON [domain].[ChurnAround]
(
	[Environment] ASC,
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
