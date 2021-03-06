USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_ExecuteTransferRequest]    Script Date: 21-Dec-18 10:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ALex Green
-- Create date: 2017-09-01
-- Description:
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_ExecuteTransferRequest]

AS
BEGIN

TRUNCATE TABLE domain.Requests_ExecuteTransferRequest

INSERT INTO domain.Requests_ExecuteTransferRequest
(
[RequestID] ,
[Created] ,
[Realized] ,
[Status] ,
[HID]  ,
[TypeDescription] ,
[RequestComments] ,
[ExistingAccountID] ,
[NewAccountID]  ,
[ContactID] ,
[RelatedRequest] ,
[Description] ,
[CIGCopyTime] ,
[Environment] ,
[Processed],
RequestCode 
)

SELECT
	[ID],
	[syscreated],
	[Realized],
	[Status],
	[HID],
	[TypeDescription],
	[RequestComments] ,
	[Account],
	[FreeGuidField_01],
	[Contact],
	[FreeGuidField_02],
	[Description],
	[CIGCopyTime],
	[Environment],
	[Processed],
	RequestCode

FROM (
		SELECT
			[ID],
			[syscreated],
			[Realized],
			[Status],
			[HID],
			[TypeDescription],
			[RequestComments] ,
			[Account],
			[FreeGuidField_01],
			[Contact],
			[FreeGuidField_02],
			[Description],
			[CIGCopyTime],
			[Environment],
			[Processed],
			concat(left(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),2),'.',SUBSTRING(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3,3),'.',right(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3)) as RequestCode
			, ROW_NUMBER() OVER (Partition by ID ORDER BY CIGCopyTime DESC) as RowNumber
	FROM raw.HOST_CIG_Requests
	WHERE HID='14016' ) A
WHERE A.RowNumber='1'
END
