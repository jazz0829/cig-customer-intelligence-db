USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Accounts]    Script Date: 18-Dec-18 14:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 23/11/2015
-- Description:	Removes the data previously stored in the Accounts table and refreshes it with updated data. This is needed as the ContractStatistics table is refreshed daily. The
--				historic account information is also updated when ContractStatistics is refreshed, therefore we cannot simply add new rows to the Accounts table.

-- UPDATE 16/10/2017
-- Update made to point to Corporate BI Data Warehouse dataset

-- UPDATE 31/10/2017
-- Added the links to the CustomerProfile and the EOLCard. Also Changed the update function for the AccountID to a left join with raw.Accounts

-- UPDATE 01/02/2018
-- Combined the conflicting versions of Load_Accounts to point back to CustomerProfile in the CS Customer Success Insights App

-- UPDATE 09-03-2018
-- Join the raw Accounts data, to include more columns

-- UPDATE 07-05-2018
-- 3 COLUMNS ADDED FOR GDPR
-- ====================================================================================================================================================================================

ALTER PROCEDURE [domain].[Load_Accounts]

AS
BEGIN

TRUNCATE TABLE domain.Accounts

INSERT INTO domain.Accounts
(
	Environment ,
	AccountCode ,	
	AccountID,
	Name ,
	IsAccountant ,
	AccountantOrLinked ,
	EntrepreneurAccountantLinked ,
	AccountantCode ,
	ChamberOfCommerce ,
	VATNumber ,
	Postcode ,
	City ,
	State ,
	Country ,
	SectorCode ,
	SubSectorCode ,
	CompSizeCode ,
	BusTypeCode ,
	AccountClassificationCode ,
	AccountManagerCode ,
	AccountManagerAccountantCode ,
	ResellerCode ,
	LeadSourceCode ,
	Blocked ,
	NumberOfBlankKeyFields,
	CustomerProfileURL,
	EOLCardURL,
	DunsNumber,
	syscreated,
	sysmodified,
	SBICode,
	DatabaseID,
	MainContact,
	MainDivision,
	IsAnonymized,
	LeadPurpose,
	AnonymisationSource,
	Invoicedebtor
)


-- SELECTS DISTINCT ACCOUNTS
SELECT
	Distinct(CASE CS.Environment
		WHEN 'GB'
		THEN 'UK'
		ELSE CS.Environment END) AS Environment ,
	LTRIM(CS.Code) AS AccountCode ,
	Account AS AccountID,
	CS.Name ,
	CS.IsAccountant ,
	AccountantOrLinked ,
	EntrepreneurAccountantLinked ,
	LTRIM(AccountantCode) AS AccountantCode,
	CS.ChamberOfCommerce ,
	CS.VATNumber ,
	CS.Postcode ,
	CS.City ,
	CS.State ,
	CS.Country ,
	SectorCode ,
	SubSectorCode ,
	CompSizeCode ,
	BusTypeCode ,
	AccountClassificationCode ,
	AccountManagerCode ,
	AccountManagerAccountantCode ,
	LTRIM(ResellerCode) ,
	LeadSourceCode ,
	CS.Blocked ,
	CAST(
		(CASE WHEN CS.ChamberOfCommerce IS NULL THEN 1 ELSE 0 END)
		+ (CASE WHEN CS.VATNumber IS NULL THEN 1 ELSE 0 END)
		+ (CASE WHEN CS.PostCode IS NULL THEN 1 ELSE 0 END)
		+ (CASE WHEN SectorCode IS NULL THEN 1 ELSE 0 END)
		+ (CASE WHEN CompSizeCode IS NULL THEN 1 ELSE 0 END)
		+ (CASE WHEN BusTypeCode IS NULL THEN 1 ELSE 0 END)
	AS INT) AS "NumberOfBlankKeyFields"							-- This creates a column that indicates the number of six key fields about the account that have not been completed.
	, CONCAT('https://app.powerbi.com/groups/me/apps/ef46f53e-fb11-443c-8c44-c648fa633c42/reports/3ac72a9a-8c9b-4b9c-93dd-1d70ebd9946c/ReportSection1?filter=Accounts%252FAccountID%20eq%20%27',
		CONCAT((CS.Account),'%27')) As CustomerProfileURL
	, CONCAT
		(
			CASE 
				WHEN CS.Environment = 'NL' THEN 'https://start.exactonline.nl/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN CS.Environment = 'BE' THEN 'https://start.exactonline.be/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN CS.Environment = 'FR' THEN 'https://start.exactonline.fr/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN CS.Environment = 'UK' THEN 'https://start.exactonline.co.uk/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN CS.Environment = 'GB' THEN 'https://start.exactonline.co.uk/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN CS.Environment = 'US' THEN 'https://start.exactonline.com/docs/LicCustomerCard.aspx?Action=0&AccountID=%7b'
				WHEN CS.Environment = 'ES' THEN 'https://start.exactonline.es/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN CS.Environment = 'DE' THEN 'https://start.exactonline.de/docs/LicCustomerCard.aspx?AccountID=%7b'
				ELSE NULL END
		, LOWER(Account)
		, CASE 
			WHEN CS.Environment = 'NL' THEN '%7d&_Division_=1'
			WHEN CS.Environment = 'US' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			WHEN CS.Environment = 'DE' THEN '%7d&_Division_=1'
			WHEN CS.Environment = 'UK' THEN '%7d&_Division_=1'
			WHEN CS.Environment = 'GB' THEN '%7d&_Division_=1'
			WHEN CS.Environment = 'FR' THEN '%7d&_Division_=1'
			WHEN CS.Environment = 'BE' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			ELSE '%7d'
			END) AS EOLCardURL
-- raw.Accounts data
	, A.DunsNumber
	, A.syscreated
	, A.sysmodified
	, A.SBICode
	, A.DatabaseID
	, A.MainContact
	, A.MainDivision
	, CAST(A.IsAnonymized AS INT)
	, A.LeadPurpose
	, A.AnonymisationSource
	, InvoiceAccount
FROM 
	(
		SELECT *, ROW_NUMBER() OVER(PARTITION BY Environment, Code ORDER BY LASTMODIFIED DESC) AS RN
		FROM [raw].[DW_ContractStatistics]
		WHERE
			META_LOAD_ENDDTS IS NULL		 -- If field is NULL then this means it is an old record
			AND META_ISDELETED = 0			 -- If equal to 1 then this row is one that should be deleted
			AND LTRIM(RTRIM(Code))<>'162697700000000000'
	) CS
LEFT JOIN raw.Accounts A
ON CS.ACCOUNT=A.ID

WHERE
	META_LOAD_ENDDTS IS NULL		 -- If field is NULL then this means it is an old record
	AND META_ISDELETED = 0			 -- If equal to 1 then this row is one that should be deleted
	AND	RN = 1    -- RN takes the lastest ContractStatistics account recird ub the CS subquery
	AND LTRIM(RTRIM(A.Code))<>'162697700000000000'


-- ========================================================================================================================================
--Rebuild the indexes

ALTER INDEX ALL ON [domain].Accounts REBUILD

END

