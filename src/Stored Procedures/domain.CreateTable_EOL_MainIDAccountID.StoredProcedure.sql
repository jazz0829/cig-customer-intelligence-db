USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_EOL_MainIDAccountID]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_EOL_MainIDAccountID]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_EOL_MainIDAccountID]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 16-06-16
-- Description:	Create Table for linking the maincontact ID and the AccountID
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_EOL_MainIDAccountID] 

AS
BEGIN

CREATE TABLE EOL_MainIDAccountID
(
AccountID nvarchar(50),
AccountCode varchar(18),
MainContact nvarchar(50)
)

END
GO
