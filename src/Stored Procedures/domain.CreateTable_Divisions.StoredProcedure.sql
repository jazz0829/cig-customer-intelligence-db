USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Divisions]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Divisions]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Divisions]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 09/09/2016
-- Description:	This procedure drops the previous version of the Divisions table and rebuilds it. 
--				The domain.Divisions table contains a slightly modified version of the raw Divisions table from EOL. For example, the Customer field is renamed
--				AccountID and some fields from the raw table are not included.
-- =====================================================================================================================================================================


CREATE PROCEDURE [domain].[CreateTable_Divisions]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.Divisions', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.Divisions

CREATE TABLE CustomerIntelligence.domain.Divisions
(
	[Environment] nchar(3) NOT NULL ,					
	[DivisionCode] int NOT NULL ,
	--[HID] bigint NOT NULL ,
	[DivisionDescription] nvarchar(60) NULL ,
	[AccountID] uniqueidentifier NULL ,					-- This field is called Customer in the raw table
	[Country] nchar(3) NULL ,
	[Currency] nchar(3) NULL ,
	[Main] bit NOT NULL ,
	[StartDate] datetime NULL ,
	[EndDate] datetime NULL ,
	--[Account] uniqueidentifier NULL,
	[CustomerPortal] bit NOT NULL ,
	[BlockingStatusCode] int NOT NULL ,
	[Status] smallint NOT NULL ,
	[LinkedDivision] int NULL ,
	[LegislationCode] bigint NULL ,
	--[timestamp] [timestamp] NOT NULL ,
	[TemplateCode] nvarchar(30) NULL ,
	--[TaxOfficeNumber] nvarchar(4) NULL ,
	[DatevAccountantNumber] nvarchar(7) NULL ,
	[DatevClientNumber] nvarchar(5) NULL ,
	[ShareCapital] float NULL ,

	[Origin] smallint NOT NULL , 
	[Website] nvarchar(128) NULL,
	[SectorID] uniqueidentifier NULL,					 -- This field is called ActivitySector in the raw table
	[SubSectorID] uniqueidentifier NULL,				 -- This field is called ActivityID SubSector in the raw table
	[CompanySizeID] uniqueidentifier NULL,
	[ChamberOfCommerce] nvarchar(20) NULL,
	[City] nvarchar(100) NULL,
	[Postcode] nvarchar(20) NULL,
	[DunsNumber] nvarchar(9) NULL,
	[BusinessTypeID] uniqueidentifier NULL,

	[CIGCopyTime] datetime NULL ,
	[Deleted] datetime NULL ,
	[Deleter] uniqueidentifier NULL ,
	[syscreated] datetime NOT NULL ,
	[syscreator] uniqueidentifier NULL ,
	[sysmodified] datetime NOT NULL ,
	[sysmodifier] uniqueidentifier NULL 

)

CREATE CLUSTERED INDEX IX_Environment_DivisionCode ON CustomerIntelligence.domain.Divisions (Environment, DivisionCode)

END
GO
