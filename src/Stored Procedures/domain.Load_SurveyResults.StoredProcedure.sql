USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_SurveyResults]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_SurveyResults]
GO
/****** Object:  StoredProcedure [domain].[Load_SurveyResults]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-04-24
-- Description:	Load procedure SurveyResults
-- =============================================
CREATE PROCEDURE [domain].[Load_SurveyResults]

AS
BEGIN
TRUNCATE TABLE domain.SurveyResults
INSERT INTO domain.SurveyResults 
	(
	[SurveyResultID], 
	[QuestionCode], 
	[ObjectiveAnswer], 
	[SubjectiveAnswer], 
	[UserID], 
	[AccountID], 
	[DivisionCode], 
	[CreatedDate], 
	[CIGCopyTime], 
	[Environment], 
	[CIGProcessed]
	)
SELECT 
	[ID], 
	[QuestionCode], 
	[ObjectiveAnswer], 
	[SubjectiveAnswer], 
	[UserID], 
	[Customer], 
	[ForDivision], 
	[CreatedDate], 
	[CIGCopyTime], 
	[Environment], 
	[CIGProcessed]
FROM 
		(
		SELECT 
			*,
			ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CIGCopyTime DESC) as RowNumber
		FROM raw.HOST_CIG_SurveyResults
		) SUB
WHERE SUB.RowNumber='1'
			
END
GO
