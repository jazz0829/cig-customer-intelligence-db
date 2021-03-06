USE [CustomerIntelligence]
GO
/****** Object:  View [raw].[Eloqua_ContactLicences_Latest]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [raw].[Eloqua_ContactLicences_Latest]
GO
/****** Object:  View [raw].[Eloqua_ContactLicences_Latest]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [raw].[Eloqua_ContactLicences_Latest]
AS
	WITH Eloqua_ContactLicences_Latest
	(EOLContractID, EOLAccountID, EOLContactID, EmailAddress, ContractType, ContractStartDate, ContractFinalDate, ContractStatus, ContractCancellationDate, ContractCancellationReason, Package, ModulesAll, ModulesCommercial, ModulesTrial, ModulesPilot, ModulesInactive, ContractValue, AccountName, Currency, EOLAccountCode, TotalContractValue, CreationEvent, ItemPayroll, DatePayrollUsage, ItemScaning, DateScaningUsage, DataCleansing, ExternalId, CreatedAt, UpdatedAt, RN)
	AS
	(
		SELECT EOLContractID, EOLAccountID, EOLContactID, EmailAddress, ContractType, ContractStartDate, ContractFinalDate, ContractStatus, ContractCancellationDate, ContractCancellationReason, Package, ModulesAll, ModulesCommercial, ModulesTrial, ModulesPilot, ModulesInactive, ContractValue, AccountName, Currency, EOLAccountCode, TotalContractValue, CreationEvent, ItemPayroll, DatePayrollUsage, ItemScaning, DateScaningUsage, DataCleansing, ExternalId, CreatedAt, UpdatedAt,
			ROW_NUMBER() OVER (PARTITION BY EmailAddress ORDER BY UpdatedAt DESC) AS RN
		FROM [raw].Eloqua_ContractLicences
	)

	SELECT EOLContractID, EOLAccountID, EOLContactID, EmailAddress, ContractType, ContractStartDate, ContractFinalDate, ContractStatus, ContractCancellationDate, ContractCancellationReason, Package, ModulesAll, ModulesCommercial, ModulesTrial, ModulesPilot, ModulesInactive, ContractValue, AccountName, Currency, EOLAccountCode, TotalContractValue, CreationEvent, ItemPayroll, DatePayrollUsage, ItemScaning, DateScaningUsage, DataCleansing, ExternalId, CreatedAt, UpdatedAt
	FROM Eloqua_ContactLicences_Latest
	WHERE RN = 1
GO
