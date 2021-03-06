USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[CreditManagementStatus_DescriptionEN]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[CreditManagementStatus_DescriptionEN]
GO
/****** Object:  View [domain].[CreditManagementStatus_DescriptionEN]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [domain].[CreditManagementStatus_DescriptionEN]
AS

SELECT 
	[ID]
    ,[Code]
    ,[Description]
    ,[DescriptionTermID]
    ,[Division]
    ,[IsActive]
    ,[syscreated]
    ,[syscreator]
    ,[sysmodified]
    ,[sysmodifier]
    ,[CIGCopyTime]
    ,[Environment]
    ,[CIGProcessed]
	, CASE 
		WHEN Code = 0 THEN 'Direct Debit (DD)'
		WHEN Code = 1 THEN 'Collection Agency'
		WHEN Code = 2 THEN 'Bankrupt'
		WHEN Code = 3 THEN 'Dispute'
		WHEN Code = 4 THEN 'To collection agency'
		WHEN Code = 5 THEN 'WSNP'
		WHEN Code = 6 THEN 'External help to pay debt'
		WHEN Code = 7 THEN 'Suspension of payment'
		WHEN Code = 8 THEN 'Payment Arrangement'
		WHEN Code = 9 THEN 'List of invoices to deliver to collection agency'
		WHEN Code = 10 THEN 'Blocked due to non payment'
		WHEN Code = 11 THEN 'Contract Cancellation'
		WHEN Code = 12 THEN 'No reminder'
		WHEN Code = 13 THEN 'Proof of payment received'
		WHEN Code = 14 THEN 'Paid to Third party collection'
		WHEN Code = 15 THEN 'Complaint'
		ELSE NULL
		END AS DescriptionEN
FROM domain.CreditManagementStatus


GO
