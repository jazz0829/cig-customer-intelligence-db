USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Accounts_Hosting]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Accounts_Hosting]
GO
/****** Object:  View [domain].[Accounts_Hosting]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [domain].[Accounts_Hosting] AS
Select *
From raw.Accounts
GO
