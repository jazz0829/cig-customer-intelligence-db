USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ContractEventTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ContractEventTypes]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ContractEventTypes]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_ContractEventTypes]

-- ===================================================================
-- Author:		Alex Green (based on initial script from Ronald Dahne)
-- Create date: 24-11-2015
-- Description:	Creates the ContractEventTypes table
--====================================================================

AS
BEGIN

IF OBJECT_ID (N'ContractEventTypes', N'U') IS NOT NULL 
DROP TABLE ContractEventTypes

CREATE TABLE [domain].[ContractEventTypes]
(
	[Environment] [nchar](3) NOT NULL,
	[ContractEventTypeCode] [nvarchar](30) NULL,
	[ContractEventDescription] [nvarchar](60) NULL
)

CREATE CLUSTERED INDEX ContractEventTypeCode ON ContractEventTypes (Environment, ContractEventTypeCode)

END
GO
