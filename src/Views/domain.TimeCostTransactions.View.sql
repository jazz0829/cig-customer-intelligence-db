USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[TimeCostTransactions]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[TimeCostTransactions]
GO
/****** Object:  View [domain].[TimeCostTransactions]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================================================================================================
-- Author:		Alex Green 
-- Create date: 27/10/2017
-- Description:	Creates a view of the raw.HOST_CIG_TimeCostTransactions table. 
-- ===============================================================================================================================================

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [domain].[TimeCostTransactions]
AS

WITH TimeCostTransactions
AS
(
	SELECT [ID], [Notes], [Type], [Division], [HourStatus], [Employee], [Account], [Project], [Item], [Quantity], [PriceFC], [AmountFC], [Currency], [Date], [StartTime], [EndTime], [Attachment], [EntryNumber], [ErrorText], [syscreated], [syscreator], [sysmodified], [sysmodifier], [ShopOrder], [RoutingStepPlan], [RoutingStepRealization], [WorkCenter], [Source], [ManufacturingTimeType], [LaborHours], [ProducedQuantity], [SetupComplete], [PercentComplete], [LaborRate], [LaborBurdenRate], [MachineBurdenRate], [GeneralBurdenRate], [AmountDC], [RateFC], [Backflushed], [BackflushTransaction], [ProjectWBS], [PurchaseAmountFC], [PurchaseMarkupPercentage], [PurchaseTransactionLine], [InternalRateDC], [CostAmountDC], [Subscription], [TimedTimeTransaction], [IsOperationFinished], [CorrectedTimeCostTransaction], [CIGCopyTime], [Environment], [CIGProcessed],	
		ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RN -- Orders by the latest record Transaction 
	FROM [raw].[HOST_CIG_TimeCostTransactions]
)

SELECT 
	[ID] AS TimeCostTransactionID
	, [Project] AS ProjectID
	, [Account] AS AccountID
	, [Environment]
	, [Notes]
	, [Type]
	, [HourStatus]
	, [Employee] AS EmployeeID
	, [Item] AS ItemID
	, [Quantity]
	, [PriceFC]
	, [AmountFC]
	, [Currency]
	, [Date]
	, [StartTime]
	, [EndTime]
	, [Attachment]
	, [EntryNumber]
	, [ErrorText]
	, [ShopOrder]
	, [RoutingStepPlan]
	, [RoutingStepRealization]
	, [WorkCenter]
	, [Source]
	, [ManufacturingTimeType]
	, [LaborHours]
	, [ProducedQuantity]
	, [SetupComplete]
	, [PercentComplete]
	, [LaborRate]
	, [LaborBurdenRate]
	, [MachineBurdenRate]
	, [GeneralBurdenRate]
	, [AmountDC]
	, [RateFC]
	, [Backflushed]
	, [BackflushTransaction]
	, [ProjectWBS]
	, [PurchaseAmountFC]
	, [PurchaseMarkupPercentage]
	, [PurchaseTransactionLine]
	, [InternalRateDC]
	, [CostAmountDC]
	, [Subscription]
	, [TimedTimeTransaction]
	, [IsOperationFinished]
	, [CorrectedTimeCostTransaction]
	, [CIGCopyTime]
	, [syscreated]
	, [syscreator]
	, [sysmodified]
	, [sysmodifier]
FROM TimeCostTransactions
WHERE RN = 1
GO
