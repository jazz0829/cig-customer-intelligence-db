USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_CustomerProgressRequest]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_CustomerProfile_CustomerProgressRequest]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_CustomerProgressRequest]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_CustomerProfile_CustomerProgressRequest]
AS


SELECT
	CONCAT(Environment, AccountCode) AS EnviroAccountCode ,
	[ID] ,
	[HID] ,
	[Environment] ,
	[AccountCode] ,
	[AccountName] ,
	[TypeDescription] ,
	[Created] ,
	[StartDate] ,
	[Approved] ,
	[Realized] ,
	[EndDate] ,
	--[Status] ,
	CASE
		WHEN [Status] = '20' THEN 'Open'
		WHEN [Status] = '30' THEN 'Welcome'
		WHEN [Status] = '40' THEN 'Check-up'
		WHEN [Status] = '50' THEN 'Closed'
		ELSE NULL
		END AS [Status] ,
	[Description] ,
	[CreatorFullName] ,
	[UserFullName] 
	, CONCAT('https://start.exactonline.', LOWER(RTRIM(Environment)), '/docs/WflRequest.aspx?BCAction=1&ID=%7b', LOWER(ID), '%7d&_Division_=1') AS Link
FROM 
	domain.CustomerProgressRequest
GO
