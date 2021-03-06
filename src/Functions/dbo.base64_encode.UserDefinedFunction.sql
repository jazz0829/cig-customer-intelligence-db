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
/****** Object:  UserDefinedFunction [dbo].[base64_encode]    Script Date: 30/01/2018 12:06:19 ******/
DROP FUNCTION IF EXISTS [dbo].[base64_encode]
GO
/****** Object:  UserDefinedFunction [dbo].[base64_encode]    Script Date: 30/01/2018 12:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[base64_encode]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[base64_encode]
(
    @value varbinary(max)
)
RETURNS varchar(max)
AS
BEGIN
    RETURN cast('''' as xml).value(''xs:base64Binary(sql:variable("@value"))'', ''varchar(max)'')
END' 
END
GO
