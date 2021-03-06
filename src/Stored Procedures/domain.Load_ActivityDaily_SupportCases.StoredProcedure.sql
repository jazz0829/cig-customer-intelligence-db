USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivityDaily_SupportCases]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ActivityDaily_SupportCases]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivityDaily_SupportCases]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 08-02-2016
-- Description:	Loading the data into the activityDaily based on data from SupportCases
-- =============================================
CREATE PROCEDURE [domain].[Load_ActivityDaily_SupportCases] (@RefDate date, @ActivityID INT, @ActivitySource NVARCHAR(MAX), @ActivityField NVARCHAR(MAX), @ActivityDetail NVARCHAR(MAX))

AS
Declare @RefDatePlus Date
Set @RefDatePlus=DATEADD(day,1,@RefDate)

--General SupportCases(old)
--IF @ActivityID='4'
--BEGIN
--INSERT INTO ActivityDaily (Environment, Date, AccountCode, ActivityID, Quantity) 
--SELECT Environment, CreatedDate, AccountCode, @ActivityID,  COUNT (*) AS Quantity
--FROM SupportCases
--WHERE CreatedDate = @RefDate
--GROUP BY Environment, CreatedDate, AccountCode
--END

--General SupportCases(new)
IF @ActivityID='4'
BEGIN
INSERT INTO domain.ActivityDaily (Environment, Date, AccountID, AccountCode, ActivityID, Quantity) 
SELECT CASE [Environment]
			WHEN 'GB' 
			THEN 'UK' 
			ELSE [Environment] END AS Environment, [Opened Date] as Date, AccountID, AccountCode as AccountCode, @ActivityID as ActivityID,  COUNT (*) AS Quantity
FROM domain.SupportCases_Salesforce
WHERE 
	[Opened Date] = @RefDate 
	AND [Type] IN ('EOL Lite Support Request', 'EOL Support Issue', 'Exact Go Support')
	AND Environment IN ('NL', 'BE', 'DE', 'US', 'UK', 'FR', 'GB')
GROUP BY [Environment], [Opened Date], AccountID, AccountCode
END

--General Complaints
IF @ActivityID='5'
BEGIN
INSERT INTO domain.ActivityDaily (Environment, Date, AccountID, ActivityID, Quantity) 
SELECT CASE [Environment]
			WHEN 'GB' 
			THEN 'UK' 
			ELSE [Environment] END AS Environment, [Opened Date], AccountID, @ActivityID,  COUNT (*) AS Quantity
FROM domain.SupportCases_Salesforce
WHERE 
	[Opened Date]>=@RefDate AND [Opened Date]<@RefDatePlus 
	AND [Type]='EOL Customer Complaint'
	AND Environment IN ('NL', 'BE', 'DE', 'US', 'UK', 'FR', 'GB')
GROUP BY [Environment], [Opened Date], AccountID
END

--General Consultancy Request Created
IF @ActivityID='6'
BEGIN
INSERT INTO domain.ActivityDaily (Environment, Date, AccountID, ActivityID, Quantity) 
SELECT CASE [Environment]
			WHEN 'GB' 
			THEN 'UK' 
			ELSE [Environment] END AS Environment, Created, AccountID, @ActivityID,  COUNT (*) AS Quantity
FROM [domain].[Requests_ConsultAanvraag]
WHERE Created>=@RefDate AND Created<@RefDatePlus
GROUP BY Environment, Created, AccountID
END

--General Consultancy Request Realised
IF @ActivityID='7'
BEGIN
INSERT INTO domain.ActivityDaily (Environment, Date, AccountID, ActivityID, Quantity) 
SELECT CASE [Environment]
			WHEN 'GB' 
			THEN 'UK' 
			ELSE [Environment] END AS Environment, Realized, AccountID, @ActivityID,  COUNT (*) AS Quantity
FROM [domain].[Requests_ConsultAanvraag]
WHERE Realized>=@RefDate AND Realized<@RefDatePlus
GROUP BY Environment, Realized, AccountID
END

--Specific SupportCases(old)
--IF @ActivityID BETWEEN '1001' AND '1007'
--BEGIN
--INSERT INTO ActivityDaily (Environment, Date, AccountCode, ActivityID, Quantity) 
--SELECT Environment, CreatedDate, AccountCode, @ActivityID,  COUNT (*) AS Quantity
--FROM SupportCases
--WHERE CreatedDate=@RefDate AND Origin = @ActivityDetail 
--GROUP BY Environment, CreatedDate, AccountCode
--END

--Specific SupportCases(new)
IF @ActivityID BETWEEN '1001' AND '1007'
BEGIN
INSERT INTO domain.ActivityDaily (Environment, Date, AccountID, AccountCode, ActivityID, Quantity) 
SELECT CASE [Environment]
			WHEN 'GB' 
			THEN 'UK' 
			ELSE [Environment] END AS Environment, [Opened Date], AccountID, AccountCode, @ActivityID,  COUNT (*) AS Quantity
FROM domain.SupportCases_Salesforce 
WHERE [Opened Date]=@RefDate AND [Origin] = @ActivityDetail AND [Type] IN ('EOL Lite Support Request', 'EOL Support Issue', 'Exact Go Support')
GROUP BY Environment, [Opened Date], AccountID, AccountCode
END

--Cancellation requests
IF @ActivityID='12'
BEGIN
INSERT INTO domain.ActivityDaily (Environment, Date, AccountID, ActivityID, Quantity) 
SELECT CASE [Environment]
			WHEN 'GB' 
			THEN 'UK' 
			ELSE [Environment] END AS Environment, Created, AccountID, @ActivityID,  COUNT (*) AS Quantity
FROM [domain].[Requests_CancellationRequest]
WHERE Created>=@RefDate AND Created<@RefDatePlus AND [Full cancellation]='1'
GROUP BY Environment, Created, AccountID
END
GO
