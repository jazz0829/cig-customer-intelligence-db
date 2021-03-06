USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_LiveChatButton]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Salesforce_LiveChatButton]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_LiveChatButton]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [domain].[Load_Salesforce_LiveChatButton] 
AS
BEGIN 
TRUNCATE TABLE domain.Salesforce_LiveChatButton
END
BEGIN

WITH Salesforce_LiveChatButton_Latest
(
		[Id]
      ,[AutoGreeting]
      ,[ChasitorIdleTimeout]
      ,[ChasitorIdleTimeoutWarning]
      ,[ChatPageId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[CustomAgentName]
      ,[DeveloperName]
      ,[HasQueue]
      ,[IsActive]
      ,[IsDeleted]
      ,[Language]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[MasterLabel]
      ,[OptionsHasChasitorIdleTimeout]
      ,[OptionsHasInviteAfterAccept]
      ,[OptionsHasInviteAfterReject]
      ,[OptionsHasRerouteDeclinedRequest]
      ,[OptionsIsAutoAccept]
      ,[OptionsIsInviteAutoRemove]
      ,[OverallQueueLength]
      ,[PerAgentQueueLength]
      ,[RoutingType]
      ,[SkillId]
      ,[SystemModstamp]
      ,[Type]
      ,[WindowLanguage]
      ,[EtlInsertTime],
	  RN
)
AS
(
	SELECT
	 [Id]
      ,[AutoGreeting]
      ,[ChasitorIdleTimeout]
      ,[ChasitorIdleTimeoutWarning]
      ,[ChatPageId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[CustomAgentName]
      ,[DeveloperName]
      ,[HasQueue]
      ,[IsActive]
      ,[IsDeleted]
      ,[Language]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[MasterLabel]
      ,[OptionsHasChasitorIdleTimeout]
      ,[OptionsHasInviteAfterAccept]
      ,[OptionsHasInviteAfterReject]
      ,[OptionsHasRerouteDeclinedRequest]
      ,[OptionsIsAutoAccept]
      ,[OptionsIsInviteAutoRemove]
      ,[OverallQueueLength]
      ,[PerAgentQueueLength]
      ,[RoutingType]
      ,[SkillId]
      ,[SystemModstamp]
      ,[Type]
      ,[WindowLanguage]
      ,[EtlInsertTime],
	  ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
	  FROM [CustomerIntelligence].[raw].[Salesforce_LiveChatButton]
)

INSERT INTO [domain].[Salesforce_LiveChatButton]
	(
		[Id]
      ,[AutoGreeting]
      ,[ChasitorIdleTimeout]
      ,[ChasitorIdleTimeoutWarning]
      ,[ChatPageId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[CustomAgentName]
      ,[DeveloperName]
      ,[HasQueue]
      ,[IsActive]
      ,[IsDeleted]
      ,[Language]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[MasterLabel]
      ,[OptionsHasChasitorIdleTimeout]
      ,[OptionsHasInviteAfterAccept]
      ,[OptionsHasInviteAfterReject]
      ,[OptionsHasRerouteDeclinedRequest]
      ,[OptionsIsAutoAccept]
      ,[OptionsIsInviteAutoRemove]
      ,[OverallQueueLength]
      ,[PerAgentQueueLength]
      ,[RoutingType]
      ,[SkillId]
      ,[SystemModstamp]
      ,[Type]
      ,[WindowLanguage]
      ,[EtlInsertTime]
	)

	SELECT
		[Id]
      ,[AutoGreeting]
      ,[ChasitorIdleTimeout]
      ,[ChasitorIdleTimeoutWarning]
      ,[ChatPageId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[CustomAgentName]
      ,[DeveloperName]
      ,[HasQueue]
      ,[IsActive]
      ,[IsDeleted]
      ,[Language]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[MasterLabel]
      ,[OptionsHasChasitorIdleTimeout]
      ,[OptionsHasInviteAfterAccept]
      ,[OptionsHasInviteAfterReject]
      ,[OptionsHasRerouteDeclinedRequest]
      ,[OptionsIsAutoAccept]
      ,[OptionsIsInviteAutoRemove]
      ,[OverallQueueLength]
      ,[PerAgentQueueLength]
      ,[RoutingType]
      ,[SkillId]
      ,[SystemModstamp]
      ,[Type]
      ,[WindowLanguage]
      ,[EtlInsertTime]
	  FROM Salesforce_LiveChatButton_Latest
	  WHERE RN = 1

END
GO
