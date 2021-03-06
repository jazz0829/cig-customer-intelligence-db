USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ContractMutations]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ContractMutations]
GO
/****** Object:  StoredProcedure [domain].[Load_ContractMutations]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_ContractMutations] 
AS
BEGIN

TRUNCATE TABLE domain.ContractMutations

INSERT INTO domain.ContractMutations
SELECT 
	sysmodified, 
	ID, 
	HID, 
	syscreated, 
	syscreator, 
	Division, 
	EventDate, 
	Event, 
	Account, 
	Contract, 
	ContractLine, 
	Item, 
	Quantity, 
	ContractLineValue, 
	sysmodifier, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed
FROM
	( 
	SELECT 
			sysmodified, 
			ID, 
			HID, 
			syscreated, 
			syscreator, 
			Division, 
			EventDate, 
			Event, 
			Account, 
			Contract, 
			ContractLine, 
			Item, 
			Quantity, 
			ContractLineValue, 
			sysmodifier, 
			CIGCopyTime, 
			Environment, 
			CIGProcessed,
			ROW_NUMBER() OVER (PARTITION BY /*Account, Event, Contract,*/ ContractLine, Item, Quantity,ContractLineValue  ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_ContractMutations
	) SUB
--WHERE SUB.RowNumber='1'
order by EventDate, Account
END
GO
