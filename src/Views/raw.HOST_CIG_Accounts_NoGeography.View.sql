USE [CustomerIntelligence]
GO
/****** Object:  View [raw].[HOST_CIG_Accounts_NoGeography]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [raw].[HOST_CIG_Accounts_NoGeography]
GO
/****** Object:  View [raw].[HOST_CIG_Accounts_NoGeography]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [raw].[HOST_CIG_Accounts_NoGeography]
as
select Division, ID, CreditLineSales, CreditLinePurchase, DiscountSales, DiscountPurchase, IsBank, IsPilot, IsSupplier, IsSales, IsPurchase, IsReseller, IsAccountant, IsCompetitor, IsMember, Blocked, PurchaseOrderConfirmation, Reminder, InvoiceCopies, BackOrders, Attention, IsAgency, UseTimeSpecification, IsMailing, CostPaid, SeparateInvPerProject, SeparateInvPerSubscription, ConsolidationScenario, SecurityLevel, syscreated, CanDropShip, sysmodified, sysmodifier, SalesCurrency, SBICode, DateModifiedByCoC, syscreator, DunsNumber, CreditManagementScenario, CreditManagementStatus, GLAccountSales, GLAccountPurchase, GLAR, GLAP, ControlledDate, WebService, PurchaseCurrency, ProfitPercentage, LaborMarkupPercentage, PurchaseMarkupPercentage, QuotationMarkupType, TaxReferenceNumber, SepaDDCreditorIdentifier, PurchaseMarkupPercentageProject, ChamberOfCommerceEstablishment, SirenNumber, VatSystem, Extension, Geolocation.STAsText() as Geolocation, 
TradeName, EstablishedDate, RSIN, CIGCopyTime, Environment, CIGProcessed, ShippingMethod, ShippingLeadDays, PurchaseLeadDays, LeadSource, CodeAtSupplier, CheckDate, CreditManager, CreditabilityScenario, VATLiability, StartDate, EndDate, CustomerSince, PriceList, Accountant, AccountantAccountManager, SalesVATCode, PurchaseVATCode, IntraStatSystem, IntraStatTransactionA, IntraStatTransactionB, IntraStatTransportMethod, IntraStatDeliveryTerm, IntraStatArea, DatabaseID, Language, MainDivision, CustomerDivision, Longitude,Latitude, 
PaymentConditionSales, PaymentConditionPurchase, SalesOrderConfirmation, Code, SearchCode, MainContact, Parent, Name, TimeZone, Type, Status, StatusSince, Rating, Origin, Document, Classification, WebAccessSince, ProcessedByBackgroundJob, RecepientOfCommissions, Costcenter, Currency, InvoiceAccount, Postcode, City, Country, State, Sector, Subsector, AccountManager, Reseller, VATNumber, ChamberOfCommerce, ActivitySector, ActivitySubSector, CompanySize, BusinessType
from 
raw.HOST_CIG_Accounts
GO
