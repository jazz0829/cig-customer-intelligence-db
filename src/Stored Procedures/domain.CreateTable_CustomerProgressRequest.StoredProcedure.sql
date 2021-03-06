USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CustomerProgressRequest]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_CustomerProgressRequest]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CustomerProgressRequest]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================================
-- Author:		Alex Green
-- Create date: 22-11-2016
-- Description:	Creates the table to load the Customer Progress Requests from ExportEOLRequests 
-- =============================================================================================


CREATE PROCEDURE [domain].[CreateTable_CustomerProgressRequest]

AS

BEGIN
IF OBJECT_ID (N'domain.CustomerProgressRequest', N'U') IS NOT NULL 
DROP TABLE domain.CustomerProgressRequest

CREATE TABLE domain.CustomerProgressRequest
(
	[ID] [uniqueidentifier] NOT NULL,
	[HID] [int] NOT NULL,
	[Environment] [nchar](3) NOT NULL,
	[AccountCode] [nvarchar](36) NULL,
	[AccountName] [nvarchar](100) NULL,
	[TypeDescription] [nvarchar](120) NULL,
	[Created] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[Approved] [datetime] NULL,
	[Realized] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [smallint] NULL,
	[Description] [nvarchar](510) NULL,
	[CreatorFullName] [nvarchar](256) NULL,
	[UserFullName] [nvarchar](256) NULL,

)

END


GO
