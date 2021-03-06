USE [CustomerIntelligence]
GO
/****** Object:  View [dbo].[VIEW_AccPremFirstLogin]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [dbo].[VIEW_AccPremFirstLogin]
GO
/****** Object:  View [dbo].[VIEW_AccPremFirstLogin]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[VIEW_AccPremFirstLogin] AS
Select 
AD.Environment, 
AD.Date, 
AD.AccountCode,
ACS.LatestCommStartDate,
DATEDIFF("D",ACS.LatestCommStartDate,AD.Date) AS DateDifference,
ROW_NUMBER ( )   
    OVER (Partition by AD.AccountCode, AD.Environment Order by DATEDIFF("D",ACS.LatestCommStartDate,AD.Date)) AS RowNumber

From domain.ActivityDaily AD
JOIN domain.AccountsContract_Summary ACS
ON AD.AccountCode=ACS.AccountCode AND AD.Environment=ACS.Environment
Where ActivityID='1'
AND LatestCommPackage='EOLPREMIUM'
AND LatestCommStartDate>='2016-07-31'
AND Churned='0'
AND Date>='2016-07-31'
AND DATEDIFF("D",ACS.LatestCommStartDate,AD.Date)>0
GROUP BY AD.Environment, AD.AccountCode, Date, ACS.LatestCommStartDate
GO
