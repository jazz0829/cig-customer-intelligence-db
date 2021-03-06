USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Eloqua_ContractLicences_Latest]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Eloqua_ContractLicences_Latest]
GO
/****** Object:  StoredProcedure [raw].[Load_Eloqua_ContractLicences_Latest]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-02-21
-- Description:	Load proceudre the get the latest record 
-- =============================================
CREATE PROCEDURE [raw].[Load_Eloqua_ContractLicences_Latest]
AS
BEGIN
TRUNCATE TABLE raw.Eloqua_ContractLicences_Latest
END
BEGIN
WITH Eloqua_ContractLicences_Latest
	(
	EOLContractID, 
	EOLAccountID, 
	EOLContactID, 
	EmailAddress, 
	ContractType, 
	ContractStartDate, 
	ContractFinalDate, 
	ContractStatus, 
	ContractCancellationDate, 
	ContractCancellationReason, 
	Package, 
	ModulesAll, 
	ModulesCommercial,
	ModulesTrial, 
	ModulesPilot, 
	ModulesInactive, 
	ContractValue, 
	AccountName, 
	Currency, 
	EOLAccountCode, 
	TotalContractValue, 
	CreationEvent, 
	ItemPayroll, 
	DatePayrollUsage, 
	ItemScaning, 
	DateScaningUsage, 
	DataCleansing, 
	ExternalId, 
	CreatedAt, 
	UpdatedAt, 
	RN
	)
	AS
	(
		SELECT EOLContractID, EOLAccountID, EOLContactID, EmailAddress, ContractType, ContractStartDate, ContractFinalDate, ContractStatus, ContractCancellationDate, ContractCancellationReason, Package, ModulesAll, ModulesCommercial, ModulesTrial, ModulesPilot, ModulesInactive, ContractValue, AccountName, Currency, EOLAccountCode, TotalContractValue, CreationEvent, ItemPayroll, DatePayrollUsage, ItemScaning, DateScaningUsage, DataCleansing, ExternalId, CreatedAt, UpdatedAt,
			ROW_NUMBER() OVER (PARTITION BY EmailAddress ORDER BY UpdatedAt DESC) AS RN
		FROM [raw].Eloqua_ContractLicences
	)

	INSERT INTO raw.Eloqua_ContractLicences_Latest
	SELECT 
		EOLContractID, 
		EOLAccountID, 
		EOLContactID, 
		EmailAddress, 
		ContractType, 
		ContractStartDate, 
		ContractFinalDate, 
		ContractStatus, 
		ContractCancellationDate,
		ContractCancellationReason, 
		Package, 
		ModulesAll, 
		ModulesCommercial, 
		ModulesTrial, 
		ModulesPilot, 
		ModulesInactive, 
		ContractValue, 
		AccountName, 
		Currency, 
		EOLAccountCode, 
		TotalContractValue, 
		CreationEvent, 
		ItemPayroll, 
		DatePayrollUsage, 
		ItemScaning, 
		DateScaningUsage, 
		DataCleansing, 
		ExternalId, 
		CreatedAt, 
		UpdatedAt
	FROM Eloqua_ContractLicences_Latest
	WHERE RN = 1
END
GO
