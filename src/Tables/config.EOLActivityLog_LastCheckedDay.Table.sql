USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[EOLActivityLog_LastCheckedDay]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[EOLActivityLog_LastCheckedDay]
GO
/****** Object:  Table [config].[EOLActivityLog_LastCheckedDay]    Script Date: 24-sept.-18 14:21:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[EOLActivityLog_LastCheckedDay](
	[Datetime] [date] NOT NULL
) ON [PRIMARY]
GO
