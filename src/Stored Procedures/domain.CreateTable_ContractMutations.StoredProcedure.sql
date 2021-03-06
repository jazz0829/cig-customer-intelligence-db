USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ContractMutations]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ContractMutations]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ContractMutations]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_ContractMutations] 
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.ContractMutations ', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.ContractMutations 

CREATE TABLE domain.ContractMutations
	(
	[sysmodified] [datetime] NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[HID] [bigint] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[Division] [int] NULL,
	[EventDate] [datetime] NULL,
	[Event] [uniqueidentifier] NULL,
	[Account] [uniqueidentifier] NULL,
	[Contract] [uniqueidentifier] NULL,
	[ContractLine] [uniqueidentifier] NULL,
	[Item] [uniqueidentifier] NULL,
	[Quantity] [int] NULL,
	[ContractLineValue] [float] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL
	)
END
GO
