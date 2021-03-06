USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_CreditInvoice]    Script Date: 21-Dec-18 10:20:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_CreditInvoice]

AS
BEGIN

TRUNCATE TABLE domain.Requests_CreditInvoice

INSERT INTO domain.Requests_CreditInvoice
(
	[RequestID],
	[Created],
	[Modified],
	[Realized],
	[Approved],
	[StatusChanged],
	[Status],

	[HID],
	[TypeDescription],
	[AccountID],
	[ContactID],
	[Description],
	[RequestComments],
	[WorkflowComments],
	[Entry information],
	[Original invoice number],
	[Original invoice date],
	[Credit invoice date],
	[Original invoice blocked],
	[Reason],
	[Related account],
	[Related request],
	[Realize information],
	[Credit invoice number],
	[New debit invoice number],
	[Process information],
	[Revenue category],
	[CIGCopyTime],
	[Environment],
	[Processed],
	[Amount],
    [Amount Realized],
	RequestCode
)

SELECT 
	[ID],
	[syscreated],
	[sysmodified],
	[Realized],
	[Approved],
	[StatusChanged],
	[Status],

	[HID],
	[TypeDescription],
	[Account],
	[Contact],
	[Description],
	[RequestComments],
	[WorkflowComments],
	[FreeTextField_12],
	[FreeTextField_05],
	[StartDate],
	[EndDate],
	[FreeTextField_06],
	[FreeTextField_07],
	[FreeGuidField_02],
	[FreeGuidField_01],
	[FreeTextField_14],
	[FreeTextField_01],
	[FreeTextField_02],
	[FreeTextField_15],
	[FreeTextField_03],
	[CIGCopyTime],
	[Environment],
	[Processed],
    [Amount],
	[AmountActual],
	RequestCode

FROM (
		SELECT 
		[syscreated],
		[sysmodified],
		[Realized],
		[Approved],
		[StatusChanged],
		[Status],
		[ID],
		[HID],
		[TypeDescription],
		[Account],
		[Contact],
		[Description],
		[RequestComments],
		[WorkflowComments],
		[FreeTextField_12],
		[FreeTextField_05],
		[StartDate],
		[EndDate],
		[FreeTextField_06],
		[FreeTextField_07],
		[FreeGuidField_02],
		[FreeGuidField_01],
		[FreeTextField_14],
		[FreeTextField_01],
		[FreeTextField_02],
		[FreeTextField_15],
		[FreeTextField_03],
		[CIGCopyTime],
		[Environment],
		[Processed],
		[Amount],
        [AmountActual],
		concat(left(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),2),'.',SUBSTRING(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3,3),'.',right(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3)) as RequestCode
		, ROW_NUMBER() OVER (Partition by ID ORDER BY CIGCopyTime DESC) as RowNumber
	FROM raw.HOST_CIG_Requests
	WHERE HID='1212' ) A
WHERE A.RowNumber='1'
END
