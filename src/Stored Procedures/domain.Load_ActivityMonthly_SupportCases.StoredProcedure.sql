USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivityMonthly_SupportCases]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ActivityMonthly_SupportCases]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivityMonthly_SupportCases]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 08-02-2016
-- Description:	Load the ActivityMonthly table with summarised data from the supportcases table.
-- =============================================
CREATE PROCEDURE [domain].[Load_ActivityMonthly_SupportCases] (@StartDate date, @ActivityID INT, @ActivitySource NVARCHAR(MAX), @ActivityField NVARCHAR(MAX), @ActivityDetail NVARCHAR(MAX))
AS
DECLARE @Year int
DECLARE @Month int

SET @Year = Datepart(yyyy,@StartDate)
SET @Month = Datepart(mm,@StartDate) 

--Count of supportcases general
IF @ActivityID='4'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year,Month, AccountCode, ActivityID, Quantity, YearMonth) 
SELECT Environment, @YEAR, @MONTH, AccountCode, @ActivityID,  SUM(Quantity), Concat(@Year, RIGHT(100+@month,2)) as YearMonth
FROM domain.ActivityDaily
WHERE @Year= Datepart(yyyy,Date) AND @Month=Datepart(mm,Date) AND ActivityID='4'
GROUP BY Environment,  Datepart(yyyy,Date), Datepart(mm,Date), AccountCode, ActivityID
END

--Count of supportcases specific
IF @ActivityID>='1000' AND @ActivityID<='2000'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year,Month, AccountCode, ActivityID, Quantity, YearMonth) 
SELECT Environment, @YEAR, @MONTH, AccountCode, ActivityID,  SUM(Quantity), Concat(@Year, RIGHT(100+@month,2)) as YearMonth
FROM domain.ActivityDaily
WHERE @Year= Datepart(yyyy,Date) AND @Month=Datepart(mm,Date) AND ActivityID=@ActivityID AND (ActivityID>='1000' AND ActivityID<='2000')
GROUP BY Environment,  Datepart(yyyy,Date), Datepart(mm,Date), AccountCode, ActivityID
END

--General Complaints
IF @ActivityID='5'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year, Month, AccountCode, ActivityID, Quantity, YearMonth) 
SELECT Environment, @Year, @Month, AccountCode, @ActivityID,  Sum(Quantity), Concat(@Year, RIGHT(100+@month,2)) as YearMonth
FROM domain.ActivityDaily
WHERE @Year=Datepart(yyyy,Date) AND @Month = Datepart(mm,Date) AND ActivityID='5'
GROUP BY Environment,  Datepart(yyyy,Date), Datepart(mm,Date), AccountCode, ActivityID
END

--General Consultancy Request Created
IF @ActivityID='6'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year, Month, AccountCode, ActivityID, Quantity, YearMonth) 
SELECT Environment, @Year, @Month, AccountCode, @ActivityID,  Sum(Quantity), Concat(@Year, RIGHT(100+@month,2)) as YearMonth
FROM domain.ActivityDaily
WHERE @Year=Datepart(yyyy,Date) AND @Month = Datepart(mm,Date) AND ActivityID='6'
GROUP BY Environment,  Datepart(yyyy,Date), Datepart(mm,Date), AccountCode, ActivityID
END

--General Consultancy Request Realised
IF @ActivityID='7'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year, Month, AccountCode, ActivityID, Quantity, YearMonth) 
SELECT Environment, @Year, @Month, AccountCode, @ActivityID,  Sum(Quantity), Concat(@Year, RIGHT(100+@month,2)) as YearMonth
FROM domain.ActivityDaily
WHERE @Year=Datepart(yyyy,Date) AND @Month = Datepart(mm,Date) AND ActivityID='7' 
GROUP BY Environment,  Datepart(yyyy,Date), Datepart(mm,Date), AccountCode, ActivityID
END

--General Cancellation requests
IF @ActivityID='12'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year, Month, AccountCode, ActivityID, Quantity, YearMonth) 
SELECT Environment, @Year, @Month, AccountCode, @ActivityID,  Sum(Quantity), Concat(@Year, RIGHT(100+@month,2)) as YearMonth
FROM domain.ActivityDaily
WHERE @Year=Datepart(yyyy,Date) AND @Month = Datepart(mm,Date) AND ActivityID='12'
GROUP BY Environment,  Datepart(yyyy,Date), Datepart(mm,Date), AccountCode, ActivityID
END
GO
