USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[CreateTable_SupportSalesForce]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[CreateTable_SupportSalesForce]
GO
/****** Object:  StoredProcedure [raw].[CreateTable_SupportSalesForce]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===================================================================================================
-- Author:		Jennifer Vink
-- Create date: 30-05-2016
-- Description:	Manual import of the supportcases from Salesforce
-- ===================================================================================================
CREATE PROCEDURE [raw].[CreateTable_SupportSalesForce] 
AS
                      
IF OBJECT_ID (N'SupportSalesForce', N'U') IS NOT NULL 
DROP TABLE raw.SupportSalesForce

CREATE TABLE [raw].SupportSalesForce(
	[RequestID] [int] NULL,
	[Environment] [nchar](3) NULL,
	[AccountCode] [nvarchar](max) NULL,
    [Origin] [nvarchar](max) NULL,
	[Opened Date] Datetime NULL,
	[Date/Time Opened] Datetime NULL,
	[Closed Date] Datetime NULL,
	[Date/Time Closed] Datetime NULL,
	[Case Record Type] nvarchar(36) NULL,
	[Type] nvarchar(36) NULL,
    [Main Reason] nvarchar(50) NULL,
	[Sub Reason] nvarchar(max) NULL,
	[Subject] nvarchar(max) NULL,
	[Description] [nvarchar](max) NULL,
	)
GO
