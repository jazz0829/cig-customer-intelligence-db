USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_CustomerSubscriptionStatistics]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_CustomerSubscriptionStatistics]
GO
/****** Object:  StoredProcedure [domain].[Load_CustomerSubscriptionStatistics]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-04-24
-- Description:	Load procedure CustomerSubscriptionStatistics
-- =============================================
CREATE PROCEDURE [domain].[Load_CustomerSubscriptionStatistics] 

AS
BEGIN
TRUNCATE TABLE domain.CustomerSubscriptionStatistics
INSERT INTO domain.CustomerSubscriptionStatistics 
	(
	[CustomerSubscriptionStatisticID], 
	[AccountID], 
	[Type], 
	[Package], 
	[ResellerID], 
	[AccountantID], 
	[UseSimpleWizard], 
	[CampaignName], 
	[CampaignSource], 
	[CampaignMedium], 
	[CampaignTerm], 
	[CampaignContent], 
	[syscreated], 
	[syscreator], 
	[Endorsement], 
	[CampaignReferrer], 
	[CampaignSpecifics], 
	[CIGCopyTime], 
	[Environment], 
	[CIGProcessed], 
	[Source]
	--[GoogleClientID]
	)
SELECT 
	[ID]
      ,[Account]
      ,[Type]
      ,[Package]
      ,[Reseller]
      ,[Accountant]
      ,[UseSimpleWizard]
      ,[CampaignName]
      ,[CampaignSource]
      ,[CampaignMedium]
      ,[CampaignTerm]
      ,[CampaignContent]
      ,[syscreated]
      ,[syscreator]
      ,[Endorsement]
      ,[CampaignReferrer]
      ,[CampaignSpecifics]
      ,[CIGCopyTime]
      ,[Environment]
      ,[CIGProcessed]
      ,[Source]
     -- ,[GoogleClientID]
FROM 
		(
		SELECT 
			*,
			ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CIGCopyTime DESC) as RowNumber
		FROM raw.HOST_CIG_CustomerSubscriptionStatistics
		) SUB
WHERE SUB.RowNumber='1'
			
END
GO
