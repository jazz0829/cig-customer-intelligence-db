/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4451)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [CustomerIntelligence]
GO
/****** Object:  UserDefinedFunction [dbo].[Ronald]    Script Date: 30/01/2018 12:06:19 ******/
DROP FUNCTION IF EXISTS [dbo].[Ronald]
GO
/****** Object:  UserDefinedFunction [dbo].[Ronald]    Script Date: 30/01/2018 12:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ronald]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Ronald]
(
	-- Add the parameters for the function here
	@Environment NCHAR (3),
	@AccountID UNIQUEIDENTIFIER
)
RETURNS NVARCHAR  (1000)

AS
BEGIN
	-- Declare the return variable here
	DECLARE @CardURL AS NVARCHAR(1000)

	-- Add the T-SQL statements to compute the return value here
	SELECT @CardURL =
	CONCAT
		(
			CASE 
				WHEN @Environment = ''NL'' THEN ''https://start.exactonline.nl/docs/LicCustomerCard.aspx?AccountID=%7b''
				WHEN @Environment = ''BE'' THEN ''https://start.exactonline.be/docs/LicCustomerCard.aspx?AccountID=%7b''
				WHEN @Environment = ''FR'' THEN ''https://start.exactonline.fr/docs/LicCustomerCard.aspx?AccountID=%7b''
				WHEN @Environment = ''UK'' THEN ''https://start.exactonline.co.uk/docs/LicCustomerCard.aspx?AccountID=%7b''
				WHEN @Environment = ''US'' THEN ''https://start.exactonline.com/docs/LicCustomerCard.aspx?Action=0&AccountID=%7b''
				WHEN @Environment = ''ES'' THEN ''https://start.exactonline.es/docs/LicCustomerCard.aspx?AccountID=%7b''
				WHEN @Environment = ''DE'' THEN ''https://start.exactonline.de/docs/LicCustomerCard.aspx?AccountID=%7b''
				ELSE ''>>>>>>>>>>>>>>>>>'' END
		, LOWER(@AccountID)
		, CASE 
			WHEN @Environment = ''NL'' THEN ''%7d&_Division_=1''
			WHEN @Environment = ''US'' THEN ''%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1''
			WHEN @Environment = ''DE'' THEN ''%7d&_Division_=1''
			WHEN @Environment = ''FR'' THEN ''%7d&_Division_=1''	-- Added by Alex Green 29 May 2017
			WHEN @Environment = ''UK'' THEN ''%7d&_Division_=1''
			WHEN @Environment = ''BE'' THEN ''%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1''
			ELSE ''%7d''
			END) 

	-- Return the result of the function
	RETURN @CardURL

END
' 
END
GO
