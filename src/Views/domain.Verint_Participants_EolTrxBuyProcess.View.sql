USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Verint_Participants_EolTrxBuyProcess]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Verint_Participants_EolTrxBuyProcess]
GO
/****** Object:  View [domain].[Verint_Participants_EolTrxBuyProcess]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [domain].[Verint_Participants_EolTrxBuyProcess]
AS
SELECT *
From raw.Verint_Participants_EolTrxBuyProcess
GO
