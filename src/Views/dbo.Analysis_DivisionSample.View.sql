USE [CustomerIntelligence]
GO
/****** Object:  View [dbo].[Analysis_DivisionSample]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [dbo].[Analysis_DivisionSample]
GO
/****** Object:  View [dbo].[Analysis_DivisionSample]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Description: Provides sample of Divisions for Calendar 42 analysis
-- Make about divisions with a blocking status above 100 - some will not have been deleted yet

CREATE VIEW [dbo].[Analysis_DivisionSample]
AS

SELECT 
	AAS.CustomerNumber
	, D.DivisionCode
	, ROW_NUMBER() OVER(ORDER BY D.syscreated) AS DivisionNumber
	, DSS.StartupType
	, DST.StartupTypeDescription
	, D.TemplateCode
	--, D.syscreated AS Created
	--, D.StartDate
	, D.Deleted
	, D.BlockingStatusCode 
FROM [dbo].[Analysis_AccountSample] AAS
INNER JOIN domain.Divisions D
	ON AAS.AccountID = D.AccountID
INNER JOIN domain.DivisionStatistics_Summary DSS
	ON D.DivisionCode = DSS.DivisionCode
	AND D.Environment = DSS.Environment
LEFT JOIN domain.DivisionStartupType DST
	ON DSS.StartupType = DST.StartupType

GO
