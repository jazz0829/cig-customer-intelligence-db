USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Contacts]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Contacts]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Contacts]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_Contacts]

AS
BEGIN

-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 12/12/2016
-- Description:	This procedure drops the previous version of the Contacts table and rebuilds it. 
--				The domain.Contacts table contains a slightly modified version of the raw BlockingStatus table from EOL. 
-- =====================================================================================================================================================================


IF OBJECT_ID (N'CustomerIntelligence.domain.Contacts', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.[domain].Contacts

CREATE TABLE CustomerIntelligence.[domain].Contacts
(
	[ContactID] [uniqueidentifier] NOT NULL,
	[PersonID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,	
	[DivisionCode] [int] NOT NULL,
	[JobTitleDescription] [nvarchar](60) NULL ,	
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,	
	[IsMailingExcluded] [tinyint] NOT NULL,
	[IsUXParticipant] [tinyint] NOT NULL,
	[Environment] [nchar](3) NULL,
	[syscreated] [datetime] NOT NULL,	
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[CIGCopyTime] [datetime] NULL

)

CREATE CLUSTERED INDEX IX_PersonID ON CustomerIntelligence.[domain].Contacts (PersonID) ;

END
GO
