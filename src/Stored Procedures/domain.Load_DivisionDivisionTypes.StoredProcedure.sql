USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_DivisionDivisionTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_DivisionDivisionTypes]
GO
/****** Object:  StoredProcedure [domain].[Load_DivisionDivisionTypes]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_DivisionDivisionTypes]
AS
BEGIN
TRUNCATE TABLE domain.DivisionDivisionTypes

INSERT INTO domain.DivisionDivisionTypes(
	 [ID]
      ,[DivisionCode]
      ,[DivisionType]
      ,[StartDate]
      ,[EndDate]
      ,[InvoiceAccount]
      ,[InvoicedUntil]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[CIGCopyTime]
      ,[Environment]
      ,[CIGProcessed])
SELECT
	 [ID]
      ,[DivisionCode]
      ,[DivisionType]
      ,[StartDate]
      ,[EndDate]
      ,[InvoiceAccount]
      ,[InvoicedUntil]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[CIGCopyTime]
      ,[Environment]
      ,[CIGProcessed]
	  FROM
			(SELECT 
				 [ID]
				  ,[DivisionCode]
				  ,[DivisionType]
				  ,[StartDate]
				  ,[EndDate]
				  ,[InvoiceAccount]
				  ,[InvoicedUntil]
				  ,[syscreated]
				  ,[syscreator]
				  ,[sysmodified]
				  ,[sysmodifier]
				  ,[CIGCopyTime]
				  ,[Environment]
				  ,[CIGProcessed]
				   , ROW_NUMBER() OVER(PARTITION BY [Environment], DivisionCode, DivisionType ORDER BY CIGCopyTime DESC, syscreated DESC) AS RowNumber
			FROM raw.HOST_CIG_DivisionDivisionTypes) SUB
		WHERE SUB.RowNumber='1'
END
GO
