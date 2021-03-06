USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_CustomerProgress]    Script Date: 21-Dec-18 10:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_CustomerProgress]
AS
BEGIN

TRUNCATE TABLE domain.Requests_CustomerProgress

INSERT INTO domain.Requests_CustomerProgress
(
	[RequestID], 
	[Created],
	[Modified],
	[Realized],
	[Approved],
	[StatusChanged],
	Status, 

	HID, 
	TypeDescription, 
	AccountID, 
	ContactID, 
	Description, 
	RequestComments, 
	WorkflowComments, 
	[Basic setup], 
	Apps, 
	[Setup master data], 
	[Match customer/solution], 
	[Action date], 
	EndDate, 
	[New action], 
	[Start profile], 
	[End profile], 
	[Effort %], 
	[Contract value], 
	[Go-live date], 
	[Onboarded by AMT?], 
	[Sweetspot customer?], 
	Sector, 
	[Classification 1], 
	[Classification 2], 
	[Classification 3], 
	CIGCopyTime, 
	Environment, 
	Processed,
	UserID,
	ConsultancyRequestID,
	DocumentID,
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
	[FreeBoolField_04],
	[FreeTextField_02],
	[FreeTextField_04],
	[StartDate],
	[EndDate],
	[FreeTextField_06],
	[FreeTextField_07],
	[FreeTextField_08],
	[FreeTextField_09],
	[FreeNumberField_01],
	[FreeDateField_01],
	[FreeBoolField_01],
	[FreeBoolField_02],
	[FreeTextField_01],
	[FreeTextField_13],
	[FreeTextField_14],
	[FreeTextField_15],
	[CIGCopyTime],
	[Environment],
	[Processed],
	UserID,
	FreeGuidField_01,
	Document AS DocumentID,
	RequestCode
	--,[syscreated],
	--[syscreator],
	--[sysmodified],
	--[sysmodifier],
	--[Hours]
	--,[Days]
	--,[StartDateActual]
	--,[EndDateActual]
	--,[HoursActual]
	--,[DaysActual]
	--,[Amount]
	--,[Currency]
	--,[AmountFC]
	--,[AmountActual]
	--,[CurrencyActual]
	--,[AmountFCActual]
	--,[Employee]
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
		[FreeBoolField_04],
		[FreeTextField_02],
		[FreeTextField_04],
		[StartDate],
		[EndDate],
		[FreeTextField_06],
		[FreeTextField_07],
		[FreeTextField_08],
		[FreeTextField_09],
		[FreeNumberField_01],
		[FreeDateField_01],
		[FreeBoolField_01],
		[FreeBoolField_02],
		[FreeTextField_01],
		[FreeTextField_13],
		[FreeTextField_14],
		[FreeTextField_15],
		[CIGCopyTime],
		[Environment],
		[Processed],
		UserID,
		FreeGuidField_01,
		Document,
		concat(left(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),2),'.',SUBSTRING(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3,3),'.',right(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3)) as RequestCode
		--,[syscreated],
		--[syscreator],
		--[sysmodified],
		--[sysmodifier],
		--[Hours]
		--,[Days]
		--,[StartDateActual]
		--,[EndDateActual]
		--,[HoursActual]
		--,[DaysActual]
		--,[Amount]
		--,[Currency]
		--,[AmountFC]
		--,[AmountActual]
		--,[CurrencyActual]
		--,[AmountFCActual]
		--,[Employee]
		, ROW_NUMBER() OVER (Partition by ID ORDER BY CIGCopyTime DESC) as RowNumber
	FROM raw.HOST_CIG_Requests
	WHERE HID='8407' ) A
WHERE A.RowNumber='1'
END
