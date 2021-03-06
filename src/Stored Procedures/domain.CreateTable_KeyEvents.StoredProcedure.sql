USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_KeyEvents]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_KeyEvents]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_KeyEvents]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-05-08
-- Description:	Create Table procedure for building the domain.KeyEvents table
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_KeyEvents] 
AS
BEGIN
CREATE TABLE domain.KeyEvents_All
(
[AccountID] uniqueidentifier not null,
[Environment] nvarchar(3) not null,
[DivisionCode] nvarchar(50) null,
[UserID] nvarchar(100) null,
[Key Event] nvarchar(100) null,
[Key Event timestamp] datetime null
)
END
GO
