USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Accounts]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Accounts]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Accounts]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 23/11/2015
-- Description:	Drops the previous Accounts table to refresh the table with updated data. This is needed as the ContractStatistics table is refreshed daily. The
--				historic account information is also updated when ContractStatistics is refreshed, therefore we cannot simply add new rows to the Accounts table.  
-- =====================================================================================================================================================================

CREATE PROCEDURE [domain].[CreateTable_Accounts]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.Accounts', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.Accounts

CREATE TABLE CustomerIntelligence.domain.Accounts
(
	AccountID uniqueidentifier NULL,
	Environment  nchar(3)  NOT NULL,
	AccountCode  nvarchar(18)  NOT NULL,
	Name  nvarchar(50)  NULL,
	
	IsAccountant  nvarchar(60)  NULL,
	AccountantOrLinked  tinyint  NOT NULL,
	EntrepreneurAccountantLinked  nvarchar(60)  NULL,
	AccountantCode  nvarchar(18)  NULL,

	ChamberOfCommerce  nvarchar(20)  NULL,
	VATNumber  nvarchar(35)  NULL,
	
	Postcode  nvarchar(20)  NULL,
	City  nvarchar(100)  NULL,
	State  nvarchar(3)  NULL,
	Country  nchar(3)  NULL,

	SectorCode  nvarchar(10)  NULL,
	SubSectorCode  nvarchar(10)  NULL,
	CompSizeCode  nvarchar(10)  NULL,
	BusTypeCode  nvarchar(10)  NULL,
	
	AccountClassificationCode  nvarchar(3)  NULL,
	AccountManagerCode  int  NULL,
	AccountManagerAccountantCode  int  NULL,
		
	ResellerCode  nvarchar(18)  NULL,
	
	LeadSourceCode  nvarchar(10)  NULL,
	
	Blocked  tinyint  NULL ,

	NumberOfBlankKeyFields	int NULL
)


CREATE CLUSTERED INDEX EnvAccountCode ON [domain].Accounts (Environment, AccountCode);

CREATE NONCLUSTERED INDEX AccountClassificationCode ON [domain].Accounts (AccountClassificationCode)
INCLUDE (Environment, AccountCode, IsAccountant, AccountantOrLinked);

END
GO
