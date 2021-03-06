USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_LinkedAccountantLog]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_LinkedAccountantLog]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_LinkedAccountantLog]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_LinkedAccountantLog]

AS
BEGIN

-- ==================================================================================================================================================
-- Author:		Alex Green
-- Create date: 08-02-2016
-- Description:	Creates the table in which any changes to a customer's linked accountant are logged. Only changes that occurred from 9 February 2016
--				or later are recorded.
-- ==================================================================================================================================================


CREATE TABLE CustomerIntelligence.domain.LinkedAccountantLog
(	
	Environment NCHAR(3)  NOT NULL ,
	AccountCode NVARCHAR(18) NOT NULL ,
	LinkStatus NVARCHAR(30) NULL ,
	Date DATE ,
	NewAccountantCode NVARCHAR(18) NULL ,
	PreviousAccountantCode NVARCHAR(18) NULL 
)

END

GO
