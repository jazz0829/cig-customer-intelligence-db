USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Reseller]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Reseller]
GO
/****** Object:  StoredProcedure [domain].[Load_Reseller]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[Load_Reseller]

AS
BEGIN

TRUNCATE TABLE CustomerIntelligence.domain.Reseller

INSERT INTO CustomerIntelligence.domain.Reseller
(
	Environment,
	ResellerCode,
	ResellerName
)
SELECT
	Distinct(CASE Environment
		WHEN 'GB' 
		THEN 'UK' 
		ELSE Environment 
		END) AS Environment,
	LTRIM(ResellerCode) AS ResellerCode,
	ResellerName
FROM [raw].[DW_ContractStatistics]
WHERE
	META_LOAD_ENDDTS IS NULL		 -- If field is NULL then this means it is an old record
	AND META_ISDELETED = 0			 -- If equal to 1 then this row is one that should be deleted
	AND ResellerCode IS NOT NULL

END
GO
