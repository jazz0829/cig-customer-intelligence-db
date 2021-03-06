USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_SubSectors]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_SubSectors]
GO
/****** Object:  StoredProcedure [domain].[Load_SubSectors]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[Load_SubSectors]

AS
BEGIN

-- ==============================================================
-- Author:		Alex Green
-- Create date: 1-12-2015
-- Description:	Loads the SubSectors Accounts support table

-- UPDATED: 16/10/2017
-- Changed to use Corporate BI DW version of ContractStatistics
-- ==============================================================

TRUNCATE TABLE CustomerIntelligence.domain.SubSectors

INSERT INTO CustomerIntelligence.domain.SubSectors
(
	Environment,
	SubSectorCode,
	SubSectorDescription
)
SELECT
	Distinct(CASE Environment
		WHEN 'GB' 
		THEN 'UK' 
		ELSE Environment 
		END) AS Environment,
	SubSectorCode,
	SubSectorDescription
FROM [raw].[DW_ContractStatistics]
WHERE
	META_LOAD_ENDDTS IS NULL		 -- If field is NULL then this means it is an old record
	AND META_ISDELETED = 0			 -- If equal to 1 then this row is one that should be deleted
	AND SubSectorCode IS NOT NULL

END

GO
