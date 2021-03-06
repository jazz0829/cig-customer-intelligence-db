USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[CreateTable_UserIDHash]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[CreateTable_UserIDHash]
GO
/****** Object:  StoredProcedure [config].[CreateTable_UserIDHash]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 01-07-2016
-- Description:	Create Table look up
-- =============================================
CREATE PROCEDURE [config].[CreateTable_UserIDHash] 
AS
BEGIN
IF OBJECT_ID (N'CustomerIntelligence.config.UserIDHash', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.config.UserIDHash

CREATE TABLE CustomerIntelligence.config.UserIDHash
(	
UserID nvarchar(max),
HashedUser nvarchar(max)
)
END
GO
