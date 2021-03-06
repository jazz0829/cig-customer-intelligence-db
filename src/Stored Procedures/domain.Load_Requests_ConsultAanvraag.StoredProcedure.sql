USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_ConsultAanvraag]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Requests_ConsultAanvraag]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_ConsultAanvraag]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:
-- =============================================
CREATE PROCEDURE [domain].[Load_Requests_ConsultAanvraag]
AS
BEGIN

TRUNCATE TABLE domain.Requests_ConsultAanvraag

INSERT INTO domain.Requests_ConsultAanvraag
(
	[RequestID],
	[ProjectID],
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
	[Remark],
	[-],
	[--],
	[ItemID],
	[Number of days],
	[Consultancy done by],
	[Price agreement],
	[Sales],
	[StartDate],
	[EndDate],
	[Internal remark],
	[Consultancy dag 1],
	[Contact person],
	[Email],
	[Telephone number],
	[Accountant involved],
	[Key-users],
	[Current solution],
	[Training planned],
	[Conversion],
	[Import files?],
	[Particularities getting started],
	[Particularities process],
	[Apps linked],
	[CIGCopyTime],
	[Environment],
	[Processed],
	[Amount],
	[UserID],
	[RequestHID]
)

SELECT
	[ID],
	[Project] AS ProjectID,
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
	[FreeTextField_01],
	[FreeTextField_02],
	[FreeTextField_03],
	[Item_1],
	[FreeNumberField_01],
	[FreeGuidField_03],
	[FreeGuidField_01],
	[FreeGuidField_02],
	[StartDate],
	[EndDate],
	[FreeTextField_11],
	[FreeDateField_02],
	[FreeTextField_04],
	[FreeTextField_15],
	[FreeIntField_01],
	[FreeTextField_05],
	[FreeTextField_06],
	[FreeTextField_07],
	[FreeTextField_08],
	[FreeTextField_09],
	[FreeTextField_10],
	[FreeTextField_12],
	[FreeTextField_13],
	[FreeTextField_14],
	[CIGCopyTime],
	[Environment],
	[Processed],
	[Amount],
	[UserID],
	[RequestHID]
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
			[FreeTextField_01],
			[FreeTextField_02],
			[FreeTextField_03],
			[Item_1],
			[FreeNumberField_01],
			[FreeGuidField_03],
			[FreeGuidField_01],
			[FreeGuidField_02],
			[StartDate],
			[EndDate],
			[FreeTextField_11],
			[FreeDateField_02],
			[FreeTextField_04],
			[FreeTextField_15],
			[FreeIntField_01],
			[FreeTextField_05],
			[FreeTextField_06],
			[FreeTextField_07],
			[FreeTextField_08],
			[FreeTextField_09],
			[FreeTextField_10],
			[FreeTextField_12],
			[FreeTextField_13],
			[FreeTextField_14],
			[CIGCopyTime],
			[Environment],
			[Processed],
			[Amount],
			[UserID],
			[Project],
			[RequestHID]
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
		WHERE HID='8406' ) A
WHERE A.RowNumber='1'
END
GO
