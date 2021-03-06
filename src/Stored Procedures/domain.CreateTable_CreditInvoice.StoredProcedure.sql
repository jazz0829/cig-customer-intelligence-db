USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CreditInvoice]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_CreditInvoice]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CreditInvoice]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_CreditInvoice] 
AS
BEGIN
IF OBJECT_ID (N'Requests_CreditInvoice', N'U') IS NOT NULL 
DROP TABLE domain.Requests_CreditInvoice

CREATE TABLE [domain].[Requests_CreditInvoice](
[Status] int,
[ID] uniqueidentifier,
[HID] int ,
[TypeDescription] nvarchar(200),
[AccountID] uniqueidentifier,
[ContactID] uniqueidentifier,
[Description] nvarchar(255),
[RequestComments] nvarchar(255),
[WorkflowComments] nvarchar(255),
[Entry information] nvarchar(80),
[Original invoice number] nvarchar(80),
[Original invoice date] Date,
[Credit invoice date] Date,
[Original invoice blocked] nvarchar(80),
[Reason] nvarchar(80),
[Related account] uniqueidentifier,
[Related request] uniqueidentifier,
[Realize information] nvarchar(80),
[Credit invoice number] nvarchar(80),
[New debit invoice number] nvarchar(80),
[Process information] nvarchar(80),
[Revenue category] nvarchar(80),

[CIGCopyTime] Datetime,
[Environment] nvarchar(3),
[Processed] nvarchar(20)
)
END
GO
