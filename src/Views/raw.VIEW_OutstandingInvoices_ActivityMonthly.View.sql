USE [CustomerIntelligence]
GO
/****** Object:  View [raw].[VIEW_OutstandingInvoices_ActivityMonthly]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [raw].[VIEW_OutstandingInvoices_ActivityMonthly]
GO
/****** Object:  View [raw].[VIEW_OutstandingInvoices_ActivityMonthly]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [raw].[VIEW_OutstandingInvoices_ActivityMonthly]
AS


SELECT 
	ACPM.AccountID
	, ACPM.YearMonth
	, CASE WHEN SUM(AM.Quantity) >= 50 THEN 'Yes' ELSE 'No' END AS CustomerActive	-- Active defined as 50 page views or more, not happy with this definition though
FROM domain.AccountsContract_PerMonth ACPM

LEFT JOIN domain.ActivityMonthly AM
	ON ACPM.Environment = AM.Environment
	AND ACPM.AccountCode = AM.AccountCode
	AND ACPM.YearMonth = AM.YearMonth

WHERE 
	ACPM.YearMonth >= CONCAT(YEAR(DATEADD(MONTH, -12, GETDATE())), RIGHT(100 + MONTH(DATEADD(MONTH, -12, GETDATE())),2))
	AND ACPM.ContractType = 'C'
	AND AM.ActivityID = 1

GROUP BY
	ACPM.AccountID
	, ACPM.YearMonth
GO
