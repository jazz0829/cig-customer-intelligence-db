USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_ContractHistory]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_CustomerProfile_ContractHistory]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_ContractHistory]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_CustomerProfile_ContractHistory]
AS


--Builds the Common Table Expression that the main table and two unions are built on
WITH CTE
AS
	(
		SELECT 
			ACS.AccountID
			, Contracts.ContractEventTypeCode
			, Contracts.EventDate
			, CET.ContractEventDescription
			, IC.ItemDescription
			, CASE WHEN Contracts.ContractEventTypeCode = 'PI' THEN 0 ELSE Contracts.LinePackage END AS LinePackage
			, Contracts.InflowOutflow
			, SUM(CASE WHEN Contracts.ContractType = 'T' THEN 0 WHEN Contracts.ContractType = 'C' THEN Contracts.ValuePerMonth END) OVER(PARTITION BY Contracts.Environment, Contracts.AccountCode ORDER BY Contracts.EventDate) AS SumMRR		-- Calculates a cummulative MRR value
			, SUM(Contracts.Quantity) OVER(PARTITION BY Contracts.Environment, Contracts.AccountCode, Contracts.EventDate, CET.ContractEventDescription, IC.ItemDescription ORDER BY Contracts.EventDate) AS Quantity	-- Calculates the aggregate quantity change to the contract item (sum of inflow and outflow)
		FROM
			domain.Contracts
		INNER JOIN domain.AccountsContract_Summary ACS
			ON Contracts.Environment = ACS.Environment
			AND Contracts.AccountCode = ACS.AccountCode
		INNER JOIN domain.ContractEventTypes CET
			ON CET.Environment = Contracts.Environment
			AND CET.ContractEventTypeCode = Contracts.ContractEventTypeCode
		INNER JOIN domain.ItemClassification IC
			ON IC.Environment = Contracts.Environment
			AND IC.ItemCode = Contracts.ItemCode
			WHERE Contracts.EventDate>='2010-01-01'
	)

SELECT 
	AccountID
	, EventDate
	, CONCAT(ContractEventDescription, ' | ', ItemDescription, ' | Quantity ', Quantity) AS [Description]	-- Concatenates the Contract Event Description, Item Description and Quantity for a description of the contract change
	, LinePackage
	, SumMRR
FROM CTE
WHERE AccountID IS NOT NULL
AND EventDate>='2010-01-01'

-- This first UNION statement creates a date occurence before the change made in the Contracts table for the customer
-- This is so the line charts for Contract History have a period of time to connect a particular MRR value for
UNION
SELECT
	AccountID
	, DATEADD(DAY, -1, EventDate) AS EventDate
	, NULL AS [Description]
	, NULL AS LinePackage
	, LAG(SumMRR, 1, 0) OVER(PARTITION BY AccountID ORDER BY EventDate) AS SumMRR
FROM
	cte
WHERE AccountID IS NOT NULL
AND EventDate>='2010-01-01'
GROUP BY 
	AccountID
	, EventDate
	, SumMRR

-- This second UNION takes the latest MRR status for either a change being made in the future, or if there are no future changes, the current date
-- This is to give the line charts for Contract History a date to show the current MRR status 
UNION
SELECT
	AccountID
	, CASE WHEN EventDate >= GETDATE() THEN EventDate ELSE CAST(GETDATE() AS DATE) END AS EventDate
	, NULL AS [Description]
	, NULL AS LinePackage
	, SumMRR
FROM
	(
		SELECT 
			AccountID
			, EventDate
			, SumMRR
			, ROW_NUMBER() OVER(PARTITION BY AccountID ORDER BY EventDate DESC) AS RowNumber	
		FROM
			cte
	) LatestRow
WHERE RowNumber = 1		--takes the latest row from Contracts
AND AccountID IS NOT NULL
AND EventDate>='2010-01-01'
;
GO
