USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Opportunities]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Opportunities]
GO
/****** Object:  StoredProcedure [domain].[Load_Opportunities]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================================================================================================================
-- Author:		Alex Green
-- Create date: 13-10-2017
-- Description:	Load Opportunities data from ContractData into the CustomerIntelligence database
--				Original script written by Jennifer Vink. Changed by Alex when data started to be collected from Corporate Datawarehouse 
-- =======================================================================================================================================================
CREATE PROCEDURE [domain].[Load_Opportunities]
AS


TRUNCATE TABLE [domain].Opportunities

INSERT INTO [domain].Opportunities
(
		[ID]
		,[Environment]
		,[AccountName]
		,[AccountCode]
		,[ActionDate]
		,[AmountFC]
		,[AmountDC]
		,[CloseDate]
		,[Created]
		,[Creator]
		,[Modified]
		,[Currency]
		,[Name]
		,[OpportunityStage]
		,[OpportunityStageDescription]
		,[OpportunityStatus]
		,[Probability]
		,[Owner]
		,[OwnerFullName]
		,[RateFC]
		,[LeadSource]
		,[LeadSourceDescription] 
		,[SalesType]
		,[SalesTypeDescription]
		,[ReasonCode]
		,[ReasonCodeDescription]
		,[Notes]
		,[Project]
		,[ProjectCode]
		,[ProjectDescription]
		,[Campaign] 
		,[CampaignDescription]
		,[OpportunityType]
		,[OpportunityTypeDescription]
		,[Channel]
		,[ChannelDescription]
	)
SELECT
		[ID]
		,CASE [COUNTRY]
			WHEN 'GB'
			THEN 'UK'
			ELSE [COUNTRY]
			END AS Environment
		,[AccountName]
		,LTRIM([AccountCode])
		,[ActionDate]
		,[AmountFC]
		,[AmountDC]
		,[CloseDate]
		,[Created]
		,[CREATOR]
		,[Modified]
		,[Currency]
		,[Name]
		,[OPPORTUNITYSTAGE]
		,[OpportunityStageDescription]
		,[OpportunityStatus]
		,[Probability]
		,[OWNER]
		,[OwnerFullName]
		,[RateFC]
		,[LEADSOURCE]
		,[LEADSOURCEDESCRIPTION]
		,[SALESTYPE] 
		,[SalesDescription]
		,[REASONCODE]
		,[ReasonDescription]
		,[NOTES]
		,[Project]
		,[ProjectCode]
		,[ProjectDescription]
		,[CAMPAIGN]
		,[CampaignDescription]
		,[OpportunityType]
		,[OpportunityTypeDescription]
		,[Channel]
		,[ChannelDescription]

FROM [raw].[DW_Opportunities]
WHERE 
	META_LOAD_ENDDTS IS NULL   -- If field is NULL then this means it is an old record
	AND META_ISDELETED = 0	   -- If equal to 1 then this row is one that should be deleted
GO
