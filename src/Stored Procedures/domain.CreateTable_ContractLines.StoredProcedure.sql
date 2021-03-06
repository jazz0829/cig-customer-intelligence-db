USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ContractLines]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ContractLines]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ContractLines]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_ContractLines]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.ContractLines', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.ContractLines

CREATE TABLE domain.ContractLines
	(
	[ID] [uniqueidentifier] NOT NULL,
	[ContractID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ContractEvent] [nvarchar](3) NULL,
	[FinalDate] [datetime] NULL,
	[CancellationDate] [datetime] NULL,
	[CancellationEvent] [nvarchar](3) NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL,
	[Unitcode] [nchar](8) NULL,
	[Type] [nchar](2) NULL,
	[syscreated] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NULL,
	[sysmodifier] [uniqueidentifier] NULL
	)
END
GO
