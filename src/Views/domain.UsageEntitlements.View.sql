USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[UsageEntitlements]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[UsageEntitlements]
GO
/****** Object:  View [domain].[UsageEntitlements]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================================================================================================
-- Author:		Alex Green 
-- Create date: 27/10/2017
-- Description:	Creates a view of the raw.HOST_CIG_UsageEntitlements table. 
-- ===============================================================================================================================================

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [domain].[UsageEntitlements]
AS

WITH UsageEntitlements
AS
(
	SELECT [ID], [Division], [Account], [Item], [StartDate], [EndDate], [ExpirationDate], [OriginalQuantity], [UnitPrice], [ActualQuantity], [syscreated], [syscreator], [sysmodified], [sysmodifier], [CIGCopyTime], [Environment], [CIGProcessed]
		, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RN -- Orders by the latest record  
	FROM [raw].[HOST_CIG_UsageEntitlements]
)

SELECT 
	[ID] AS UsageEntitlementID
	, [Account] AS AccountID
	, [Item] AS ItemID
	, [Environment]
	, [StartDate]
	, [EndDate]
	, [ExpirationDate]
	, [OriginalQuantity]
	, [UnitPrice]
	, [ActualQuantity]
	, [CIGCopyTime]
	, [syscreated]
	, [syscreator]
	, [sysmodified]
	, [sysmodifier]
FROM UsageEntitlements
WHERE RN = 1 -- Only selects the latest record
GO
