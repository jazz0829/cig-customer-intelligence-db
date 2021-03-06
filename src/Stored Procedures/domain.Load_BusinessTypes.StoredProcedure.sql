USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_BusinessTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_BusinessTypes]
GO
/****** Object:  StoredProcedure [domain].[Load_BusinessTypes]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_BusinessTypes]
AS
BEGIN
TRUNCATE TABLE domain.BusinessTypes

INSERT INTO domain.BusinessTypes
SELECT 
	ID, 
	Code, 
	Description, 
	sysmodified, 
	syscreated, 
	syscreator, 
	sysmodifier, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed, 
	DescriptionTermID, 
	Country, 
	ShortDescription, 
	ShortDescriptionTermID
FROM
	( 
	SELECT 
		ID, 
		Code, 
		Description, 
		sysmodified, 
		syscreated, 
		syscreator, 
		sysmodifier, 
		CIGCopyTime, 
		Environment, 
		CIGProcessed, 
		DescriptionTermID, 
		Country, 
		ShortDescription, 
		ShortDescriptionTermID,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_BusinessTypes
	WHERE Environment='NL'
	) SUB
WHERE SUB.RowNumber='1'
END
GO
