USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_CustomerCare]    Script Date: 21-Dec-18 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-11-28
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_CustomerCare]
AS
BEGIN

TRUNCATE TABLE domain.Requests_CustomerCare

INSERT INTO domain.Requests_CustomerCare
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

	[Subject],
	[Follow up by],
	[Next action date],
	[NPS score],
	[NPS status],
	[Churn risk],
	[Training followed],
	[Complaint request],
	[Project],
	[Consultancy request],
	[Apps in use],
	[Responsible for sales at that time],
	[MRR value during call],

	[CIGCopyTime],
	[Environment],
	[Processed],
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

	FreeTextField_01,
	[UserID],
	[EndDate],
	[FreeTextField_02],
	[FreeTextField_03],
	FreeTextField_04,
	FreeTextField_05,
	FreeGuidField_03,
	Project,
	FreeGuidField_02,
	FreeBoolField_04,
	FreeGuidField_01,
	FreeNumberField_01,

	[CIGCopyTime],
	[Environment],
	[Processed],
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

		FreeTextField_01,
		[UserID],
		[EndDate],
		[FreeTextField_02],
		[FreeTextField_03],
		FreeTextField_04,
		FreeTextField_05,
		FreeGuidField_03,
		Project,
		FreeGuidField_02,
		FreeBoolField_04,
		FreeGuidField_01,
		FreeNumberField_01,
		[CIGCopyTime],
		[Environment],
		[Processed],
		concat(left(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),2),'.',SUBSTRING(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3,3),'.',right(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3)) as RequestCode


		, ROW_NUMBER() OVER (Partition by ID ORDER BY CIGCopyTime DESC) as RowNumber
	FROM raw.HOST_CIG_Requests
	WHERE HID='8410' ) A
WHERE A.RowNumber='1'
END
