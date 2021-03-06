USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[ActivityLog_LastMonth]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[ActivityLog_LastMonth]
GO
/****** Object:  View [domain].[ActivityLog_LastMonth]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [domain].[ActivityLog_LastMonth]
AS
SELECT *
FROM raw.EOLActivityLog
WHERE DATEPART(m, LogDateTime) = DATEPART(m, DATEADD(m, -1, getdate()))
AND DATEPART(yyyy, LogDateTime) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
AND (Type='0' OR App='PlannedOrdersHandler')
AND App <> 'Clearsession.aspx' 
AND App NOT LIKE 'handlers%'
AND App <> 'MenuPortal.aspx'
AND App <> 'auth'
AND App NOT LIKE 'XML%' 
GO
