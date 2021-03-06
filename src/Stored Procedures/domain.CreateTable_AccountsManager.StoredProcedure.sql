USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AccountsManager]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_AccountsManager]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AccountsManager]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 24-11-2015
-- Description:	Creates the AccountManager Accounts support table
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_AccountsManager]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.AccountsManager', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.AccountsManager

Create Table CustomerIntelligence.domain.AccountsManager
(	
	AccountManagerCode  int  NULL,
	AccountManagerName varchar(128) NULL,
	BusinessLineCode nvarchar(30) NULL,
	BusinessLineDescription nvarchar(60) NULL,
)

CREATE CLUSTERED INDEX AccountsManagerCode ON AccountsManager (AccountManagerCode)

END
GO
