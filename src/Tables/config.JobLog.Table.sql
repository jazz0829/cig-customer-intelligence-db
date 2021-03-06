USE [CustomerIntelligence]
GO
/****** Object:  Index [StartEndTime]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [StartEndTime] ON [config].[JobLog] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [config].[JobLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[JobLog]
GO
/****** Object:  Table [config].[JobLog]    Script Date: 24-sept.-18 14:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[JobLog](
	[StartEndTime] [datetime] NULL,
	[Job] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Action] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
/****** Object:  Index [StartEndTime]    Script Date: 24-sept.-18 14:21:06 ******/
CREATE CLUSTERED INDEX [StartEndTime] ON [config].[JobLog]
(
	[StartEndTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
