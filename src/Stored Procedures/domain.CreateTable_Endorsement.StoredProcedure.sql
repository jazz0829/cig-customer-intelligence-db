USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Endorsement]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Endorsement]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Endorsement]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Endorsement] 
	-- Add the parameters for the stored procedure here
	@p1 int = 0, 
	@p2 int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @p1, @p2
END
GO
