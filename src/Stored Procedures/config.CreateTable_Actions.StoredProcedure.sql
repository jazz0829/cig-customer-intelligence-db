USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[CreateTable_Actions]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[CreateTable_Actions]
GO
/****** Object:  StoredProcedure [config].[CreateTable_Actions]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [config].[CreateTable_Actions] AS

-- ===========================================================================================================================================================
-- Author:		Alex Green
-- Create date: 22-07-2016
-- Description:	Creates the table that records the different actions driven out of the Customer Intelligence team
-- ===========================================================================================================================================================

CREATE TABLE [config].[Actions]
	(
		  ActionID int NOT NULL
		, ActionType nvarchar(50) NULL
		, ActionSystem nvarchar(50) NULL
		, ActionDescription nvarchar(max) NULL
		, ActionPerformedBy nvarchar(50) NULL
		, ActionCurrentlyActive int NULL 
		, StoredProcedure nvarchar(100) NULL
		, DateStoredProcedureLastRun datetime NULL
		, FurtherInformation nvarchar(max) NULL
	)
GO
