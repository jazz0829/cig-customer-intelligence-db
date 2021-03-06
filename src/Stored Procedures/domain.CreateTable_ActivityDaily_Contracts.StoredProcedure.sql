USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ActivityDaily_Contracts]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ActivityDaily_Contracts]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ActivityDaily_Contracts]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 14-06-2016
-- Description:	Create Table ActivityDaily for the contracts data
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_ActivityDaily_Contracts] 
AS
BEGIN
IF OBJECT_ID (N'ActivityDaily_Contracts', N'U') IS NOT NULL 
DROP TABLE ActivityDaily_Contracts

CREATE TABLE [domain].[ActivityDaily_Contracts](
	[Date] date NOT NULL,
	[Environment] nvarchar(3) NOT NULL,
	[AccountCode] nvarchar(18) NULL,
	[PackageCode] nvarchar(36) NULL,
	[ContractEventTypeCode] nvarchar(4) NULL,

	[AccountantOrLinked] int NULL,	
	[NumberOfUsers] int NULL,
	[NumberOfAdministrations] int NULL,
	[MRR] float NULL

)
END
GO
