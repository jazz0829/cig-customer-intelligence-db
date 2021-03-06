USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Contracts]    Script Date: 24-Sep-18 14:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ====================================================================================================================
-- Author:		Alex Green (based on script from Ronald Dahne)
-- Create date: 26-11-2015
-- Description:	Loads the Contracts table containing each change to a contract

--				16 October 2017 - EventID field removed as not available in Corporate BI version of ContractStatistics
-- ====================================================================================================================

ALTER PROC [domain].[Load_Contracts] AS

TRUNCATE TABLE domain.Contracts

INSERT INTO domain.Contracts
(
	Environment,
	AccountCode ,
	ContractNumber,
	ContractType,
	StartDate,
	EndDate,
	FinalDate,
	EventDate,
	InflowOutflow,
	ContractEventTypeCode,
	ItemCode,
	PackageCode,
	LinePackage,
	Quantity,
	NumberOfAdministrations,
	NumberOfUsers,
	ContractLineValue,
	ValuePerMonth,
	ValuePerYear,
	ContractLineValueDC,
	ValuePerMonthDC,
	ValuePerYearDC,
	ExchangeRate,
	ItemBasePricePerMonth,
	ItemBasePricePeryear,
	Name,
	EventYearMonth,
	EventYear,
	EventMonth,
	EventType,
	EventDescription,
	Item,
	ItemDescription,
	ItemType,
	CancellationDate
)

SELECT
	CASE Environment
		WHEN 'GB' THEN 'UK' ELSE Environment END AS Environment,
	LTRIM(Code) AS AccountCode ,
	ContractNumber,
	ContractType,
	StartDate,
	EndDate,
	FinalDate,
	EventDate,
	InflowOutflow,
	EventType AS ContractEventTypeCode,
	ItemCode,
	PackageCode,
	LinePackage,
	Quantity,
	NumberOfAdministrations,
	NumberOfUsers,
	ContractLineValue,
	ValuePerMonth,
	ValuePerYear,
	ContractLineValueDC,
	ValuePerMonthDC,
	ValuePerYearDC,
	ExchangeRate,
	ItemBasePricePerMonth,
	ItemBasePricePeryear,
	Name,
	EventYearMonth,
	EventYear,
	EventMonth,
	EventType,
	EventDescription,
	Item,
	ItemDescription,
	ItemType,
	CASE WHEN CANCELLATIONDATE = '9999-12-31' THEN NULL else CANCELLATIONDATE END as CANCELLATIONDATE

FROM [raw].[DW_ContractStatistics]
WHERE
	META_LOAD_ENDDTS IS NULL		 -- If field is NULL then this means it is an old record
	AND META_ISDELETED = 0			 -- If equal to 1 then this row is one that should be deleted

-- ========================================================================================================================================
--Rebuild the indexes

ALTER INDEX ALL ON [domain].Contracts REBUILD
