USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Ronald_Load_CoCreate]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Ronald_Load_CoCreate]
GO
/****** Object:  StoredProcedure [domain].[Ronald_Load_CoCreate]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [domain].[Ronald_Load_CoCreate] (@measuregroup nvarchar(60), @measure nvarchar(60), @field nvarchar(60))
AS

DECLARE @sql nvarchar (4000)

--SET @field = 'Q7'
--SET @measuregroup = '''Product'''
--SET @measure = '''UX'''

--SELECT @field
SET @sql =  'INSERT INTO CoCreate  (Environment, AccountCode, Period, Year, Month, Solution, Measuregroup, Measure, Value) '

SET @sql = @sql + 'SELECT  '
SET @sql = @sql + ' CASE Q24_23' 
SET @sql = @sql + ' WHEN ' + '''GB''' 
SET @sql = @sql + ' THEN ' + '''UK''' 
SET @sql = @sql + '	ELSE Q24_23 '
SET @sql = @sql + ' END AS Environment,  '
SET @sql = @sql + ' Q24_14 as AccountCode, '
SET @sql = @sql + ' Q27_6 as Period, '
SET @sql = @sql + ' LEFT(Q27_6, 4) as Year, '
SET @sql = @sql + '	RIGHT(Q27_6,2) as Month, '
SET @sql = @sql + '	Q24_38 as Solution, '
SET @sql = @sql + '	''' + @measuregroup + ''', '
SET @sql = @sql + '	''' + @measure + ''', '
SET @sql = @sql + ' ' + @field  + ' - 1 as Value '
SET @sql = @sql + ' FROM  [CoCreate_Relationship_Survey]'
SET @sql = @sql + ' GROUP BY Q24_23, Q24_14, Q27_6, Q24_38, ' + @field

--select @sql

EXEC (@sql)
GO
