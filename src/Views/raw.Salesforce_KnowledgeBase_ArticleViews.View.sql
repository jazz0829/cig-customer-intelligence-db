USE [CustomerIntelligence]
GO
/****** Object:  View [raw].[Salesforce_KnowledgeBase_ArticleViews]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [raw].[Salesforce_KnowledgeBase_ArticleViews]
GO
/****** Object:  View [raw].[Salesforce_KnowledgeBase_ArticleViews]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [raw].[Salesforce_KnowledgeBase_ArticleViews]
AS

SELECT
	DISTINCT(U.UserID__c)
	, U.ExactIDAccount__c
	, Users.FullName
	, CAST(DATEADD(S, [visitStartTime], '1970-01-01') AS DATE) AS [Date]  -- Converts the visitStartTime field into a usable datetime.
	, hits_page_pagePathLevel4
	, SUBSTRING(REPLACE(hits_page_pagePathLevel4, '-', ' '), LEN(hits_page_pagePathLevel4) - CHARINDEX('/',REVERSE(hits_page_pagePathLevel4)) + 2, CHARINDEX('/',REVERSE(hits_page_pagePathLevel4)) + 1) AS ArticleName		-- Parsing of the knowledge base path 
	, hits_hitNumber

FROM [raw].[BigQuery_Salesforce] BQ
INNER JOIN 
	( 
		SELECT
			Id
			, TRY_CONVERT( uniqueidentifier, RTRIM(LTRIM(UserID__c))) AS UserID__c		-- Try convert required to return a NULL for values that cannot be converted to unique identifier. This is needed instead of a WHERE statement as the query optimizer was changing the order of the WHERE statement to run it after the regular cast/convert, resulting in an error.
			, UPPER(ExactIDAccount__c) AS ExactIDAccount__c
		FROM [raw].[Salesforce_User_Latest] 		
	) U
	ON BQ.userIdLong = U.Id

INNER JOIN domain.Users
	ON U.UserID__c = Users.UserID

WHERE 
	hits_page_pagePathLevel3 = '/article/'		-- Selects only Knowledge Base articles
	AND U.UserID__c IS NOT NULL					-- Excludes the Salesforce user records that could not be converted into a unique identifier
		
			
GO
