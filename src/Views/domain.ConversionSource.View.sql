USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[ConversionSource]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[ConversionSource]
GO
/****** Object:  View [domain].[ConversionSource]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [domain].[ConversionSource]
AS

SELECT
	CS.Environment
	, CS.Division AS DivisionCode
	, CS.IDKey
	, CSM.ConversionStatusCode
	, CSM.ConversionStatusDescription
	, CS.UserID
	, CS.Document AS DocumentID
	, CS.ConversionSource
	, GLTS.DescriptionSuffix AS ConversionSourceDescription 
	, CS.DirPath
	, CS.syscreated
    , CS.sysmodified
FROM 
	(
		SELECT 
			*
			, ROW_NUMBER() OVER(PARTITION BY Environment, Division ORDER BY CIGCopyTime DESC) AS RN		-- Used to select latest CIGCopyTime record for each division within each environment
		FROM [raw].[HOST_CIG_ConversionStatus] 
	) CS
INNER JOIN 
	(
		SELECT
			ID
			, [Description]
			, DescriptionSuffix
			, ROW_NUMBER() OVER(PARTITION BY Environment, ID ORDER BY CIGCopyTime DESC) AS RN		-- Used to select only the latest GLTransactionSources records 
		FROM [raw].[HOST_CIG_GLTransactionSources]
		WHERE Environment = 'NL'	-- Only uses codes from NL environment
	) GLTS
	ON CS.ConversionSource = GLTS.ID
	AND GLTS.RN = 1	 -- Selects only the latest GLTransactionSources record
			
INNER JOIN domain.ConversionStatus_Mapping CSM
	ON CSM.ConversionStatusCode = CS.[Status]

WHERE CS.RN = 1		-- Selects only the latest ConversionStatus record
GO
