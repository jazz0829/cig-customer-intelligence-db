USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_EOL_UserIDAccountID]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_EOL_UserIDAccountID]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_EOL_UserIDAccountID]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 16-06-16
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_EOL_UserIDAccountID] AS


BEGIN
CREATE TABLE EOL_UserIDAccountID
(
UserID nvarchar(50),
PersonID nvarchar(50),
AccountID nvarchar(50),
UserStartDate Datetime,
UserEndDate Datetime
)
END
GO
