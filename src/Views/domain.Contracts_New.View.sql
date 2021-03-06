USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Contracts_New]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Contracts_New]
GO
/****** Object:  View [domain].[Contracts_New]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [domain].[Contracts_New]
AS SELECT [ID]
      ,[Number]
      ,[Account]
      ,[Type]
      ,[StartDate]
      ,[ContractEvent]
      ,[EndDate]
      ,[FinalDate]
      ,[CancellationDate]
      ,[CancellationEvent]
      ,[CIGCopyTime]
      ,[Environment]
      ,[CIGProcessed]
      ,[TimeUnit]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
  FROM [CustomerIntelligence].[raw].[Contracts]
GO
