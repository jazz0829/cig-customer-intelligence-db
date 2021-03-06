USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Consultancy]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Consultancy]
GO
/****** Object:  StoredProcedure [domain].[Load_Consultancy]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================================================
-- Author:		Jennifer
-- Create date: 08-02-2016
-- Description:	Load the Consultancy requests from [ContractData].[dbo].[ExportEOLRequests]
-- ===============================================================================================
CREATE PROCEDURE [domain].[Load_Consultancy] 

AS
BEGIN
TRUNCATE TABLE CustomerIntelligence.domain.Consultancy

INSERT INTO domain.Consultancy
			(
			ID,
			Environment, 
			TypeHID,
			TypeDescription,
			Created,
			AccountCode,
			Approved,
			Realised,
			Status,
			ItemCode_1,
			FreeTextField_01,
			Description
			)

SELECT 
			ID,
			Environment, 
			HID,
			TypeDescription,
			syscreated,
			AccountCode,
			Approved,
			Realised,
			Status,
			ItemCode,
			FreeTextField_01,
			Description
FROM (
		SELECT 
					ID,
					CASE R.Environment
						WHEN 'GB' 
						THEN 'UK' 
						ELSE R.Environment END AS Environment, 
					HID,
					TypeDescription,
					R.syscreated,
					Ltrim(AccountCode) as AccountCode,
					Approved,
					Realized As Realised,
					Status,
					ItemCode,
					R.FreeTextField_01,
					Description,
					ROW_NUMBER() OVER (Partition BY ID ORDER BY R.CIGCopyTime desc) As RowNumber

		FROM raw.Host_CIG_Requests R
		JOIN domain.Accounts A
		ON R.Account=A.AccountID
		LEFT JOIN domain.Items I
		ON R.Item_1=I.ItemID
		Where HID='8406') SUB
WHERE RowNumber='1'
END

-- ========================================================================================================================================
--Rebuild the indexes

ALTER INDEX ALL ON domain.Consultancy REBUILD
GO
