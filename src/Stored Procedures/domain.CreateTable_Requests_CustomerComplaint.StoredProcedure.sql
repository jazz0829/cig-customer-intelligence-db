USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_CustomerComplaint]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_CustomerComplaint]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_CustomerComplaint]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_CustomerComplaint] 
AS
BEGIN
IF OBJECT_ID (N'Requests_CustomerComplaint', N'U') IS NOT NULL 
DROP TABLE domain.Requests_CustomerComplaint

CREATE TABLE [domain].[Requests_CustomerComplaint](
[ID] uniqueidentifier,
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

[StartDate] Date,
[EndDate] Date, 
[Claimed ammount] nvarchar(max),
[Reason complaint] nvarchar(max),
[Module] nvarchar(max),
[Related request] uniqueidentifier,
[Classification 1] nvarchar(max),
[Classification 2] nvarchar(max),
[Classification 3] nvarchar(max),

[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END
GO
