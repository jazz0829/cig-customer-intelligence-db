USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_CompanySize]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_CompanySize]
GO
/****** Object:  StoredProcedure [domain].[Load_CompanySize]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_CompanySize]
AS
BEGIN
TRUNCATE TABLE domain.CompanySize

INSERT INTO domain.CompanySize
SELECT 
	ID, 
	Code, 
	syscreated, 
	sysmodified, 
	sysmodifier, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed, 
	syscreator, 
	Description, 
	DescriptionTermID, 
	EmployeeCountFrom, 
	EmployeeCountTo
FROM
	( 
	SELECT 
		ID, 
		Code, 
		syscreated, 
		sysmodified, 
		sysmodifier, 
		CIGCopyTime, 
		Environment, 
		CIGProcessed, 
		syscreator, 
		Description, 
		DescriptionTermID, 
		EmployeeCountFrom, 
		EmployeeCountTo,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_CompanySizes
	) SUB
WHERE SUB.RowNumber='1'
END
GO
