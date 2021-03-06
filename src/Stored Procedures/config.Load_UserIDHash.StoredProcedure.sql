USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[Load_UserIDHash]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[Load_UserIDHash]
GO
/****** Object:  StoredProcedure [config].[Load_UserIDHash]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 01-07-2016
-- Description:	Load look up table
-- =============================================
CREATE PROCEDURE [config].[Load_UserIDHash] 

AS
BEGIN
TRUNCATE TABLE [CustomerIntelligence].[config].[GA_UserIDHash]

DECLARE @saltNL varchar(30) = 'Netherlands'
DECLARE @saltBE varchar(30) = 'Belgium'
DECLARE @saltDE varchar(30) = 'Germany'
DECLARE @saltFR varchar(30) = 'France'
DECLARE @saltUK varchar(30) = 'UnitedKingdom'
DECLARE @saltUS varchar(30) = 'UnitedStates'
DECLARE @saltES varchar(30) = 'Spain'

--Netherlands
INSERT INTO [CustomerIntelligence].[config].[GA_UserIDHash]
SELECT UserID
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltNL + LOWER(CAST(UserID AS varchar(36)))), 1), 3, 64) AS HashedUser
FROM domain.Users US
WHERE LTRIM(RTRIM(US.Environment))='NL'

--Belgium
INSERT INTO [CustomerIntelligence].[config].[GA_UserIDHash]
SELECT UserID
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltBE + LOWER(CAST(UserID AS varchar(36)))), 1), 3, 64) AS HashedUser
FROM domain.Users US
WHERE LTRIM(RTRIM(US.Environment))='BE'

--Germany
INSERT INTO [CustomerIntelligence].[config].[GA_UserIDHash]
SELECT UserID
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltDE + LOWER(CAST(UserID AS varchar(36)))), 1), 3, 64) AS HashedUser
FROM domain.Users US
WHERE LTRIM(RTRIM(US.Environment))='DE'

--France
INSERT INTO [CustomerIntelligence].[config].[GA_UserIDHash]
SELECT UserID
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltFR + LOWER(CAST(UserID AS varchar(36)))), 1), 3, 64) AS HashedUser
FROM domain.Users US
WHERE LTRIM(RTRIM(US.Environment))='FR'

--UnitedKingdom
INSERT INTO [CustomerIntelligence].[config].[GA_UserIDHash]
SELECT UserID
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltUK + LOWER(CAST(UserID AS varchar(36)))), 1), 3, 64) AS HashedUser
FROM domain.Users US
WHERE LTRIM(RTRIM(US.Environment))='UK'

--UnitedStates
INSERT INTO [CustomerIntelligence].[config].[GA_UserIDHash]
SELECT UserID
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltUS + LOWER(CAST(UserID AS varchar(36)))), 1), 3, 64) AS HashedUser
FROM domain.Users US
WHERE LTRIM(RTRIM(US.Environment))='US'

--Spain
INSERT INTO [CustomerIntelligence].[config].[GA_UserIDHash]
SELECT UserID
     , SUBSTRING(CONVERT(varchar(66), HASHBYTES('SHA2_256', @saltES + LOWER(CAST(UserID AS varchar(36)))), 1), 3, 64) AS HashedUser
FROM domain.Users US
WHERE LTRIM(RTRIM(US.Environment))='ES'

END
GO
