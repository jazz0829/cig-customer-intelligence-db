USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DivisionDivisionTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_DivisionDivisionTypes]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DivisionDivisionTypes]    Script Date: 24-sept.-18 14:29:53 ******/
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


CREATE PROCEDURE [domain].[CreateTable_DivisionDivisionTypes]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.Divisions', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.DivisionDivisionTypes

CREATE TABLE domain.DivisionDivisionTypes(
	[ID] [uniqueidentifier] NOT NULL,
	[DivisionCode] [int] NOT NULL,
	[DivisionType] [uniqueidentifier] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[InvoiceAccount] [uniqueidentifier] NULL,
	[InvoicedUntil] [date] NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL
)


END
GO
