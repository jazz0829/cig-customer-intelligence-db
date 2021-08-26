USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[EOLActivityLog_LastTimeWindowImported]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[EOLActivityLog_LastTimeWindowImported]
GO
/****** Object:  Table [config].[EOLActivityLog_LastTimeWindowImported]    Script Date: 24-sept.-18 14:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[EOLActivityLog_LastTimeWindowImported](
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
