USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ChurnAround]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ChurnAround]
GO
/****** Object:  StoredProcedure [domain].[Load_ChurnAround]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================================================================
-- Author:		Jennifer Vink
-- Create date: 26-11-2015
-- Description:	Load the data into the ChurnAround table out of [ContractData].[domain].[ExportEOLRequests]
-- =========================================================================================================
CREATE PROC [domain].[Load_ChurnAround] AS

BEGIN
TRUNCATE TABLE CustomerIntelligence.domain.ChurnAround

INSERT INTO [CustomerIntelligence].domain.ChurnAround 
(Environment, RequestID, AccountCode, Description, Reasons1, Reasons2, Reasons3, Created)

SELECT Environment, RequestID, AccountCode, Description, Reasons1, Reasons2, Reasons3, Created
FROM(
SELECT 
		CASE R.Environment
			WHEN 'GB' 
			THEN 'UK' 
			ELSE R.Environment END AS Environment
		,HID as RequestID
		,AccountCode
		,Description
		,CASE WHEN ISNUMERIC(SUBSTRING(LTRIM(FreeTextField_13), 1, 1)) = 1 THEN LEFT(FreeTextField_13,2) ELSE FreeTextField_13 END AS Reasons1
		,FreeTextField_14 AS Reasons2
		,FreeTextField_15 AS Reasons3
	 	,syscreated As Created
		,ROW_NUMBER() OVER (Partition BY ID ORDER BY CIGCopyTime desc) AS RowNumber
FROM raw.HOST_CIG_Requests R
JOIN domain.Accounts A
ON R.Account=A.AccountID
WHERE FreeTextField_13 IS NOT NULL AND FreeTextField_13 NOT LIKE '%Opzeggen Elektronisch Bankieren%' AND HID NOT LIKE '8406' AND syscreated >'01-06-2015 00:00' ) SUB
WHERE RowNumber='1'
END
GO
