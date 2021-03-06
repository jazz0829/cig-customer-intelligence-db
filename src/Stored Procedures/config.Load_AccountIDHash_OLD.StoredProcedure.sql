USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[Load_AccountIDHash_OLD]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[Load_AccountIDHash_OLD]
GO
/****** Object:  StoredProcedure [config].[Load_AccountIDHash_OLD]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 01-07-2016
-- Description:	Load look up table
-- =============================================
CREATE PROCEDURE [config].[Load_AccountIDHash_OLD] 
AS
BEGIN
TRUNCATE TABLE CustomerIntelligence.config.GA_AccountIDHash

DECLARE @saltNL varchar(30) = 'Netherlands'
DECLARE @saltBE varchar(30) = 'Belgium'
DECLARE @saltDE varchar(30) = 'Germany'
DECLARE @saltFR varchar(30) = 'France'
DECLARE @saltUK varchar(30) = 'UnitedKingdom'
DECLARE @saltUS varchar(30) = 'UnitedStates'
DECLARE @saltES varchar(30) = 'Spain'

--NETHERLANDS
INSERT INTO CustomerIntelligence.config.GA_AccountIDHash
(AccountID, HashedCustomer)
SELECT 
	[domain].[Accounts].AccountID
	, SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltNL + LOWER(CAST([domain].[Accounts].AccountID AS varchar(36)))), 1), 3, 64) AS HashedCustomer
From [domain].[Accounts]
WHERE Environment='NL'

--BELGIUM
INSERT INTO CustomerIntelligence.config.GA_AccountIDHash
(AccountID, HashedCustomer)
SELECT 
	[domain].[Accounts].AccountID
	, SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltBE + LOWER(CAST([domain].[Accounts].AccountID AS varchar(36)))), 1), 3, 64) AS HashedCustomer
From [domain].[Accounts]
WHERE Environment='BE'

--GERMANY
INSERT INTO CustomerIntelligence.config.GA_AccountIDHash
(AccountID, HashedCustomer)
SELECT 
	[domain].[Accounts].AccountID
	, SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltDE + LOWER(CAST([domain].[Accounts].AccountID AS varchar(36)))), 1), 3, 64) AS HashedCustomer
From [domain].[Accounts]
WHERE Environment='DE'

--FRANCE
INSERT INTO CustomerIntelligence.config.GA_AccountIDHash
(AccountID, HashedCustomer)
SELECT 
	[domain].[Accounts].AccountID
	, SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltFR + LOWER(CAST([domain].[Accounts].AccountID AS varchar(36)))), 1), 3, 64) AS HashedCustomer
From [domain].[Accounts]
WHERE Environment='FR'

--UNITED KINGDOM
INSERT INTO CustomerIntelligence.config.GA_AccountIDHash
(AccountID, HashedCustomer)
SELECT 
	[domain].[Accounts].AccountID
	, SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltUK + LOWER(CAST([domain].[Accounts].AccountID AS varchar(36)))), 1), 3, 64) AS HashedCustomer
From [domain].[Accounts]
WHERE Environment='UK' OR Environment='GB'
 
--UNITED STATES
INSERT INTO CustomerIntelligence.config.GA_AccountIDHash
(AccountID, HashedCustomer)
SELECT 
	[domain].[Accounts].AccountID
	, SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltUS + LOWER(CAST([domain].[Accounts].AccountID AS varchar(36)))), 1), 3, 64) AS HashedCustomer
From [domain].[Accounts]
WHERE Environment='US'

--SPAIN
INSERT INTO CustomerIntelligence.config.GA_AccountIDHash
(AccountID, HashedCustomer)
SELECT 
	[domain].[Accounts].AccountID
	, SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltES + LOWER(CAST([domain].[Accounts].AccountID AS varchar(36)))), 1), 3, 64) AS HashedCustomer
From [domain].[Accounts]
WHERE Environment='ES'


END
GO
