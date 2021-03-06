USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_Salesforce]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[RunDaily_Salesforce]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_Salesforce]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-04-19
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[RunDaily_Salesforce] 
AS
BEGIN
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_Raw3Months', 'Start')
	EXEC domain.Load_BigQuery_Community_RawLast3Months
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_Raw3Months', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_Accounts', 'Start')
	EXEC raw.Load_Salesforce_Account_Latest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_Accounts', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_Cases', 'Start')
	EXEC raw.Load_Salesforce_Case_Latest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_Cases', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_CaseComment', 'Start')
	EXEC raw.Load_Salesforce_CaseComment_Latest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_CaseComment', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_Contact', 'Start')
	EXEC raw.Load_Salesforce_Contact_Latest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_Contact', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_RecordType', 'Start')
	EXEC raw.Load_Salesforce_RecordType_Latest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_RecordType', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_User', 'Start')
	EXEC raw.Load_Salesforce_User_Latest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_Community_User', 'End')



INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveAgentsession', 'Start')
	EXEC domain.Load_Salesforce_LiveAgentsession
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveAgentsession', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveChatButton', 'Start')
	EXEC domain.Load_Salesforce_LiveChatButton
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveChatButton', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveChatButtonSkill', 'Start')
	EXEC domain.Load_Salesforce_LiveChatButtonSkill
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveChatButtonSkill', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveChatTranscript', 'Start')
	EXEC domain.Load_Salesforce_LiveChatTranscript
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveChatTranscript', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveChatTranscriptEvent', 'Start')
	EXEC domain.Load_Salesforce_LiveChatTranscriptEvent
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveChatTranscriptEvent', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveChatVisitor', 'Start')
	EXEC domain.Load_Salesforce_LiveChatVisitor
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_LiveChatVisitor', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_SkillProfile', 'Start')
	EXEC domain.Load_Salesforce_SkillProfile
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_SkillProfile', 'End')

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_SkillUser', 'Start')
	EXEC domain.Load_Salesforce_SkillUser
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Salesforce_SkillUser', 'End')
END
GO
