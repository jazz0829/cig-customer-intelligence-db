USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_Activities]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_CustomerProfile_Activities]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_Activities]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_CustomerProfile_Activities]
AS


SELECT *
FROM	
	[config].Activities
GO
