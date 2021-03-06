USE [CustomerIntelligence]
GO
/****** Object:  Index [NonClusteredIndex-20170606-115129]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [NonClusteredIndex-20170606-115129] ON [domain].[Items]
GO
/****** Object:  Index [ClusteredIndex-20170606-115115]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [ClusteredIndex-20170606-115115] ON [domain].[Items] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Items]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Items]
GO
/****** Object:  Table [domain].[Items]    Script Date: 24-sept.-18 14:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Items](
	[ItemID] [uniqueidentifier] NOT NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ItemDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ItemType] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Division] [int] NOT NULL,
	[CostPriceStandard] [float] NOT NULL,
	[SecurityLevel] [int] NOT NULL,
	[IsSalesItem] [bit] NOT NULL,
	[IsStockItem] [bit] NOT NULL,
	[IsSerialNumberItem] [bit] NOT NULL,
	[IsSubAssemblyItem] [bit] NOT NULL,
	[IsFractionAllowedItem] [bit] NOT NULL,
	[IsAssetItem] [bit] NOT NULL,
	[IsTime] [tinyint] NOT NULL,
	[IsNewContract] [tinyint] NOT NULL,
	[IsOnDemandItem] [tinyint] NOT NULL,
	[IsPurchaseItem] [bit] NOT NULL,
	[IsSubcontractedItem] [bit] NOT NULL,
	[IsMakeItem] [tinyint] NOT NULL,
	[IsWebshopItem] [tinyint] NOT NULL,
	[CopyRemarks] [tinyint] NOT NULL,
	[IsPackageItem] [bit] NOT NULL,
	[BatchQuantity] [float] NOT NULL,
	[UseExplosion] [tinyint] NOT NULL,
	[HasBillOfMaterial] [tinyint] NOT NULL,
	[RoundEach] [tinyint] NOT NULL,
	[RoundPlannedQuantityFactor] [tinyint] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[IsRegistrationCodeItem] [tinyint] NOT NULL,
	[IsBatchNumberItem] [tinyint] NOT NULL,
	[AssembledLeadDays] [int] NOT NULL,
	[GrossWeight] [float] NULL,
	[Barcode] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[CIGProcessed] [bit] NULL,
	[AverageCost] [float] NULL,
	[NetWeight] [float] NULL,
	[Extension] [uniqueidentifier] NULL,
	[IsTaxable] [tinyint] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[CalculatorUnit] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LengthUnit] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WeightPerUnit] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WeightUnit] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PlannedLengthUnit] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PlannedAreaUnit] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PlannedWeightUnit] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PlannedVolumeUnit] [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CalculatorType] [smallint] NULL,
	[CalculatorUnitFactor] [float] NULL,
	[CalculatorUnitFactorType] [int] NULL,
	[Length] [float] NULL,
	[Width] [float] NULL,
	[Depth] [float] NULL,
	[Margin] [float] NULL,
	[WeightFactor] [float] NULL,
	[GLRevenue] [uniqueidentifier] NULL,
	[GLCosts] [uniqueidentifier] NULL,
	[GLStock] [uniqueidentifier] NULL,
	[GLAssets] [uniqueidentifier] NULL,
	[GLDepreciationPL] [uniqueidentifier] NULL,
	[GLDepreciationBS] [uniqueidentifier] NULL,
	[GLRevaluationBS] [uniqueidentifier] NULL,
	[CostPriceCurrency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemGroup] [uniqueidentifier] NULL,
	[Class_01] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class_03] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class_04] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class_05] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class_06] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class_07] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class_08] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class_09] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class_10] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CostPriceNew] [float] NULL,
	[Picture] [varbinary](max) NULL,
	[PictureFileName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeDateField_01] [datetime] NULL,
	[FreeDateField_02] [datetime] NULL,
	[FreeDateField_03] [datetime] NULL,
	[FreeDateField_04] [datetime] NULL,
	[FreeDateField_05] [datetime] NULL,
	[FreeNumberField_01] [float] NULL,
	[FreeNumberField_02] [float] NULL,
	[FreeNumberField_03] [float] NULL,
	[FreeNumberField_04] [float] NULL,
	[FreeNumberField_05] [float] NULL,
	[FreeNumberField_06] [float] NULL,
	[FreeNumberField_07] [float] NULL,
	[FreeNumberField_08] [float] NULL,
	[FreeBoolField_01] [bit] NULL,
	[FreeBoolField_02] [bit] NULL,
	[FreeBoolField_03] [bit] NULL,
	[FreeBoolField_04] [bit] NULL,
	[FreeBoolField_05] [bit] NULL,
	[FreeTextField_01] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_02] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_03] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_04] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_05] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_06] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_07] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_08] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_09] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_10] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatisticalNumber] [nchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StatisticalUnits] [float] NULL,
	[StatisticalQuantity] [float] NULL,
	[StatisticalValue] [float] NULL,
	[StatisticalNetWeight] [float] NULL,
	[Unit] [nchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[XmlData] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalesVATCode] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DepreciationMethod] [uniqueidentifier] NULL,
	[ModuleCode] [bigint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Language] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TopicParent] [uniqueidentifier] NULL,
	[TopicTime] [bigint] NULL,
	[DescriptionTermID] [int] NULL,
	[ExtraDescription] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExtraDescriptionTermID] [int] NULL,
	[SearchCode] [nvarchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [ClusteredIndex-20170606-115115]    Script Date: 24-sept.-18 14:21:29 ******/
CREATE CLUSTERED INDEX [ClusteredIndex-20170606-115115] ON [domain].[Items]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20170606-115129]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20170606-115129] ON [domain].[Items]
(
	[ItemID] ASC,
	[Environment] ASC,
	[ItemCode] ASC,
	[ItemDescription] ASC,
	[ItemType] ASC,
	[Division] ASC,
	[IsPackageItem] ASC,
	[Class_01] ASC,
	[IsNewContract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
