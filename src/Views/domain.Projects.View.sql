USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Projects]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Projects]
GO
/****** Object:  View [domain].[Projects]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================================================================================================
-- Author:		Alex Green 
-- Create date: 27/10/2017
-- Description:	Creates a view of the raw.HOST_CIG_Projects table. 
-- ===============================================================================================================================================

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [domain].[Projects]
AS

WITH Projects
AS
(
	SELECT [ID], [Code], [Description], [Manager], [Division], [StartDate], [EndDate], [ProposalDocument], [ActionCode], [syscreated], [syscreator], [sysmodified], [sysmodifier], [DescriptionTermID], [Account], [Notes], [Type], [SalesTimeQuantity], [SalesAmountDC], [FixedPriceItem], [TimeQuantityToAlert], [Classification], [CustomerPOnumber], [CostsAmountFC], [PrepaidType], [PurchaseMarkupPercentage], [PrepaidItem], [UseBillingMilestones], [BudgetSalesAmountDC], [BudgetCostsAmountDC], [AllowAdditionalInvoicing], [BlockEntry], [BlockRebilling], [AccountContact], [BudgetType], [InvoiceAsQuoted], [SourceQuotation], [FinancialYear], [CIGCopyTime], [Environment], [CIGProcessed],	
		ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RN -- Orders by the latest record per ProjectID
	FROM [raw].[HOST_CIG_Projects]
)

SELECT 
	ID AS ProjectID
	, Code AS ProjectCode
	, [Description]
	, Account AS AccountID
	, AccountContact AS AccountContactID
	, Environment
	, StartDate
	, EndDate
	, ProposalDocument
	, ActionCode
	, DescriptionTermID
	, Notes 
	, Manager AS ManagerID 
	, [Type]
	, [SalesTimeQuantity]
	, [SalesAmountDC]
	, [FixedPriceItem]
	, [TimeQuantityToAlert]
	, [Classification] AS ClassificationID
	, [CustomerPOnumber]
	, [CostsAmountFC]
	, [PrepaidType]
	, [PurchaseMarkupPercentage]
	, [PrepaidItem]
	, [UseBillingMilestones]
	, [BudgetSalesAmountDC]
	, [BudgetCostsAmountDC]
	, [AllowAdditionalInvoicing]
	, [BlockEntry]
	, [BlockRebilling]
	, [BudgetType]
	, [InvoiceAsQuoted]
	, [SourceQuotation]
	, [FinancialYear]
	, [CIGCopyTime]
	, syscreated
	, syscreator
	, sysmodified
	, sysmodifier
FROM Projects
WHERE RN = 1 -- Takes the latest record per ProjectID
GO
