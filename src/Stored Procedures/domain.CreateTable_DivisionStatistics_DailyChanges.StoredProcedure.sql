USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DivisionStatistics_DailyChanges]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_DivisionStatistics_DailyChanges]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DivisionStatistics_DailyChanges]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [domain].[CreateTable_DivisionStatistics_DailyChanges]

AS
BEGIN

-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 08/02/2017
-- Description:	This procedure drops the previous version of the DivisionStatistics_DailyChanges table and rebuilds it. 
--				This table shows the changes in DivisionStatistics for selected columns.
-- =====================================================================================================================================================================


IF OBJECT_ID (N'CustomerIntelligence.domain.DivisionStatistics_DailyChanges', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.DivisionStatistics_DailyChanges

CREATE TABLE CustomerIntelligence.domain.DivisionStatistics_DailyChanges
(
	[Environment] [nchar](3) NOT NULL ,				
	[DivisionCode] [int] NOT NULL ,
	[Date] [date] NULL,

	[GLTransactionsCount] [int] NULL ,
	[VATTransactions] [int] NULL,
	[InvoiceLinesCount] [int] NULL,
	[SourceVATReturn] [int] NULL,

	[OpportunityCount] [int] NULL,
	[AccountCount] [int] NULL,
	[CustomerCount] [int] NULL,
	[SupplierCount] [int] NULL,
	
	[GLAccountCount] [int] NULL,
	[DocumentCount] [int] NULL,
	[ItemCount] [int] NULL,

	[CashEntryCount] [int] NULL,
	[CashTransactions] [int] NULL,

	[AutomaticBankLink] [int] NULL,
	[RabobankAccounts] [int] NULL,
	[ABNAMROBankAccounts] [int] NULL,
	[INGBankAccounts] [int] NULL,
	
	[BankEntryCount] [int] NULL,
	[BankTransactions] [int] NULL,
	[BankTransactionsImport] [int] NULL,
	[BankTransactionsManual] [int] NULL,

	[SalesEntryCount] [int] NULL,
	[SalesTransactions] [int] NULL,

	[PurchaseEntryCount] [int] NULL,
	[PurchaseTransactions] [int] NULL,

	[GeneralJournalEntryCount] [int] NULL,
	[GeneralJournalTransactions] [int] NULL,

	[ProjectTotalEmployees] [bigint] NULL,
	[ProjectTotalTimeEntries] [bigint] NULL,
	[ProjectTotalCostEntries] [bigint] NULL,
	
	[ProjectTypeFixedPrice] [bigint] NULL,
	[ProjectTypeTimeAndMaterial] [bigint] NULL,
	[ProjectTypeNonBillable] [bigint] NULL,
	[ProjectTypePrepaidRetainer] [int] NULL,
	[ProjectTypePrepaidHTB] [int] NULL,

	[SalesOrderEntryCount] [int] NULL,
	
	[StockCountEntryCount] [int] NULL,
	[StockCountTransactions] [int] NULL,
	[SalesInvoiceCount] [int] NULL,

	[PurchaseInvoiceCount] [int] NULL,
	StarterUsersAccessToCompanyCount int
	, UsersWithChangedCompanyRightsCount int
	, UsersSetAsInvolvedCount int
	, CustomersWithInvolvedUsersCount int
	, LeadSourceCount int
	, ElectronicPurchaseEntryCount bigint
	, ElectronicSalesEntryCount bigint
	
)

CREATE CLUSTERED INDEX IX_Environment_DivisionCode_Date ON CustomerIntelligence.[domain].DivisionStatistics_DailyChanges (Environment, DivisionCode, [Date]) ;

END
GO
