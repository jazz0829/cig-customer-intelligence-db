USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivityDaily_ActivityLog]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ActivityDaily_ActivityLog]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivityDaily_ActivityLog]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 08-02-2016
-- Description:	Loading the data into the activityDaily based on data from the ActivityLog
-- =============================================

CREATE PROC [domain].[Load_ActivityDaily_ActivityLog] (@RefDate date, @ActivityID INT, @ActivitySource NVARCHAR(MAX), @ActivityField NVARCHAR(MAX), @ActivityDetail NVARCHAR(MAX), @ActivityAction INT, @LogText NVARCHAR(MAX)) AS

Declare @RefDatePlus Date
Set @RefDatePlus=DATEADD(day,1,@RefDate)

--General ActivityLog Browser Manual Pages
IF @ActivityID='1'
BEGIN
INSERT INTO [domain].[ActivityDaily] (Environment, Date, AccountID, AccountCode, UserID, DivisionCode, ActivityID, Quantity, AverageDuration) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, UserID, AdministrationCode, @ActivityID, COUNT_big (*) AS Quantity , ROUND(AVG(Cast(Duration as bigint)),0)
FROM [raw].[EOLActivityLog]
WHERE LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus AND @ActivityID='1' AND Type='0' AND App NOT Like'XML%' AND App<>'Clearsession.aspx' AND Environment IS NOT NULL
GROUP BY CAST (LogDateTime AS Date), Environment,  AccountID, AccountCode, AdministrationCode, UserID
End

----General Activitylog Browser Unique Users
IF @ActivityID='2'
BEGIN
INSERT INTO [domain].[ActivityDaily] (Environment, Date, AccountID, AccountCode, ActivityID, Quantity) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, @ActivityID, COUNT(Distinct UserID) AS Quantity
FROM [raw].[EOLActivityLog]
WHERE LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus AND @ActivityID ='2' AND Type='0' AND App NOT Like'XML%' AND App<>'Clearsession.aspx'
GROUP BY Environment, CAST (LogDateTime AS Date), AccountID, AccountCode
END

----General Activitylog Browser Unique Administrations
IF @ActivityID='3'
BEGIN
INSERT INTO [domain].[ActivityDaily] (Environment, Date, AccountID, AccountCode, ActivityID, Quantity) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, @ActivityID, COUNT(Distinct AdministrationCode) AS Quantity
FROM [raw].[EOLActivityLog]
WHERE LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus AND @ActivityID ='3' AND Type='0' AND App NOT Like'XML%' AND App<>'Clearsession.aspx'
GROUP BY Environment, CAST (LogDateTime AS Date), AccountID, AccountCode
END

--Specific ActivityLog per administrationID and userID
IF @ActivityID BETWEEN '5000' AND '6000'
BEGIN 
INSERT INTO [domain].[ActivityDaily] (Environment, Date, AccountID, AccountCode, UserID, DivisionCode, ActivityID, Quantity, AverageDuration) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, UserID, AdministrationCode, @ActivityID,  COUNT_big (*) AS Quantity , ROUND(AVG(Cast(Duration as bigint)),0)
FROM [raw].[EOLActivityLog]
WHERE LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus AND App = @ActivityDetail AND (@ActivityID<6000 AND @ActivityID>5000) 
GROUP BY Environment, CAST (LogDateTime AS Date), AccountID, AccountCode, AdministrationCode, UserID
END

--General ActivityLog Unique Mobile Users
IF @ActivityID='8'
BEGIN
INSERT INTO [domain].[ActivityDaily] (Environment, Date, AccountID, AccountCode, ActivityID, Quantity) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, @ActivityID, COUNT(Distinct UserID) AS Quantity
FROM [raw].[EOLActivityLog]
WHERE LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus AND @ActivityID ='8' AND App='restapi/apps/internal/smartphonemenu'  
GROUP BY Environment, CAST (LogDateTime AS Date), AccountID, AccountCode
END

--General ActivityLog Unique Mobile Administrations
IF @ActivityID='9'
BEGIN
INSERT INTO [domain].[ActivityDaily] (Environment, Date, AccountID, AccountCode, ActivityID, Quantity) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, @ActivityID, COUNT(Distinct AdministrationCode) AS Quantity
FROM [raw].[EOLActivityLog]
WHERE LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus AND @ActivityID ='9' AND App='restapi/apps/internal/smartphonemenu'
GROUP BY Environment, CAST (LogDateTime AS Date), AccountID, AccountCode
END

