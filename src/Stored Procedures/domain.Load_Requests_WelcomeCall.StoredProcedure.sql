USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_WelcomeCall]    Script Date: 21-Dec-18 10:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_WelcomeCall]
AS
BEGIN

TRUNCATE TABLE domain.Requests_WelcomeCall

INSERT INTO domain.Requests_WelcomeCall
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
	[-], 
	Reached, 
	[Accountancy profile], 
	Welcome, 
	[Accountancy program], 
	[Login data], 
	[Help tools], 
	[Account information], 
	[My Exact Online], 
	[Account manager], 
	Tips, 
	[--], 
	[Related question], 
	StartDate, 
	[Action date], 
	CIGCopyTime, 
	Environment, 
	Processed,
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
	[FreeTextField_14],
	[FreeTextField_01],
	[FreeTextField_06],
	[FreeTextField_02],
	[FreeTextField_07],
	[FreeTextField_03],
	[FreeTextField_08],
	[FreeTextField_04],
	[FreeTextField_09],
	[FreeTextField_05],
	[FreeTextField_10],
	[FreeTextField_15],
	[FreeGuidField_01],
	[StartDate],
	[EndDate],
	[CIGCopyTime],
	[Environment],
	[Processed],
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
	--,RowNumber
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
		[FreeTextField_14],
		[FreeTextField_01],
		[FreeTextField_06],
		[FreeTextField_02],
		[FreeTextField_07],
		[FreeTextField_03],
		[FreeTextField_08],
		[FreeTextField_04],
		[FreeTextField_09],
		[FreeTextField_05],
		[FreeTextField_10],
		[FreeTextField_15],
		[FreeGuidField_01],
		[StartDate],
		[EndDate],
		[CIGCopyTime],
		[Environment],
		[Processed],
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
	WHERE HID='6678' ) A
WHERE A.RowNumber='1'
END
