USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CoCreate]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_CoCreate]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CoCreate]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 01-03-2016
-- Description:	Create the table Co Create
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_CoCreate] 

AS
IF OBJECT_ID (N'CoCreate', N'U') IS NOT NULL 
DROP TABLE CoCreate

CREATE TABLE [domain].[CoCreate](
	[Environment] [nvarchar](10) NOT NULL,
	[AccountCode] [nvarchar](10) NOT NULL,
	[Period] [nvarchar](10) NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Solution] [nvarchar](10) NULL,
	[MeasureGroup] [nvarchar](10) NULL,
	[Measure] [nvarchar](10) NULL,
	[Value] decimal(8,2) NULL,
)

CREATE CLUSTERED INDEX YearMonth ON CoCreate (Year, Month)
CREATE INDEX EnvAccountMeasureGroupMeasure ON CoCreate (Environment, AccountCode, MeasureGroup, Measure)
GO
