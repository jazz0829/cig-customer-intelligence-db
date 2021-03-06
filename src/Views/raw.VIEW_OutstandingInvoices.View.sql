USE [CustomerIntelligence]
GO
/****** Object:  View [raw].[VIEW_OutstandingInvoices]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [raw].[VIEW_OutstandingInvoices]
GO
/****** Object:  View [raw].[VIEW_OutstandingInvoices]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [raw].[VIEW_OutstandingInvoices]
AS


SELECT --TOP 10 
	A.Environment
	, A.AccountCode
	, A.AccountID
	, A.[Name]
	, (CASE WHEN A.Blocked = 0 THEN 'No' WHEN A.Blocked = 1 THEN 'Yes' END) AS Blocked
	, ACS.LatestCommPackage
	, PC.Product
	, PC.Edition
	, ACS.LatestMRR
	, CASE WHEN ACS.LatestMRR > 0 THEN 'Yes' ELSE 'No' END AS 'MRR>0'
	, ACS.CommLifetimeMonths
	,(CASE  
		 WHEN RES.[Name] IS NOT NULL THEN 'Reseller'
		 WHEN A.LeadSourceCode = 'ENDORS' THEN 'Endorse'
		 WHEN RES.[Name] IS NULL THEN 'Direct'
		 ELSE 'Unknown' END) AS Channel		-- Was called DealType by Ronald
	, RES.[Name] AS ResellerName
	, ACC.AccountantName
	, ACM.AccountManagerName
	, ACS.LatestCommStartDate AS LatestContractSince
	, CONCAT(YEAR(ACS.LatestCommStartDate), RIGHT(100+MONTH(ACS.LatestCommStartDate),2)) AS ContractStartYearMonth
	, MAX(
		CONCAT
		(
			CASE 
				WHEN ACS.Environment = 'NL' THEN 'https://start.exactonline.nl/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'BE' THEN 'https://start.exactonline.be/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'FR' THEN 'https://start.exactonline.fr/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'UK' THEN 'https://start.exactonline.co.uk/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'US' THEN 'https://start.exactonline.com/docs/LicCustomerCard.aspx?Action=0&AccountID=%7b'
				WHEN ACS.Environment = 'ES' THEN 'https://start.exactonline.es/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'DE' THEN 'https://start.exactonline.de/docs/LicCustomerCard.aspx?AccountID=%7b'
				ELSE NULL END
		, LOWER(ACS.AccountID)
		, CASE 
			WHEN ACS.Environment = 'NL' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'US' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			WHEN ACS.Environment = 'DE' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'UK' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'BE' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			ELSE '%7d'
			END) 
		) AS EOLCard

	, ISNULL(SUM(InvoicePT.InvoicesSent), 0) AS TotalInvoicesSent
	, ISNULL(SUM(InvoicePT.PaymentMade), 0) AS TotalPayments
	, CASE WHEN(SUM(InvoicePT.PaymentMade)) > 0 THEN 'Yes' ELSE 'No' END AS EverMadePayment
	, ISNULL(SUM(InvoicePT.AmountOpen), 0) AS TotalAmountOpen
	, SUM(CASE WHEN InvoicePT.AmountOpen > 0 THEN InvoicePT.AmountOpen ELSE 0 END) AS TotalAROpen
	, SUM (CASE WHEN DATEDIFF(dd, InvoicePT.DueDate, GETDATE()) > 60 AND InvoicePT.AmountOpen > 0 THEN InvoicePT.AmountOpen ELSE 0 END) AS 'Overdue>60Days'		-- Uses InvoiceDate to determine aging - Need to check with Duncan whether to use this or DueDate field
	, SUM (CASE WHEN DATEDIFF(dd, InvoicePT.DueDate, GETDATE()) > 120 AND InvoicePT.AmountOpen > 0  THEN InvoicePT.AmountOpen ELSE 0 END) AS 'Overdue>120Days'	-- Uses InvoiceDate to determine aging - Need to check with Duncan whether to use this or DueDate field
	
	, SUM (CASE WHEN DATEDIFF(dd, InvoicePT.DueDate, GETDATE()) BETWEEN 1 AND 30 AND InvoicePT.AmountOpen > 0  THEN InvoicePT.AmountOpen ELSE 0 END) AS 'Overdue01-30Days'
	, SUM (CASE WHEN DATEDIFF(dd, InvoicePT.DueDate, GETDATE()) BETWEEN 31 AND 60 AND InvoicePT.AmountOpen > 0  THEN InvoicePT.AmountOpen ELSE 0 END) AS 'Overdue31-60Days'
	, SUM (CASE WHEN DATEDIFF(dd, InvoicePT.DueDate, GETDATE()) BETWEEN 61 AND 120 AND InvoicePT.AmountOpen > 0  THEN InvoicePT.AmountOpen ELSE 0 END) AS 'Overdue61-120Days'

	, ISNULL(AD.TotalPageViews,0) AS PageViewsInLastYear
	, ISNULL(AD.PageViewsLast30Days, 0) AS PageViewsLast30Days
	, ISNULL(AD.DaysActiveInLast30, 0) AS DaysActiveInLast30
	, ISNULL(AD.PageViewsLast90Days, 0) AS PageViewsLast90Days
	, ISNULL(AD.DaysActiveInLast90, 0) AS DaysActiveInLast90
	, MAX(CASE WHEN AD.PageViewsLast90Days >= 50 THEN 'Yes' ELSE 'No' END) AS ActiveInLast90Days		-- This is a placeholder definition of active or not

FROM domain.Accounts A

INNER JOIN
	domain.AccountsContract_Summary ACS
	ON A.Environment = ACS.Environment
	AND A.AccountCode = ACS.AccountCode

INNER JOIN
	domain.PackageClassification PC
	ON ACS.LatestCommPackage = PC.PackageCode
	AND ACS.Environment = PC.Environment

LEFT JOIN domain.Accounts RES
	ON a.Environment = res.Environment 
	AND a.ResellerCode = res.AccountCode

LEFT JOIN domain.Accountants ACC
	ON A.Environment = ACC.Environment
	AND A.AccountantCode = ACC.AccountantCode

LEFT JOIN domain.AccountsManager ACM
	ON A.AccountManagerCode = ACM.AccountManagerCode 

LEFT JOIN	
	(
		SELECT 
			a.Environment
			, a.AccountCode
			, pt.AccountID
			, pt.MatchID
			, MIN(CASE WHEN TransactionType = 20 THEN DueDate END) AS DueDate
			, -SUM(CAST(pt.AmountFC AS DECIMAL(9,2))) AS AmountOpen
			, SUM(CASE WHEN pt.TransactionType = 20 THEN 1 ELSE 0 END) AS InvoicesSent
			, SUM(CASE WHEN pt.TransactionType = 40 THEN 1 ELSE 0 END) AS PaymentMade
		FROM
			domain.Accounts A
		LEFT JOIN CustomerIntelligence.[raw].PaymentTerms pt                                                   
			ON a.AccountID = pt.AccountID 
		GROUP BY 
			a.Environment
			, a.AccountCode
			, pt.AccountID
			, pt.MatchID
	) InvoicePT
	ON A.Environment = InvoicePT.Environment
	AND A.AccountCode = InvoicePT.AccountCode

LEFT JOIN
	(
		SELECT 
			ad.Environment
			, ad.AccountCode
			, SUM (ad.Quantity) AS TotalPageViews 
			, SUM(CASE WHEN DATEDIFF (dd, ad.Date, GETDATE()) < 31 THEN ad.Quantity ELSE 0 END) as PageViewsLast30Days
			, COUNT(DISTINCT(CASE WHEN DATEDIFF (dd, ad.Date, GETDATE()) < 31 THEN [Date] ELSE NULL END)) AS DaysActiveInLast30
			, SUM(CASE WHEN DATEDIFF (dd, ad.Date, GETDATE()) < 91 THEN ad.Quantity ELSE 0 END) as PageViewsLast90Days  
			, COUNT(DISTINCT(CASE WHEN DATEDIFF (dd, ad.Date, GETDATE()) < 91 THEN [Date] ELSE NULL END)) AS DaysActiveInLast90
			, MAX (ad.Date) as LastLoginDate
		FROM domain.ActivityDaily ad
		WHERE 
			ad.ActivityID = 1		-- Selects only the TotalPageViews activity
			AND ad.[Date] >=  DATEADD(DAY, -361, GETDATE())	-- Selects activity from last year
		GROUP BY 
			ad.Environment
			, ad.AccountCode
	) AD
	ON AD.Environment = A.Environment 
	AND AD.AccountCode = A.AccountCode

WHERE
	ACS.Churned = 0				-- Selects only customers that have not churned  *NEED TO CHECK WITH DUNCAN*
	AND A.AccountClassificationCode IN ('EOL', 'ACC', 'AC7', 'JBO', 'AC1')		-- Selects only commercial account types  *ALSO NEED TO CHECK WITH DUNCAN*
	AND Product <> 'Partner'	-- Excludes Partner accounts
	AND A.AccountID IS NOT NULL
GROUP BY
	A.Environment
	, A.AccountCode
	, A.AccountID 
	, A.[Name]
	, A.Blocked
	, ACS.LatestCommPackage
	, PC.Product
	, PC.Edition
	, ACS.LatestMRR
	, ACS.CommLifetimeMonths
	, A.LeadSourceCode 
	, RES.[Name]
	, ACC.AccountantName
	, ACM.AccountManagerName
	, ACS.LatestCommStartDate
	, AD.TotalPageViews
	, AD.PageViewsLast30Days
	, AD.DaysActiveInLast30
	, AD.PageViewsLast90Days
	, AD.DaysActiveInLast90
GO
