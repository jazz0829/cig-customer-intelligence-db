USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[CreateTable_YearMonth]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[CreateTable_YearMonth]
GO
/****** Object:  StoredProcedure [config].[CreateTable_YearMonth]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [config].[CreateTable_YearMonth]
AS

-- ==================================================================================================================
-- Author:		Alex Green (based on original script from Ronald Dahne
-- Create date: 30/11/2015
-- Description: Creates the YearMonth table used by procedures to group contracts and activities by year and month  
-- ==================================================================================================================

-- Drops the previous YearMonth table
IF OBJECT_ID (N'YearMonth', N'U') IS NOT NULL 
DROP TABLE YearMonth

-- Sets the dates for the table
DECLARE 
	@FromDate DATE, 
	@ToDate DATE;
SET @FromDate = '2005-01-01';
SET @ToDate = '2020-12-31';


-- Create years and months
SELECT 
	TOP (DATEDIFF(MONTH, @FromDate, @ToDate)+1) 
	YEAR(DATEADD(MONTH, number, @FromDate)) AS Year,
	MONTH(DATEADD(MONTH, number, @FromDate)) AS Month,
	DATEADD(MONTH, number, @FromDate) AS StartDate,
	DATEADD(DAY, -1, (DATEADD(MONTH, number+ 1, @FromDate))) AS EndDate
INTO YearMonth
FROM [master].dbo.spt_values 
WHERE [type] = N'P' 
ORDER BY number;
GO
