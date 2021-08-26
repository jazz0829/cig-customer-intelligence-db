USE [CustomerIntelligence]
GO
/****** Object:  Index [ix_HOST_CIG_DivisionStatistics_Environment_CopyTime_CigProcessed]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [ix_HOST_CIG_DivisionStatistics_Environment_CopyTime_CigProcessed] ON [raw].[HOST_CIG_DivisionStatistics]
GO
/****** Object:  Index [ix_HOST_CIG_DivisionStatistics_CIGCopyTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [ix_HOST_CIG_DivisionStatistics_CIGCopyTime] ON [raw].[HOST_CIG_DivisionStatistics]
GO
/****** Object:  Index [Processed_Environment_Division_LastCopied]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [Processed_Environment_Division_LastCopied] ON [raw].[HOST_CIG_DivisionStatistics] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_DivisionStatistics]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_DivisionStatistics]
GO
/****** Object:  Table [raw].[HOST_CIG_DivisionStatistics]    Script Date: 24-sept.-18 14:22:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_DivisionStatistics](
	[OpportunityStageCount] [int] NOT NULL,
	[LeadSourceCount] [int] NOT NULL,
	[SalesTypeCount] [int] NOT NULL,
	[ReasonCodeCount] [int] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[Division] [int] NOT NULL,
	[GLTransactionsCount] [int] NULL,
	[CashEntryCount] [int] NULL,
	[CashEntryMaxLines] [int] NULL,
	[CashEntryAvgLines] [float] NULL,
	[CashTransactions] [int] NULL,
	[BankEntryCount] [int] NULL,
	[BankEntryMaxLines] [int] NULL,
	[BankEntryAvgLines] [float] NULL,
	[BankTransactions] [int] NULL,
	[BankEntryCountImport] [int] NULL,
	[BankEntryMaxLinesImport] [int] NULL,
	[BankEntryAvgLinesImport] [float] NULL,
	[BankTransactionsImport] [int] NULL,
	[BankEntryCountManual] [int] NULL,
	[BankEntryMaxLinesManual] [int] NULL,
	[BankEntryAvgLinesManual] [float] NULL,
	[BankTransactionsManual] [int] NULL,
	[SalesEntryCount] [int] NULL,
	[SalesEntryMaxLines] [int] NULL,
	[SalesEntryAvgLines] [float] NULL,
	[SalesTransactions] [int] NULL,
	[PurchaseEntryCount] [int] NULL,
	[PurchaseEntryMaxLines] [int] NULL,
	[PurchaseEntryAvgLines] [float] NULL,
	[PurchaseTransactions] [int] NULL,
	[GeneralJournalEntryCount] [int] NULL,
	[GeneralJournalEntryMaxLines] [int] NULL,
	[GeneralJournalEntryAvgLines] [float] NULL,
	[GeneralJournalTransactions] [int] NULL,
	[CostcenterTransactions] [int] NULL,
	[CostunitTransactions] [int] NULL,
	[VATTransactions] [int] NULL,
	[FCTransactions] [int] NULL,
	[DepreciationPlanCount] [int] NULL,
	[InvoiceLinesCount] [int] NULL,
	[BudgetCount] [int] NULL,
	[PaymentTermCount] [int] NULL,
	[SourceNormal] [int] NULL,
	[SourceBankImport] [int] NULL,
	[SourceXMLImport] [int] NULL,
	[SourceConversion] [int] NULL,
	[SourceInvoice] [int] NULL,
	[SourceRevaluation] [int] NULL,
	[SourceFixedEntry] [int] NULL,
	[SourceVATReturn] [int] NULL,
	[SourceGLMatching] [int] NULL,
	[SourceExchangeRateDiff] [int] NULL,
	[FixedSalesEntryCount] [int] NULL,
	[FixedPurchaseEntryCount] [int] NULL,
	[FixedGeneralJournalEntryCount] [int] NULL,
	[FixedSalesInvoiceCount] [int] NULL,
	[XBRLDocumentsBD] [int] NULL,
	[XBRLDocumentsKVK] [int] NULL,
	[LeadCount] [int] NULL,
	[OpportunityCount] [int] NULL,
	[QuoteCount] [int] NULL,
	[EmployeeCount] [int] NULL,
	[AccountCount] [int] NULL,
	[CustomerCount] [int] NULL,
	[SupplierCount] [int] NULL,
	[GLAccountCount] [int] NULL,
	[AssetCount] [int] NULL,
	[JournalCount] [int] NULL,
	[CashJournalCount] [int] NULL,
	[BankJournalCount] [int] NULL,
	[SalesJournalCount] [int] NULL,
	[PurchaseJournalCount] [int] NULL,
	[GeneralJournalCount] [int] NULL,
	[AllocationRuleCount] [int] NULL,
	[DocumentCount] [int] NULL,
	[ItemCount] [int] NULL,
	[BudgetScenarioCount] [int] NULL,
	[CostcenterCount] [int] NULL,
	[CostunitCount] [int] NULL,
	[ForeignCurrency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CurrencyCount] [int] NULL,
	[ExchangeRateCount] [int] NULL,
	[SepaBankAccountCount] [int] NULL,
	[PageViewsLastWeek] [int] NULL,
	[PageViewsLastMonth] [int] NULL,
	[LastLogin] [datetime] NULL,
	[BackupCount] [int] NULL,
	[RestoreCount] [int] NULL,
	[BackupsInUse] [int] NULL,
	[BackupMinBatch] [int] NULL,
	[BackupMaxBatch] [int] NULL,
	[LastBackup] [datetime] NULL,
	[LastRestore] [datetime] NULL,
	[InconsistentAR] [int] NULL,
	[InconsistentAP] [int] NULL,
	[InconsistentPTMatching] [int] NULL,
	[InconsistentGLMatching] [int] NULL,
	[InconsistentBalanceEntry] [int] NULL,
	[InconsistentBalancePeriod] [int] NULL,
	[InconsistentBalanceDate] [int] NULL,
	[InconsistentReportingBalance] [int] NULL,
	[SizeKB] [bigint] NULL,
	[AttachmentSizeKB] [bigint] NULL,
	[FullTextWordsSizeKB] [bigint] NULL,
	[BackupSizeKB] [bigint] NULL,
	[ApplicationLogSizeKB] [bigint] NULL,
	[GLTransactionsSizeKB] [bigint] NULL,
	[ConversionSource] [int] NULL,
	[StartupType] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TemplateDivision] [int] NULL,
	[TemplateCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxFrequency] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxReturnMethod] [smallint] NULL,
	[TaxSystem] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PeriodDateCheck] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IntrastatSales] [smallint] NULL,
	[IntrastatPurchase] [smallint] NULL,
	[RabobankAccounts] [int] NULL,
	[RabobankLinks] [int] NULL,
	[RabobankImportFiles] [int] NULL,
	[RabobankExportFiles] [int] NULL,
	[ABNAMROBankAccounts] [int] NULL,
	[ABNAMROBankLinks] [int] NULL,
	[ABNAMROBankStatementFiles] [int] NULL,
	[ProjectApproveEntries] [bigint] NULL,
	[ProjectUseProposal] [bigint] NULL,
	[ProjectMandatoryProject] [bigint] NULL,
	[ProjectConsolidateNone] [bigint] NULL,
	[ProjectConsolidateItem] [bigint] NULL,
	[ProjectConsolidateItemProject] [bigint] NULL,
	[ProjectConsolidateItemEmployee] [bigint] NULL,
	[ProjectConsolidateItemEmployeeProject] [bigint] NULL,
	[ProjectTypeFixedPrice] [bigint] NULL,
	[ProjectTypeTimeAndMaterial] [bigint] NULL,
	[ProjectTypeNonBillable] [bigint] NULL,
	[ProjectTotalEmployees] [bigint] NULL,
	[ProjectTotalTimeEntries] [bigint] NULL,
	[ProjectTotalCostEntries] [bigint] NULL,
	[CostPriceTransactionCount] [int] NULL,
	[SalesOrderEntryCount] [int] NULL,
	[SalesOrderEntryMaxLines] [int] NULL,
	[SalesOrderEntryAvgLines] [float] NULL,
	[SalesOrderLastCreationDate] [datetime] NULL,
	[DeliveryEntryCount] [int] NULL,
	[DeliveryEntryMaxLines] [int] NULL,
	[DeliveryEntryAvgLines] [float] NULL,
	[DeliveryTransactions] [int] NULL,
	[StockEntryReturnCount] [int] NULL,
	[StockEntryReturnMaxLines] [int] NULL,
	[StockEntryReturnAvgLines] [float] NULL,
	[StockEntryReturnTransactions] [int] NULL,
	[PurchaseOrderEntryCount] [int] NULL,
	[PurchaseOrderEntryMaxLines] [int] NULL,
	[PurchaseOrderEntryAvgLines] [float] NULL,
	[PurchaseOrderLastCreationDate] [datetime] NULL,
	[ReceiptEntryCount] [int] NULL,
	[ReceiptEntryMaxLines] [int] NULL,
	[ReceiptEntryAvgLines] [float] NULL,
	[ReceiptTransactions] [int] NULL,
	[ReceiptReturnCount] [int] NULL,
	[ReceiptReturnMaxLines] [int] NULL,
	[ReceiptReturnAvgLines] [float] NULL,
	[ReceiptReturnTransactions] [int] NULL,
	[StockCountEntryCount] [int] NULL,
	[StockCountEntryMaxLines] [int] NULL,
	[StockCountEntryAvgLines] [float] NULL,
	[StockCountTransactions] [int] NULL,
	[PsnSubscriptonTypeAutomaticallyRenewedCount] [bigint] NULL,
	[PsnSubscriptonTypeManuallyRenewedCount] [bigint] NULL,
	[PsnSubscriptonTypeNotRenewedCount] [bigint] NULL,
	[PsnSubscriptionAutomaticallyRenewedCount] [bigint] NULL,
	[PsnSubscriptionManuallyRenewedCount] [bigint] NULL,
	[PsnSubscriptionNotRenewedCount] [bigint] NULL,
	[PsnSubscriptionYearlyCount] [bigint] NULL,
	[PsnSubscriptionHalfYearlyCount] [bigint] NULL,
	[PsnSubscriptionQuarterlyCount] [bigint] NULL,
	[PsnSubscriptionMonthlyCount] [bigint] NULL,
	[PsnSubscriptionPrintedCount] [bigint] NULL,
	[PsnSubscriptionInvoiceCount] [bigint] NULL,
	[PsnAverageSubscriptionInvoiceAmount] [float] NULL,
	[ContractType] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastCollected] [datetime] NULL,
	[LastCopied] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[PayrollActiveEmployees] [bigint] NULL,
	[PayrollCLACount] [bigint] NULL,
	[PayrollDepartmentCount] [bigint] NULL,
	[PayrollJobtitleCount] [bigint] NULL,
	[PayrollDivisionType] [tinyint] NULL,
	[PayrollFrequencyYearlyExists] [tinyint] NULL,
	[PayrollFrequencyQuarterlyExists] [tinyint] NULL,
	[PayrollFrequencyMonthlyExists] [tinyint] NULL,
	[PayrollFrequency4WeeklyExists] [tinyint] NULL,
	[PayrollFrequencyWeeklyExists] [tinyint] NULL,
	[SourceElectronicInvoice] [int] NULL,
	[ElectronicSalesEntryCount] [int] NULL,
	[ElectronicPurchaseEntryCount] [int] NULL,
	[QuotationQuantitiesCount] [int] NULL,
	[QuotationMaterialsCount] [int] NULL,
	[QuotationRoutingStepsCount] [int] NULL,
	[ShopOrdersCount] [int] NULL,
	[ShopOrderMaterialsCount] [int] NULL,
	[ShopOrderRoutingStepsCount] [int] NULL,
	[ShopOrderMaterialRealizationsCount] [int] NULL,
	[ShopOrderRoutingStepRealizationsCount] [int] NULL,
	[ShopOrderMaterialIssuesCount] [int] NULL,
	[ShopOrderSubcontractIssuesCount] [int] NULL,
	[ShopOrderRoutingStepTimeEntriesCount] [int] NULL,
	[ShopOrderStockReceiptsCount] [int] NULL,
	[ShopOrderRoutingStepsMaxLines] [int] NULL,
	[ShopOrderRoutingStepsAvgLines] [float] NULL,
	[ShopOrderMaterialsMaxLines] [int] NULL,
	[ShopOrderMaterialsAvgLines] [float] NULL,
	[ShopOrderLastCreationDate] [datetime] NULL,
	[MailboxConnectionType] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MailboxProcessedEmailCount] [int] NULL,
	[MailboxProcessedEmailSize] [bigint] NULL,
	[MailboxProcessedAttachmentSize] [bigint] NULL,
	[RequestCount] [int] NULL,
	[CampaignCount] [int] NULL,
	[MarketingListCount] [int] NULL,
	[CampaignLinkedToMailChimpCount] [int] NULL,
	[MarketingListLinkedToMailChimpCount] [int] NULL,
	[AccountLinkedToLinkedInCount] [int] NULL,
	[ContactLinkedToLinkedInCount] [int] NULL,
	[AccountLinkedToTwitterCount] [int] NULL,
	[ContactLinkedToTwitterCount] [int] NULL,
	[InconsistentBatchItems] [int] NULL,
	[INGBankAccounts] [int] NULL,
	[INGBankLinks] [int] NULL,
	[INGBankStatementFiles] [int] NULL,
	[INGBankPaymentFiles] [int] NULL,
	[INGBankDirectDebitFiles] [int] NULL,
	[InconsistentSerialItems] [int] NULL,
	[InconsistentSalesOrderStatus] [int] NULL,
	[InconsistentPurchaseOrderStatus] [int] NULL,
	[AccountLinkedToAdministrationCount] [int] NULL,
	[AccountLinkedToMultipleAdministrationsCount] [int] NULL,
	[IndicatorsCount] [int] NULL,
	[StarterUsersAccessToCompanyCount] [int] NULL,
	[DocumentFoldersCount] [int] NULL,
	[DocumentsWithFolderCount] [int] NULL,
	[PurchaseSenderCount] [int] NULL,
	[SalesSenderCount] [int] NULL,
	[CrmSenderCount] [int] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[SalesInvoiceFirstDate] [datetime] NULL,
	[SalesInvoiceCount] [int] NULL,
	[SalesInvoiceAvgLines] [float] NULL,
	[SalesInvoiceMaxLines] [int] NULL,
	[DropshipSalesOrderCount] [int] NULL,
	[DropshipSupplierSalesOrderCount] [int] NULL,
	[SalesPriceListCount] [int] NULL,
	[SalesPriceListPeriodCount] [int] NULL,
	[SalesPriceListPeriodAvgItemCount] [float] NULL,
	[SalesPriceListPeriodMaxItemCount] [int] NULL,
	[PurchaseInvoiceCount] [int] NULL,
	[PurchaseInvoiceAvgLines] [float] NULL,
	[PurchaseInvoiceMaxLines] [int] NULL,
	[PurchasePriceListCount] [int] NULL,
	[PurchasePriceListPeriodCount] [int] NULL,
	[PurchasePriceListPeriodAvgItemCount] [float] NULL,
	[PurchasePriceListPeriodMaxItemCount] [int] NULL,
	[BatchItemCount] [int] NULL,
	[SerialItemCount] [int] NULL,
	[AssemblyOrderCount] [int] NULL,
	[WarehouseTransferCount] [int] NULL,
	[WarehouseTransferAvgLines] [float] NULL,
	[WarehouseTransferMaxLines] [int] NULL,
	[LocationTransferCount] [int] NULL,
	[LocationTransferAvgLines] [float] NULL,
	[LocationTransferMaxLines] [int] NULL,
	[UseAllowNegativeStock] [tinyint] NULL,
	[UseSalesOrderApproval] [tinyint] NULL,
	[UseTranssmart] [tinyint] NULL,
	[UseMandatorySerialNumber] [tinyint] NULL,
	[UseReceiveMoreThanOrdered] [tinyint] NULL,
	[ConsultancyDate] [datetime] NULL,
	[OpeningBalanceFirstDate] [datetime] NULL,
	[UsersWithChangedCompanyRightsCount] [int] NULL,
	[CustomersWithInvolvedUsersCount] [int] NULL,
	[UsersSetAsInvolvedCount] [int] NULL,
	[ProjectTotalAbsenceEntries] [int] NULL,
	[ProjectTotalLeaveEntries] [int] NULL,
	[ProjectTotalTimeCorrectionEntries] [int] NULL,
	[ProjectTotalSinglePlanning] [int] NULL,
	[ProjectTotalRecurringPlanning] [int] NULL,
	[ProjectTotalNationalHoliday] [int] NULL,
	[ProjectInvoiceAsQuoted] [int] NULL,
	[ProjectTypePrepaidRetainer] [int] NULL,
	[ProjectTypePrepaidHTB] [int] NULL,
	[ProjectWithWBS] [int] NULL,
	[ItemLowestLevelMax] [int] NULL,
	[ShopOrderSubOrderLevelMax] [int] NULL,
	[ScanningServiceLastUsage] [datetime] NULL,
	[EmployeesWithEmployeeRateCount] [int] NULL,
	[FreeIntField_01] [int] NULL,
	[FreeIntField_02] [int] NULL,
	[FreeIntField_03] [int] NULL,
	[FreeIntField_04] [int] NULL,
	[FreeIntField_05] [int] NULL,
	[FreeIntField_06] [int] NULL,
	[FreeIntField_07] [int] NULL,
	[FreeIntField_08] [int] NULL,
	[FreeIntField_09] [int] NULL,
	[FreeIntField_10] [int] NULL,
	[FreeIntField_11] [int] NULL,
	[FreeIntField_12] [int] NULL,
	[FreeIntField_13] [int] NULL,
	[FreeIntField_14] [int] NULL,
	[FreeIntField_15] [int] NULL,
	[FreeIntField_16] [int] NULL,
	[FreeIntField_17] [int] NULL,
	[FreeIntField_18] [int] NULL,
	[FreeIntField_19] [int] NULL,
	[FreeIntField_20] [int] NULL,
	[FreeTextField_01] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_02] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_03] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_04] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_05] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeDateField_01] [datetime] NULL,
	[FreeDateField_02] [datetime] NULL,
	[FreeDateField_03] [datetime] NULL,
	[FreeDateField_04] [datetime] NULL,
	[FreeDateField_05] [datetime] NULL,
	[FreeDateField_06] [datetime] NULL,
	[FreeDateField_07] [datetime] NULL,
	[FreeDateField_08] [datetime] NULL,
	[FreeDateField_09] [datetime] NULL,
	[FreeDateField_10] [datetime] NULL,
	[PsnSubscriptionMidtermChangeCount] [int] NULL,
	[HourTypeCount] [int] NULL,
	[ProjectConsolidateItemProjectWBS] [int] NULL,
	[ProjectConsolidateItemEmployeeProjectWBS] [int] NULL,
	[ProjectPlanningCommunicationEWS] [int] NULL,
	[ProjectPlanningCommunicationOffice365] [int] NULL,
	[EmployeeRestrictions] [int] NULL,
	[HourTypeRestrictions] [int] NULL,
	[CostTypeRestrictions] [int] NULL,
	[RebillingRestrictions] [int] NULL,
	[ProjectHourTypeBudget] [int] NULL,
	[PsnSubscriptionOneTimeFees] [int] NULL,
	[ItemListExtraFieldsCount] [int] NULL,
	[ItemTextExtraFieldsCount] [int] NULL,
	[BankAccountsCount] [int] NULL,
	[BankLinksCount] [int] NULL,
	[BankImportFilesCount] [int] NULL,
	[BankExportFilesCount] [int] NULL,
	[HRMApproveLeave] [tinyint] NULL,
	[HRMApproveLeaveBuildUp] [tinyint] NULL,
	[ProjectBlockHistoricalEntry] [tinyint] NULL,
	[ProjectDefaultAlertWhenExceeding] [tinyint] NULL,
	[ProjectInvoiceProposalReasons] [tinyint] NULL,
	[ProjectNotesMandatory] [tinyint] NULL,
	[ProjectRequiresProjectWBS] [tinyint] NULL,
	[ProjectSendEmails] [tinyint] NULL,
	[AutomatedBankImportSetting] [tinyint] NULL,
	[GLAccountClassificationLinksRGS1] [int] NULL,
	[GLAccountClassificationLinksRGS3] [int] NULL,
	[GlAccountSuggestionsDirectEntrySetting] [tinyint] NULL,
	[SmartMatchingWriteOffBoundarySetting] [float] NULL,
	[ProjectTotalLeaveBuildUpEntries] [int] NULL,
	[CtibIngBankCount] [int] NULL,
	[CtibOthersBankCount] [int] NULL,
	[CtibMatchesCount] [int] NULL,
	[CtibDisabledCount] [int] NULL,
	[BatchesPerPaymentFileAvgCount] [float] NULL,
	[BatchesPerPaymentFileMaxCount] [int] NULL,
	[PaymentTransactionsPerBatchAvgCount] [float] NULL,
	[PurchaseEntryCountForLast90Days] [int] NULL,
	[ElectronicPurchaseEntryCountForLast90Days] [int] NULL,
	[ClientActivityMonthlyExists] [smallint] NULL,
	[InactiveAccountCount] [int] NULL,
	[AnonymizedAccountCount] [int] NULL,
	[ContactCount] [int] NULL,
	[AnonymizedContactCount] [int] NULL,
	[InactiveEmployeeCount] [int] NULL,
	[AnonymizedEmployeeCount] [int] NULL,
	[UserCount] [int] NULL,
	[InactiveUserCount] [int] NULL,
	[AnonymizedUserCount] [int] NULL,
	[ScanningServiceAutomaticBooking] [tinyint] NULL,
	[LastCollectedInconsistencies] [datetime] NULL,
	[OfficialReturnWithDuplicateDetailsCount] [int] NULL,
	[DocumentMissingOfficialReturnCount] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Processed_Environment_Division_LastCopied]    Script Date: 24-sept.-18 14:22:07 ******/
CREATE CLUSTERED INDEX [Processed_Environment_Division_LastCopied] ON [raw].[HOST_CIG_DivisionStatistics]
(
	[CIGProcessed] ASC,
	[Environment] ASC,
	[Division] ASC,
	[LastCopied] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_HOST_CIG_DivisionStatistics_CIGCopyTime]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [ix_HOST_CIG_DivisionStatistics_CIGCopyTime] ON [raw].[HOST_CIG_DivisionStatistics]
(
	[Division] ASC,
	[Environment] ASC,
	[CIGCopyTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_HOST_CIG_DivisionStatistics_Environment_CopyTime_CigProcessed]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [ix_HOST_CIG_DivisionStatistics_Environment_CopyTime_CigProcessed] ON [raw].[HOST_CIG_DivisionStatistics]
(
	[Environment] ASC,
	[CIGCopyTime] ASC,
	[CIGProcessed] ASC
)
INCLUDE ( 	[Division]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