--General Activitylog Total Unique Users (browser and mobile)
IF @ActivityID='14'
BEGIN
INSERT INTO domain.ActivityDaily (Environment, Date, AccountID, AccountCode, ActivityID, Quantity) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, @ActivityID, COUNT(Distinct UserID) AS Quantity
FROM [raw].[EOLActivityLog]
WHERE LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus AND ((Type='0' AND App NOT Like'XML%' AND App<>'Clearsession.aspx') OR App='restapi/apps/internal/smartphonemenu') 
GROUP BY Environment, CAST (LogDateTime AS Date), AccountID, AccountCode
END

--General Activitylog Total Unique Users (browser and mobile)
IF @ActivityID='15'
BEGIN
INSERT INTO domain.ActivityDaily (Environment, Date, AccountID, AccountCode, ActivityID, Quantity) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, @ActivityID, COUNT(Distinct AdministrationCode) AS Quantity
FROM [raw].[EOLActivityLog]
WHERE LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus AND ((Type='0' AND App NOT Like'XML%' AND App<>'Clearsession.aspx') OR App='restapi/apps/internal/smartphonemenu')
GROUP BY Environment, CAST (LogDateTime AS Date), AccountID, AccountCode
END

--Save action per ActivityID
IF @ActivityID>'500006' AND @ActivityID<'600006' 
BEGIN
INSERT INTO [domain].[ActivityDaily] (Environment, Date, AccountID, AccountCode, UserID, DivisionCode, ActivityID, Quantity, AverageDuration) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, UserID, AdministrationCode, @ActivityID,  COUNT_big (*) AS Quantity , ROUND(AVG(Cast(Duration as bigint)),0)
FROM [raw].[EOLActivityLog]
WHERE LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus AND App = @ActivityDetail AND Action=@ActivityAction AND (@ActivityID>'500006' AND @ActivityID<'600006') 
GROUP BY Environment, CAST (LogDateTime AS Date), AccountID, AccountCode, AdministrationCode, UserID
End


--Save Action with LogText information per ActivityID
IF @ActivityID>'50000601'
BEGIN
INSERT INTO [domain].[ActivityDaily] (Environment, Date, AccountID, AccountCode, UserID, DivisionCode, ActivityID, Quantity, AverageDuration) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, UserID, AdministrationCode, @ActivityID, COUNT_big (*) AS Quantity , ROUND(AVG(Cast(Duration as bigint)),0)
FROM [raw].[EOLActivityLog]
WHERE LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus AND App = @ActivityDetail AND Action=@ActivityAction AND @ActivityID>'50000601' AND LogText NOT LIKE @LogText 
GROUP BY Environment, CAST (LogDateTime AS Date), AccountID, AccountCode, AdministrationCode, UserID
End

--Third Party App Usage
IF @ActivityID>'800000' AND @ActivityID<'900000'
BEGIN
INSERT INTO [domain].[ActivityDaily] (Environment, Date, AccountID, AccountCode, UserID, DivisionCode, ActivityID, Quantity, AverageDuration) 
SELECT Environment, Cast(LogDateTime as Date), AccountID, AccountCode, UserID, AdministrationCode, @ActivityID, COUNT_big (*) AS Quantity , ROUND(AVG(Cast(Duration as bigint)),0)
FROM [raw].[EOLActivityLog]
WHERE 
	LogDateTime>=@RefDate AND LogDateTime<@RefDatePlus 
	AND ApplicationID = @ActivityDetail 
	AND (@ActivityID BETWEEN '800000' AND '900000') 
	AND App LIKE 'restapi%'
	AND Action=@ActivityAction
	AND App NOT IN 
		(
		'restapi/current/me',
        'restapi/entity/hrm/divisions',
        'restapi/entity/users/unlinkallroles',
        'restapi/entity/users/userroles',
        'restapi/entity/users/userrolesperdivision',
        'restapi/entity/users/users',
        'restapi/entity/users/userhasrights',
        'restapi/read/hosting/divisionusers',
        'restapi/read/hosting/userroles',
        'restapi/read/hosting/users',
        'restapi/system/system/availablefeatures',
        'restapi/system/system/divisions',
        'restapi/system/system/exactinfo',
        'restapi/system/system/getmostrecentlyuseddivisions',
        'restapi/system/system/me',
        'restapi/system/system/smartphonemenu',
        'restapi/system/system/smartphonerights',
        'restapi/system/system/users'
		)
GROUP BY Environment, CAST (LogDateTime AS Date), AccountID, AccountCode, AdministrationCode, UserID
END



GO
