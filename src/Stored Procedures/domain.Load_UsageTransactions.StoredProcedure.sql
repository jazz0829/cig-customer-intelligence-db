USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_UsageTransactions]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_UsageTransactions]
GO
/****** Object:  StoredProcedure [domain].[Load_UsageTransactions]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 29-03-2017
-- Description:	Load the raw UsageTransactions data into the domain table
-- =============================================
CREATE PROCEDURE [domain].[Load_UsageTransactions] 
AS
BEGIN

TRUNCATE TABLE CustomerIntelligence.domain.UsageTransactions

INSERT INTO domain.UsageTransactions
SELECT 
ID, 
Division,
Account, 
Item, 
StartDate, 
EndDate, 
Quantity, 
sysmodified, 
syscreated, 
syscreator, 
sysmodifier, 
CIGCopyTime, 
Environment, 
CIGProcessed, 
Amount, 
Invoice, 
UsageEntitlement, 
CostPrice, 
SalesPrice, 
SourceDivision
FROM 
(
	SELECT 
		*,
		ROW_NUMBER() OVER (Partition by ID ORDER BY CIGCopyTime DESC) as RowNumber
	FROM raw.HOST_CIG_UsageTransactions
) A
WHERE A.RowNumber='1'
END
GO
