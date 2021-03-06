USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Cancellation]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Cancellation]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Cancellation]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 24-05-2016
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Cancellation] 

AS
BEGIN
IF OBJECT_ID (N'Cancellation', N'U') IS NOT NULL 
DROP TABLE Cancellation

CREATE TABLE [domain].[Cancellation](
	[RequestID] nvarchar(max) Null,
	[Environment] nchar(20) Null,
	[AccountCode] nvarchar(30) Null,
    [Created] datetime Null,
	[TypeDescription] nvarchar(max) Null,
	[Description] nvarchar(max) Null,
	[FullCancellation] int Null
	
	)
END
GO
