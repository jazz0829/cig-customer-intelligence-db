USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[BigQuery_Community]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[BigQuery_Community]
GO
/****** Object:  View [domain].[BigQuery_Community]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [domain].[BigQuery_Community] AS
SELECT
	(U.UserID__c) AS UserID
	, U.ExactIDAccount__c AS AccountID
	, Users.FullName
	, DATEADD(mi, DATEDIFF(mi, GETUTCDATE(), GETDATE()),DateAdd(MS,hits_time,CAST(DATEADD(S, [visitStartTime], '1970-01-01') AS Datetime))) AS [Date]  -- Converts the visitStartTime field into a usable datetime.
	, REPLACE(hits_page_pagePathLevel1,'/','') AS PathLevel1
	, REPLACE(hits_page_pagePathLevel3,'/','') AS PathLevel3
	, CASE 
		WHEN hits_page_pagePathLevel3='/search/' THEN REPLACE(hits_page_pagePathLevel4,'/All/Home/','') 
		WHEN hits_page_pagePathLevel3='/article/' THEN LTRIM(REPLACE(REPLACE(REPLACE(SUBSTRING(hits_page_pagePathLevel4, CHARINDEX('-HNO-', hits_page_pagePathLevel4), LEN(hits_page_pagePathLevel4)), '', ''),'-',' '),'HNO',''))
		WHEN hits_page_pagePathLevel3='/case/' THEN REPLACE(REPLACE(hits_page_pagePathLevel4,'/Case/',''),'/','')
		WHEN hits_page_pagePathLevel3='/group/' THEN REPLACE(hits_page_pagePathLevel4,'/CollaborationGroup/','') 
		WHEN hits_page_pagePathLevel3='/question/' THEN REPLACE(hits_page_pagePathLevel4,'/','') 
		WHEN hits_page_pagePathLevel3='/community/' THEN REPLACE(hits_page_pagePathLevel4,'/','') 
		WHEN hits_page_pagePathLevel3='/topic/' THEN SUBSTRING(REPLACE(hits_page_pagePathLevel4, '/', ''), LEN(hits_page_pagePathLevel4) - CHARINDEX('/',REVERSE(hits_page_pagePathLevel4)), CHARINDEX('/',REVERSE(hits_page_pagePathLevel4)) + 1)
		WHEN hits_page_pagePathLevel3='/profile/' THEN REPLACE(hits_page_pagePathLevel4,'/','') 
		ELSE hits_page_pagePathLevel4 END AS [PathLevel4]
	, hits_page_pageTitle AS [PageTitle]
	, hits_hitNumber as [HitNumber]
	, hits_eventInfo_eventAction as [Event]
	, hits_eventInfo_eventLabel as [EventLabel]
	, hits_eventInfo_eventCategory AS [EventCategory]

FROM [raw].[BigQuery_Salesforce] BQ
INNER JOIN 
	( 
		SELECT
			Id
			, CONVERT( uniqueidentifier, RTRIM(LTRIM(UserID__c))) AS UserID__c		-- Try convert required to return a NULL for values that cannot be converted to unique identifier. This is needed instead of a WHERE statement as the query optimizer was changing the order of the WHERE statement to run it after the regular cast/convert, resulting in an error.
			, UPPER(ExactIDAccount__c) AS ExactIDAccount__c
		FROM [raw].[Salesforce_User_Latest] 		
	) U
	ON BQ.userIdLong = U.Id

INNER JOIN domain.Users
	ON U.UserID__c = Users.UserID

WHERE
	 --U.UserID__c IS NOT NULL AND
			-- Excludes the Salesforce user records that could not be converted into a unique identifier
	 hits_page_pagePathLevel4 NOT LIKE '/ka%' AND [hits_page_pageTitle] <> 'Article Detail'
	AND hits_CustomDimensions_value='Customer' AND CustomDimensions_value='Customer'

Group by UserID__c, ExactIDAccount__c,hits_time, [visitStartTime], date,[hits_minute], hits_page_pagePathLevel1, hits_page_pagePathLevel2, hits_page_pagePathLevel3, hits_page_pagePathLevel4, FullName, hits_hitNumber, hits_page_pageTitle, hits_eventInfo_eventAction, hits_eventInfo_eventLabel, hits_eventInfo_eventCategory
GO
