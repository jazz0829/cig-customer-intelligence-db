USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ActivityMonthly_ProductSummary]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ActivityMonthly_ProductSummary]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ActivityMonthly_ProductSummary]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_ActivityMonthly_ProductSummary]

AS
BEGIN

-- =================================================================================================================================================================================
-- Author:		Alex Green 
-- Create date: 07/04/2015
-- Description:	This creates the ActivityMonthly_ProductSummary facts table to be used for the product summary in Power BI
-- =================================================================================================================================================================================


IF OBJECT_ID (N'CustomerIntelligence.domain.ActivityMonthly_ProductSummary', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.ActivityMonthly_ProductSummary

CREATE TABLE CustomerIntelligence.domain.ActivityMonthly_ProductSummary
(
	Environment								nvarchar (3) ,
	YearMonth								int ,
	Year									int ,
	Month									int ,
	Product									nvarchar (30) ,
	Edition									nvarchar (30) ,
	ContractType							nvarchar (3) ,
	LinkedAccountant						int ,
	Churned									int ,
	ActivityType							nvarchar (60) ,
	ActivityGroup							nvarchar (60) ,
	ActivitySubGroup						nvarchar (60) ,
	ActivityID								int ,
	ActivityDetail							nvarchar(max) ,
	ActivityDescription						nvarchar (max) ,
	TotalDistinctCustomers					int ,
	SumQuantity								int ,
	SumMRR									int
)

CREATE CLUSTERED INDEX EnvYearMonthProductEd ON ActivityMonthly_ProductSummary (Environment, YearMonth, Product, Edition, ContractType, LinkedAccountant, Churned, ActivityID)
END
GO
