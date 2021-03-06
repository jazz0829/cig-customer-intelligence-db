USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ConsultAanvraag]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ConsultAanvraag]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ConsultAanvraag]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_ConsultAanvraag] 
AS

BEGIN
IF OBJECT_ID (N'ConsultAanvraag', N'U') IS NOT NULL 
DROP TABLE domain.ConsultAanvraag

CREATE TABLE [domain].[ConsultAanvraag](
[Status] int,
[ID] uniqueidentifier,
[HID] int ,
[TypeDescription] nvarchar(200),
[AccountID] uniqueidentifier,
[ContactID] uniqueidentifier,
[Description] nvarchar(255),
[RequestComments] nvarchar(255),
[WorkflowComments] nvarchar(255),
[Remark] nvarchar(80),
[-] nvarchar(80),
[--] nvarchar(80),
[Request:] nvarchar(80),
[Number of days] nvarchar(80),
[Consultancy done by] uniqueidentifier,
[Price agreement] uniqueidentifier,
[Sales] uniqueidentifier,
[StartDate] Date,
[EndDate] Date,
[Internal remark] nvarchar(80),
[Consultancy dag 1] Date,
[Contact person] nvarchar(80),
[Email] nvarchar(80),
[Telephone number] nvarchar(80),
[Accountant involved] nvarchar(80),
[Key-users] nvarchar(80),
[Current solution] nvarchar(80),
[Training planned] nvarchar(80),
[Conversion] nvarchar(80),
[Import files?] nvarchar(80),
[Particularities getting started] nvarchar(80),
[Particularities process] nvarchar(80),
[Apps linked] nvarchar(80),

[CIGCopyTime] Datetime,
[Environment] nvarchar(3),
[Processed] nvarchar(20)
)
END
GO
