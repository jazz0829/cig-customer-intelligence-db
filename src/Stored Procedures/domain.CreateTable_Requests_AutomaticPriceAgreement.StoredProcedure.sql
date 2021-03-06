USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_AutomaticPriceAgreement]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_AutomaticPriceAgreement]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_AutomaticPriceAgreement]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_AutomaticPriceAgreement] 

AS

BEGIN
IF OBJECT_ID (N'Requests_AutomaticPriceAgreement', N'U') IS NOT NULL 
DROP TABLE domain.Requests_AutomaticPriceAgreement

CREATE TABLE [domain].[Requests_AutomaticPriceAgreement](
[RequestID] uniqueidentifier,
[Created] Datetime,
[Modified] Datetime,
[Realized] Datetime,
[Approved] Datetime,
[StatusChanged] Datetime,

[Status] int,
[HID] int ,
[TypeDescription] nvarchar(max),
[AccountID] uniqueidentifier,
[ContactID] uniqueidentifier,
[Description] nvarchar(max),
[RequestComments] nvarchar(max),
[WorkflowComments] nvarchar(max),

[# months agreement] int,

[CIGCopyTime] Datetime,
[Environment] nvarchar(3),
[Processed] nvarchar(max)
)
END
GO
