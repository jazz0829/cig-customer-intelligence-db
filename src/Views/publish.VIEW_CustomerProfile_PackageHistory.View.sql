USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_PackageHistory]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_CustomerProfile_PackageHistory]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_PackageHistory]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_CustomerProfile_PackageHistory]
AS


SELECT 
	CONCAT(Contracts.Environment, AccountCode) AS EnviroAccountCode
	, Contracts.Environment
	, Contracts.AccountCode
	, ContractType AS [Contract Type]
	, ContractEventDescription AS [Contract Event]
	, StartDate AS [Start Date]
	, Contracts.ItemCode AS [Package]
	, PC.Product
	, PC.Edition

FROM domain.Contracts

JOIN domain.PackageClassification PC
	ON Contracts.Environment = PC.Environment
	AND Contracts.ItemCode = PC.PackageCode

JOIN domain.ContractEventTypes CET
	ON CET.Environment = Contracts.Environment
	AND CET.ContractEventTypeCode = Contracts.ContractEventTypeCode
		
WHERE
	LinePackage = 1
	AND InflowOutflow = 'Inflow'
	AND ContractEventDescription <> 'Price increase'

GO
