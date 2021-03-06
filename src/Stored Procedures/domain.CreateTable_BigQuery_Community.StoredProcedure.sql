USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_BigQuery_Community]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_BigQuery_Community]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_BigQuery_Community]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_BigQuery_Community]

AS
BEGIN

-- =========================================================================
-- Author:		Alex Green
-- Create date: 03-12-2015
-- Description:	Creates the Accountants Accounts support table
-- =========================================================================

IF OBJECT_ID (N'CustomerIntelligence.domain.BigQuery_Community', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.BigQuery_Community

CREATE TABLE CustomerIntelligence.domain.BigQuery_Community
(	
	UserID uniqueidentifier NOT NULL,
	AccountID uniqueidentifier NULL,
	FullName NVARCHAR(128) NULL,
	Date Date NULL,
	PathLevel1 NVARCHAR(MAX) NULL,
	PathLevel3 NVARCHAR(MAX) NULL,
	PathLevel4 NVARCHAR(MAX) NULL,
	HitNumber bigint NULL
)

END
GO
