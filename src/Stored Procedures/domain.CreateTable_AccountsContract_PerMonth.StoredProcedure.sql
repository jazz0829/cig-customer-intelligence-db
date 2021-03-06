USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AccountsContract_PerMonth]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_AccountsContract_PerMonth]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AccountsContract_PerMonth]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =================================================================================================================================================================================
-- Author:		Alex Green (based on original script by Ronald Dahne)
-- Create date: 30/11/2015
-- Description:	This creates the AccountsContract_PerMonth table that is populated using the Loop_AccountsContract_PerMonth and Load_AccountsContract_PerMonth procedures


-- =================================================================================NOTE===========================================================================================
-- Included two new columns: NumberOfPayingUsers and NumberOfFreeUsers. These are used to separate out users who customers are paying for, and are not paying for.

-- Alex Green - 31/03/2016


-- Included new Churned column

-- Alex Green 07/04/2016
-- =================================================================================================================================================================================



CREATE PROCEDURE [domain].[CreateTable_AccountsContract_PerMonth]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.AccountsContract_PerMonth', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.AccountsContract_PerMonth

CREATE TABLE CustomerIntelligence.domain.AccountsContract_PerMonth
(
	AccountID								uniqueidentifier,
	Environment								nvarchar (3) NOT NULL,
	AccountCode								nvarchar (18) NOT NULL,
	Year									int ,
	Month									int ,
	YearMonth								int,
	PackageCode								nvarchar (30) ,
	ContractType							nvarchar (3) ,
	ContractNumber							nvarchar (30) ,
	NumberOfAvailableAdmins					int ,
	NumberOfArchivedAdmins					int ,
	NumberOfUsers							int ,
	NumberOfPayingUsers						int ,
	NumberOfFreeUsers						int ,
	MRR										float ,
	CommercialLifetimeMonths				int ,
	Churned									int
)

CREATE CLUSTERED INDEX EnvAccountYearMonth ON domain.AccountsContract_PerMonth (Environment, AccountCode, Year, Month);

CREATE NONCLUSTERED INDEX YearMonth ON domain.AccountsContract_PerMonth (YearMonth)
INCLUDE (Environment, [AccountCode],[Year],[Month],[PackageCode], ContractType, CommercialLifetimeMonths);
END
GO
