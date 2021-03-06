USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Items]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Items]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Items]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 31-03-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Items] 
AS
BEGIN
IF OBJECT_ID (N'CustomerIntelligence.domain.Items', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.Items

Create Table CustomerIntelligence.domain.Items
(
	ItemID uniqueidentifier NOT NULL
	, Environment nchar(3) NULL
	, ItemCode nvarchar(30) NOT NULL
	, ItemDescription nvarchar(60) NOT NULL
	, ItemType nvarchar(30) NULL                             --In the raw data it's the Class_02
	, Division int NOT NULL
	, CostPriceStandard float NOT NULL
	, SecurityLevel int NOT NULL
	, IsSalesItem bit NOT NULL
	, IsStockItem bit NOT NULL
	, IsSerialNumberItem bit NOT NULL
	, IsSubAssemblyItem bit NOT NULL
	, IsFractionAllowedItem bit NOT NULL
	, IsAssetItem bit NOT NULL
	, IsTime tinyint NOT NULL
	, IsNewContract tinyint NOT NULL
	, IsOnDemandItem tinyint NOT NULL
	, IsPurchaseItem bit NOT NULL
	, IsSubcontractedItem bit NOT NULL
	, IsMakeItem tinyint NOT NULL
	, IsWebshopItem tinyint NOT NULL
	, CopyRemarks tinyint NOT NULL
	, IsPackageItem bit NOT NULL
	, BatchQuantity float NOT NULL
	, UseExplosion tinyint NOT NULL
	, HasBillOfMaterial tinyint NOT NULL
	, RoundEach tinyint NOT NULL
	, RoundPlannedQuantityFactor tinyint NOT NULL
	, syscreated datetime NOT NULL
	, sysmodified datetime NOT NULL
	, IsRegistrationCodeItem tinyint NOT NULL
	, IsBatchNumberItem tinyint NOT NULL
	, AssembledLeadDays int NOT NULL
	, GrossWeight float NULL
	, Barcode nvarchar(60) NULL
	, CIGCopyTime datetime NULL
	, CIGProcessed bit NULL
	, AverageCost float NULL
	, NetWeight float NULL
	, Extension uniqueidentifier NULL
	, IsTaxable tinyint NULL
	, sysmodifier uniqueidentifier NULL
	, syscreator uniqueidentifier NULL
	, CalculatorUnit nvarchar(8) NULL
	, LengthUnit nvarchar(8) NULL
	, WeightPerUnit nvarchar(8) NULL
	, WeightUnit nvarchar(8) NULL
	, PlannedLengthUnit nvarchar(8) NULL
	, PlannedAreaUnit nvarchar(8) NULL
	, PlannedWeightUnit nvarchar(8) NULL
	, PlannedVolumeUnit nvarchar(8) NULL
	, CalculatorType smallint NULL
	, CalculatorUnitFactor float NULL
	, CalculatorUnitFactorType int NULL
	, Length float NULL
	, Width float NULL
	, Depth float NULL
	, Margin float NULL
	, WeightFactor float NULL
	, GLRevenue uniqueidentifier NULL
	, GLCosts uniqueidentifier NULL
	, GLStock uniqueidentifier NULL
	, GLAssets uniqueidentifier NULL
	, GLDepreciationPL uniqueidentifier NULL
	, GLDepreciationBS uniqueidentifier NULL
	, GLRevaluationBS uniqueidentifier NULL
	, CostPriceCurrency nchar(3) NULL
	, ItemGroup uniqueidentifier NULL
	, Class_01 nvarchar(30) NULL
	, Class_03 nvarchar(30) NULL
	, Class_04 nvarchar(30) NULL
	, Class_05 nvarchar(30) NULL
	, Class_06 nvarchar(30) NULL
	, Class_07 nvarchar(30) NULL
	, Class_08 nvarchar(30) NULL
	, Class_09 nvarchar(30) NULL
	, Class_10 nvarchar(30) NULL
	, CostPriceNew float NULL
	, Picture varbinary(max) NULL
	, PictureFileName nvarchar(128) NULL
	, FreeDateField_01 datetime NULL
	, FreeDateField_02 datetime NULL
	, FreeDateField_03 datetime NULL
	, FreeDateField_04 datetime NULL
	, FreeDateField_05 datetime NULL
	, FreeNumberField_01 float NULL
	, FreeNumberField_02 float NULL
	, FreeNumberField_03 float NULL
	, FreeNumberField_04 float NULL
	, FreeNumberField_05 float NULL
	, FreeNumberField_06 float NULL
	, FreeNumberField_07 float NULL
	, FreeNumberField_08 float NULL
	, FreeBoolField_01 bit NULL
	, FreeBoolField_02 bit NULL
	, FreeBoolField_03 bit NULL
	, FreeBoolField_04 bit NULL
	, FreeBoolField_05 bit NULL
	, FreeTextField_01 nvarchar(80) NULL
	, FreeTextField_02 nvarchar(80) NULL
	, FreeTextField_03 nvarchar(80) NULL
	, FreeTextField_04 nvarchar(80) NULL
	, FreeTextField_05 nvarchar(80) NULL
	, FreeTextField_06 nvarchar(80) NULL
	, FreeTextField_07 nvarchar(80) NULL
	, FreeTextField_08 nvarchar(80) NULL
	, FreeTextField_09 nvarchar(80) NULL
	, FreeTextField_10 nvarchar(80) NULL
	, StatisticalNumber nchar(9) NULL
	, StatisticalUnits float NULL
	, StatisticalQuantity float NULL
	, StatisticalValue float NULL
	, StatisticalNetWeight float NULL
	, Unit nchar(8) NULL
	, Notes nvarchar(max) NULL
	, XmlData nvarchar(max) NULL
	, SalesVATCode nchar(3) NULL
	, DepreciationMethod uniqueidentifier NULL
	, ModuleCode bigint NULL
	, StartDate datetime NULL
	, EndDate datetime NULL
	, Language nchar(10) NULL
	, TopicParent uniqueidentifier NULL
	, TopicTime bigint NULL
	, DescriptionTermID int NULL
	, ExtraDescription nvarchar(255) NULL
	, ExtraDescriptionTermID int NULL
	, SearchCode nvarchar(13) NULL
)
END
GO
