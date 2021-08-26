USE [CustomerIntelligence]
GO

/****** Object:  View [domain].[CreditControl_Requestoverview]    Script Date: 25-Oct-18 21:34:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- ===============================================================================================================================================
-- Author:		Levon GOCERYAN
-- Create date: 15/10/2018
-- Description:	Creates a view of the [raw].[HOST_CIG_Requests] table. This selection of requests is needed to improve reporting for credit control 
-- ===============================================================================================================================================



-- CREATES THE NEW VIEW OF THE TABLE
ALTER VIEW [domain].[CreditControl_Requestoverview]

AS

SELECT  
  a.AccountCode
 ,[Description]
 ,[TypeDescription]
 ,[FreeTextField_07] as [Reason] 
 ,[FreeTextField_01] as [Credit invoice number]
 ,[FreeTextField_02] as [Internal Subject] 
 ,P1.[syscreated]
 ,b.FullName as [Created by]
 ,P1.sysmodified 
 ,c.FullName as [Modified by] 
 ,[Approved]
 ,d.FullName as [Approved by] 
 ,Processed
 ,e.FullName as [Processed by] 
 ,Realized
 ,f.FullName as [Realized by]
 ,p1.EndDate
 ,[EndDateActual]
 ,Amount
 ,AmountActual
 ,Division
 ,[FreeTextField_03]
 ,p1.Environment
 ,CASE WHEN HadCommContract = 1 THEN 'Commercial' Else 'Not Commercial' END AS [Customer Status] 
 ,CASE WHEN [Status] = 5 THEN 'Rejected' 
       WHEN [Status] = 20 THEN 'Open' 
       WHEN [Status] = 30 THEN 'Approved' 
       WHEN [Status] = 40 THEN 'Realized' 
	   WHEN [Status] = 50 THEN 'Processed' 
	   End as [Request status] 

from (
 SELECT ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RowNumber
      ,[Status]
      ,[ID]
      ,[HID]
      ,[TypeDescription]
      ,[Account]
      ,[Contact]
      ,[Description]
      ,[RequestComments]
      ,[WorkflowComments]
      ,[FreeBoolField_01]
      ,[FreeBoolField_03]
      ,[FreeBoolField_04]
      ,[FreeNumberField_01]
      ,[FreeIntField_01]
      ,[FreeTextField_01]
      ,[FreeTextField_02]
      ,[FreeTextField_03]
      ,[FreeTextField_10]
      ,[FreeTextField_13]
      ,[FreeTextField_14]
      ,[CIGCopyTime]
      ,[Environment]
      ,[CIGProcessed]
      ,[FreeBoolField_02]
      ,[FreeBoolField_05]
      ,[FreeIntField_02]
      ,[FreeIntField_03]
      ,[FreeIntField_04]
      ,[FreeTextField_04]
      ,[FreeTextField_05]
      ,[FreeTextField_06]
      ,[FreeTextField_07]
      ,[FreeTextField_08]
      ,[FreeTextField_09]
      ,[FreeTextField_11]
      ,[FreeTextField_12]
      ,[FreeTextField_15]
      ,[Item_1]
      ,[FreeDateField_01]
      ,[FreeDateField_02]
      ,[FreeDateField_03]
      ,[FreeDateField_04]
      ,[FreeDateField_05]
      ,[FreeGuidField_01]
      ,[FreeGuidField_02]
      ,[FreeGuidField_03]
      ,[StartDate]
      ,[EndDate]
      ,[Type]
      ,[UserID]
      ,[Hours]
      ,[Days]
      ,[StartDateActual]
      ,[EndDateActual]
      ,[HoursActual]
      ,[DaysActual]
      ,[Amount]
      ,[AmountFC]
      ,[AmountActual]
      ,[CurrencyActual]
      ,[AmountFCActual]
      ,[Employee]
      ,[Quantity_1]
      ,[QuantityActual_1]
      ,[ItemNumber_1]
      ,[Document]
      ,[Item_2]
      ,[Quantity_2]
      ,[QuantityActual_2]
      ,[ItemNumber_2]
      ,[HelpFile]
      ,[Buildup]
      ,[FinancialEntry]
      ,[YourRef]
      ,[Project]
      ,[Approver]
      ,[Approved]
      ,[Processor]
      ,[Realizer]
      ,[Realized]
      ,[StatusChanged]
      ,[Priority]
      ,[SecurityLevel]
      ,[Division]
      ,[Reminder]
      ,[Location]
      ,[ResubmitStatus]
      ,[XBRLDocument]
      ,[HelpItem]
      ,[Opportunity]
      ,[Lead]
      ,[PayrollComponent]
      ,[PayrollYear]
      ,[PayrollPeriod]
      ,[MultipleEntryID]
      ,[MultipleEntryCols]
      ,[Campaign]
      ,[ErrorLogID]
      ,[FreeNumberField_02]
      ,[FreeNumberField_03]
      ,[FreeNumberField_04]
      ,[FreeNumberField_05]
      ,[FreeIntField_05]
      ,[FreeGuidField_04]
      ,[FreeGuidField_05]
      ,[FreeGuidField_06]
      ,[FreeGuidField_07]
      ,[FreeGuidField_08]
      ,[FreeGuidField_09]
      ,[FreeGuidField_10]
      ,[Message]
      ,[PayrollPeriodFrequency]
      ,[SubStatus]
      ,[ProjectWBS]
      ,[RequestHID]
      ,[Currency]
      ,[Processed]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
  FROM [raw].[HOST_CIG_Requests]
  WHERE HID in ('14017','1021','8444','1021','1008','1212','1210') 
  ) AS P1  
    JOIN [domain].[AccountsContract_Summary] a ON P1.Account = a.AccountID
    JOIN [domain].[Users] b ON P1.syscreator = b.UserID
	JOIN [domain].[Users] c ON P1.sysmodifier = c.UserID
	LEFT JOIN [domain].[Users] d ON P1.Approver = d.UserID
	LEFT JOIN [domain].[Users] e ON P1.Processor = e.UserID
	LEFT JOIN [domain].[Users] f ON P1.Realizer = f.UserID
  WHERE RowNumber = '1'


GO


