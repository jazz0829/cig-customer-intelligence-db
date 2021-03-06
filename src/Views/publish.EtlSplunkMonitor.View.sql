USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[EtlSplunkMonitor]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[EtlSplunkMonitor]
GO
/****** Object:  View [publish].[EtlSplunkMonitor]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [publish].[EtlSplunkMonitor] AS 
SELECT StartDate, EndDate,  CASE WHEN DATEDIFF(HOUR,(StartDate), GETDATE())>4  THEN 1 ELSE 0 END AS Warning
  FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported]
GO
