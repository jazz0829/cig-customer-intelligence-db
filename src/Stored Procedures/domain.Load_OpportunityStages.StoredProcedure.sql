USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_OpportunityStages]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_OpportunityStages]
GO
/****** Object:  StoredProcedure [domain].[Load_OpportunityStages]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[Load_OpportunityStages] 
AS
BEGIN

TRUNCATE TABLE domain.OpportunityStages

INSERT INTO domain.OpportunityStages
SELECT
[ID], [Division], [Code], [Description], [DescriptionTermID], [SortOrder], [Probability], [OpportunityStatus], [ForecastType], [Active], [Notes], [syscreated], [syscreator], [sysmodified], [sysmodifier], [Color], [CIGCopyTime], [Environment], [CIGProcessed]
FROM 
	(
		SELECT *,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
		FROM raw.HOST_CIG_OpportunityStages
	) SUB
WHERE SUB.RowNumber='1'
END
GO
