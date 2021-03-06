USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Activities_Apps]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Activities_Apps]
GO
/****** Object:  StoredProcedure [domain].[Load_Activities_Apps]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[Load_Activities_Apps]
AS
INSERT INTO config.Activities_Apps (ApplicationID,Description,LastUpdatedMonth)
Select ApplicationID, Description, '2017-01-01' AS LastUpdatedMonth
From domain.OAuthClients
WHERE ApplicationID NOT IN (Select ApplicationID FROM config.Activities_Apps)
GO
