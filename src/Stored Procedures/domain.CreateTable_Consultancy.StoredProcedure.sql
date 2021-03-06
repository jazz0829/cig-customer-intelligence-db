USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Consultancy]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Consultancy]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Consultancy]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 08-02-2016
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Consultancy] 

AS
Begin
IF OBJECT_ID (N'Consultancy', N'U') IS NOT NULL 
DROP TABLE Consultancy

CREATE TABLE [domain].[Consultancy](
	[ID] [nvarchar](100) NOT NULL,
	[Environment] [nchar](3) NOT NULL,
	[TypeHID][int] NOT NULL,
	[HID][int] NOT NULL,
	[TypeDescription][nvarchar](120) NULL,
	[Created][Date] NULL,
	[AccountCode] [nvarchar](30) NULL,
	[Approved][Date] NULL,
	[Realised][Date] NULL,
	[Status][smallint] NULL,
	[ItemCode_1][nvarchar](160) NULL,
	[FreeTextField_01] [nvarchar](160) NULL,
	[Description] [nvarchar](max) NULL,
	)

CREATE CLUSTERED INDEX EnviroAccountCode ON Consultancy(Environment, AccountCode)

End
GO
