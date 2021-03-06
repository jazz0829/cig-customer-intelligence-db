USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_App]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_App]
GO
/****** Object:  StoredProcedure [domain].[Load_App]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 -- =============================================
-- Author:		Jennifer Vink
-- Create date: 2016-10-04
-- Description:	Load procedure with information about the apps
-- =============================================
CREATE PROCEDURE [domain].[Load_App]
AS
BEGIN

TRUNCATE TABLE domain.App

INSERT INTO domain.App(Environment, App, AppName, Partner, PartnerCode, Category)
SELECT
		DISTINCT (CASE Environment
		WHEN 'GB'
		THEN 'UK'
		ELSE Environment END),
		App AS AppID,
		AppName,
		Partner AS PartnerID,
		PartnerCode,
		CASE
		WHEN AppName LIKE '%Magento%'
			OR AppName LIKE '%Webshop%'
			OR AppName LIKE '%Mijnwebwinkel%'
			OR AppName LIKE '%Prestashop%'
			OR AppName LIKE '%Shopify%'
			OR AppName LIKE '%OpenCart%'
			OR AppName LIKE '%SEOshop%'
		THEN 'Webshop'
		WHEN AppName LIKE '%BaseCone%'
			OR AppName LIKE '%Scan%'
			OR AppName LIKE '%ImageCapture%'
			OR AppName LIKE '%Storecove%'
		THEN 'Scan'
		WHEN AppName LIKE '%Loket%'
			OR AppName LIKE '%Nmbrs%'
		THEN 'Payroll'
		WHEN AppName LIKE '%VisionPlanner%'
			OR AppName LIKE '%Beegua%'
			OR AppName LIKE '%Analys%'
		THEN 'Dashboard'
		END AS Category

FROM [raw].[DW_MonthlyAppUsage]

END
GO
