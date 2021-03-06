USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Eloqua_Accounts_Latest]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Eloqua_Accounts_Latest]
GO
/****** Object:  StoredProcedure [raw].[Load_Eloqua_Accounts_Latest]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-02-21
-- Description:	Load procedure to get the latest record of Accounts information coming form Eloqua
-- =============================================
CREATE PROCEDURE [raw].[Load_Eloqua_Accounts_Latest] 

AS
BEGIN 
TRUNCATE TABLE raw.Eloqua_Accounts_Latest
END 

BEGIN
WITH Eloqua_Accounts_Latest	(
	CompanyName, 
	Country, 
	Address, 
	City, 
	StateOrProvince, 
	ZipOrPostalCode, 
	BusinessPhone, 
	EloquaCompanyID, 
	DateCreated, 
	DateModified, 
	CompanyCategory, 
	SFDCAccountID, 
	LastModifiedByCRMSystem, 
	Address2, 
	Address3, 
	PURLName_DefaultHypersite, 
	Fax, 
	Website, 
	EOLAccountCode, 
	EOLAccountID, 
	AccountantCode, 
	AccountantID, 
	AccountName, 
	BusinessPhoneExtension, 
	ChamberOfCommerce, 
	DUNSNumber, 
	Classification, 
	AccountEmail, 
	AccountStartDate, 
	AccountEndDate, 
	AccountStatus, 
	CompanySize, 
	CompanySizeFrom, 
	CompanySizeTo, 
	AccountManagerEmail, 
	AccountManagerName,
	AccountantName, 
	IsAccountant, 
	IsPilot, 
	IsReseller, 
	BusinessType, 
	NumberOfClients, 
	ResellerName, 
	Sector, 
	Subsector, 
	Annualrevenue, 
	ResellerCode, 
	UTMCampaignSpecifics, 
	UTMCampaignCode, 
	UTMCampaignContent, 
	UTMCampaignMedium, 
	UTMCampaignSource, 
	UTMCampaignTerm, 
	EOLContactID, 
	EmailAddress, 
	LastModifiedByEOLSystem, 
	ContractCategory, 
	ContractsAttached, 
	CIGCampaignID, 
	CIGCampaignIDDate, 
	ConsultancyItem, 
	DataCleansing, 
	CMD_IMSF, 
	CMD_Vertical, 
	CMD_OpportunityCreationDate, 
	RN)
	AS
	(
		SELECT 
			CompanyName, Country, Address, City, StateOrProvince, ZipOrPostalCode, BusinessPhone, EloquaCompanyID, DateCreated, DateModified, CompanyCategory, SFDCAccountID, LastModifiedByCRMSystem, Address2, Address3, PURLName_DefaultHypersite, Fax, Website, EOLAccountCode, EOLAccountID, AccountantCode, AccountantID, AccountName, BusinessPhoneExtension, ChamberOfCommerce, DUNSNumber, Classification, AccountEmail, AccountStartDate, AccountEndDate, AccountStatus, CompanySize, CompanySizeFrom, CompanySizeTo, AccountManagerEmail, AccountManagerName, AccountantName, IsAccountant, IsPilot, IsReseller, BusinessType, NumberOfClients, ResellerName, Sector, Subsector, Annualrevenue, ResellerCode, UTMCampaignSpecifics, UTMCampaignCode, UTMCampaignContent, UTMCampaignMedium, UTMCampaignSource, UTMCampaignTerm, EOLContactID, EmailAddress, LastModifiedByEOLSystem, ContractCategory, ContractsAttached, CIGCampaignID, CIGCampaignIDDate, ConsultancyItem, DataCleansing, CMD_IMSF, CMD_Vertical, CMD_OpportunityCreationDate,
			ROW_NUMBER() OVER (PARTITION BY EOLAccountID ORDER BY DateModified DESC) AS RN
		FROM [raw].[Eloqua_Accounts]
	)

	INSERT INTO raw.Eloqua_Accounts_Latest

	SELECT 
		CompanyName, 
		Country, 
		Address, 
		City, 
		StateOrProvince, 
		ZipOrPostalCode, 
		BusinessPhone, 
		EloquaCompanyID, 
		DateCreated, 
		DateModified, 
		CompanyCategory, 
		SFDCAccountID, 
		LastModifiedByCRMSystem, 
		Address2, 
		Address3, 
		PURLName_DefaultHypersite, 
		Fax, 
		Website, 
		EOLAccountCode, 
		EOLAccountID, 
		AccountantCode, 
		AccountantID, 
		AccountName, 
		BusinessPhoneExtension, 
		ChamberOfCommerce, 
		DUNSNumber, 
		Classification, 
		AccountEmail, 
		AccountStartDate, 
		AccountEndDate, 
		AccountStatus, 
		CompanySize, 
		CompanySizeFrom, 
		CompanySizeTo, 
		AccountManagerEmail, 
		AccountManagerName, 
		AccountantName, 
		IsAccountant, 
		IsPilot, 
		IsReseller, 
		BusinessType, 
		NumberOfClients, 
		ResellerName, 
		Sector, 
		Subsector, 
		Annualrevenue, 
		ResellerCode, 
		UTMCampaignSpecifics, 
		UTMCampaignCode, 
		UTMCampaignContent, 
		UTMCampaignMedium, 
		UTMCampaignSource, 
		UTMCampaignTerm,
		EOLContactID, 
		EmailAddress, 
		LastModifiedByEOLSystem, 
		ContractCategory, 
		ContractsAttached, 
		CIGCampaignID, 
		CIGCampaignIDDate, 
		ConsultancyItem, 
		DataCleansing, 
		CMD_IMSF, 
		CMD_Vertical, 
		CMD_OpportunityCreationDate
	FROM Eloqua_Accounts_Latest
	WHERE RN = 1
END
GO
