USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Opportunities_Hosting]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Opportunities_Hosting]
GO
/****** Object:  StoredProcedure [domain].[Load_Opportunities_Hosting]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-08-07
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[Load_Opportunities_Hosting] 
AS
BEGIN

TRUNCATE TABLE domain.Opportunities_Hosting

INSERT INTO domain.Opportunities_Hosting
SELECT
	ID, 
	Division, 
	Number, 
	Name, 
	Account, 
	Owner, 
	OwnerRead, 
	CloseDate, 
	OpportunityStage, 
	Probability, 
	Currency, 
	AmountFC, 
	AmountDC, 
	RateFC, 
	LeadSource, 
	SalesType, 
	ReasonCode, 
	Notes, 
	NextAction, 
	ActionDate, 
	ExchangeRateType,
	syscreated, 
	syscreator, 
	sysmodified, 
	sysmodifier, 
	Project, 
	Competitor, 
	Campaign, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed,
	OpportunityType,
	OpportunityDepartment,
	Extension
FROM 
	(
		SELECT *,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
		FROM raw.HOST_CIG_Opportunities
	) SUB
WHERE SUB.RowNumber='1'
END
GO
