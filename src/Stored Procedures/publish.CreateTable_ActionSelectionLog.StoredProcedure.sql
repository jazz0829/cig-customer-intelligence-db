USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [publish].[CreateTable_ActionSelectionLog]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [publish].[CreateTable_ActionSelectionLog]
GO
/****** Object:  StoredProcedure [publish].[CreateTable_ActionSelectionLog]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [publish].[CreateTable_ActionSelectionLog] AS

-- ===========================================================================================================================================================
-- Author:		Alex Green
-- Create date: 22-07-2016
-- Description:	Creates the table that logs the actions that customers have received. 
-- ===========================================================================================================================================================

CREATE TABLE [dbo].[ActionSelectionLog]
	(
		  Environment  nchar(3)  NOT NULL
		, AccountCode  nvarchar(18)  NOT NULL		
		, ActionDate DATE NOT NULL
		, ActionID int NOT NULL 
	)
GO
