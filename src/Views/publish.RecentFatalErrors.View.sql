USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[RecentFatalErrors]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[RecentFatalErrors]
GO
/****** Object:  View [publish].[RecentFatalErrors]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [publish].[RecentFatalErrors] AS 
SELECT Date, ComponentName, Message
FROM config.ETLLog
WHERE Level = 'Fatal' AND DATEDIFF(DAY,Date,GETDATE())<7
GO
