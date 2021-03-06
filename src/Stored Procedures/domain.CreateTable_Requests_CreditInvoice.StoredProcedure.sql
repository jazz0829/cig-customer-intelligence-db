USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_CreditInvoice]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_CreditInvoice]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_CreditInvoice]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_CreditInvoice] 
AS
BEGIN
IF OBJECT_ID (N'Requests_CreditInvoice', N'U') IS NOT NULL 
DROP TABLE domain.Requests_CreditInvoice

CREATE TABLE [domain].[Requests_CreditInvoice](
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
[Entry information] nvarchar(max),
[Original invoice number] nvarchar(max),
[Original invoice date] Date,
[Credit invoice date] Date,
[Original invoice blocked] nvarchar(max),
[Reason] nvarchar(max),
[Related account] uniqueidentifier,
[Related request] uniqueidentifier,
[Realize information] nvarchar(max),
[Credit invoice number] nvarchar(max),
[New debit invoice number] nvarchar(max),
[Process information] nvarchar(max),
[Revenue category] nvarchar(max),

[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END
GO
