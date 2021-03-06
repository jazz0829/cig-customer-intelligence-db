USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[AppUsage_Last3Months]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[AppUsage_Last3Months]
GO
/****** Object:  View [domain].[AppUsage_Last3Months]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [domain].[AppUsage_Last3Months] AS

SELECT 
	ID,
	Environment,
	UsedOnDate,
	UsedDivision,
	UserID,
	AppID,
	AppDescription
FROM (
SELECT 
	ID,
	AU.Environment,
	UsedOnDate,
	UsedDivision,
	UserID,
	OA.ApplicationID AS AppID,
	OA.Description AS AppDescription,
	ROW_NUMBER() OVER (Partition By ID ORDER BY AU.CIGCopyTime desc) AS RowNumber
FROM [CustomerIntelligence].[domain].[AppUsageLines] AU
JOIN domain.OAuthClients OA
ON AU.OAuthClient=OA.ApplicationID
WHERE UsedOnDate>=DATEADD(M,-3,getdate())AND OA.PublishDate IS NOT NULL) SUB
WHERE RowNumber='1'
GO
