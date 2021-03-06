USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[RunDaily_Requests]    Script Date: 12-Oct-18 16:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 09-03-2017
-- Description:	Run Daily master procedure to run al the load procedures for the requests
-- =============================================
ALTER PROCEDURE [domain].[RunDaily_Requests] 
AS
BEGIN

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_AutomaticPriceAgreement', 'Start')
	EXEC domain.Load_Requests_AutomaticPriceAgreement
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_AutomaticPriceAgreement', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_Cancellation', 'Start')
	EXEC domain.Load_Requests_Cancellation
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_Cancellation', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_Complaint', 'Start')
	EXEC domain.Load_Requests_Complaint
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_Complaint', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_ConsultAanvraag', 'Start')
	EXEC domain.Load_Requests_ConsultAanvraag
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_ConsultAanvraag', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_ContractChange', 'Start')
	EXEC domain.Load_Requests_ContractChange
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_ContractChange', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_Conversion', 'Start')
	EXEC domain.Load_Requests_Conversion
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_Conversion', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_CreditInvoice', 'Start')
	EXEC domain.Load_Requests_CreditInvoice
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_CreditInvoice', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_CustomerComplaint', 'Start')
	EXEC domain.Load_Requests_CustomerComplaint
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_CustomerComplaint', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_CustomerProgress', 'Start')
	EXEC domain.Load_Requests_CustomerProgress
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_CustomerProgress', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_DefinitiefAbonnement', 'Start')
	EXEC domain.Load_Requests_DefinitiefAbonnement
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_DefinitiefAbonnement', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_Enablement', 'Start')
	EXEC domain.Load_Requests_Enablement
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_Enablement', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_Endorsement', 'Start')
	EXEC domain.Load_Requests_Endorsement
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_Endorsement', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_OutstandingProductIssue', 'Start')
	EXEC domain.Load_Requests_OutstandingProductIssue
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_OutstandingProductIssue', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_PartialCancellation', 'Start')
	EXEC domain.Load_Requests_PartialCancellation
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_PartialCancellation', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_PriceAgreement', 'Start')
	EXEC domain.Load_Requests_PriceAgreement
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_PriceAgreement', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_WelcomeCall', 'Start')
	EXEC domain.Load_Requests_WelcomeCall
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_WelcomeCall', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_TransferRequest', 'Start')
	EXEC domain.Load_Requests_TransferRequest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_TransferRequest', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_ExecuteTransferRequest', 'Start')
	EXEC domain.Load_Requests_ExecuteTransferRequest
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_ExecuteTransferRequest', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_CustomerCare', 'Start')
	EXEC domain.Load_Requests_CustomerCare
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_CustomerCare', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_SalesCommunicationNote', 'Start')
	EXEC domain.Load_Requests_SalesCommunicationNote
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_SalesCommunicationNote', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_CancellationDowngrade_ImmediateEffect', 'Start')
	EXEC domain.Load_Requests_CancellationDowngrade_ImmediateEffect
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_CancellationDowngrade_ImmediateEffect', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_AdministrativeQuestion', 'Start')
	EXEC domain.Load_Requests_AdministrativeQuestion
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_AdministrativeQuestion', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_AskQuestionAboutInvoice', 'Start')
	EXEC domain.Load_Requests_AskQuestionAboutInvoice
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_AskQuestionAboutInvoice', 'End')


INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_RequestTrialModules', 'Start')
	EXEC domain.Load_Requests_RequestTrialModules
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'Requests_RequestTrialModules', 'End')


END


