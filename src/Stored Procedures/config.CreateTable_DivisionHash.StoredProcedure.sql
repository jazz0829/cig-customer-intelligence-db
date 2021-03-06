USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[CreateTable_DivisionHash]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[CreateTable_DivisionHash]
GO
/****** Object:  StoredProcedure [config].[CreateTable_DivisionHash]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 01-07-2016
-- Description:	Create Table look up
-- =============================================
CREATE PROCEDURE [config].[CreateTable_DivisionHash] AS
BEGIN
IF OBJECT_ID (N'CustomerIntelligence.config.DivisionHash', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.config.DivisionHash

CREATE TABLE CustomerIntelligence.config.DivisionHash
(	
Division nvarchar(max),
HashedDivision nvarchar(max)
)
END
GO
