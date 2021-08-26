USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[InsertTmp]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[InsertTmp]
GO
/****** Object:  StoredProcedure [domain].[InsertTmp]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[InsertTmp](@accountantCode nvarchar(60), @accountantName nvarchar(60)) AS
BEGIN
	INSERT INTO dbo.tmp_test (AccountantCode, AccountantName) 
	VALUES (@accountantCode, @accountantName)
END
GO
