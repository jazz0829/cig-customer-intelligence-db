USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CustomerComplaint]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_CustomerComplaint]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CustomerComplaint]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_CustomerComplaint] 
AS
BEGIN
IF OBJECT_ID (N'CustomerComplaint', N'U') IS NOT NULL 
DROP TABLE domain.CustomerComplaint

CREATE TABLE [domain].[CustomerComplaint](
[Status] int,
[ID] uniqueidentifier,
[HID] int ,
[TypeDescription] nvarchar(200),
[AccountID] uniqueidentifier,
[ContactID] uniqueidentifier,
[Description] nvarchar(255),
[RequestComments] nvarchar(255),
[WorkflowComments] nvarchar(255),

[StartDate] Date,
[EndDate] Date, 
[Claimed ammount] nvarchar(80),
[Reason complaint] nvarchar(80),
[Module] nvarchar(80),
[Related request] uniqueidentifier,
[Classification 1] nvarchar(80),
[Classification 2] nvarchar(80),
[Classification 3] nvarchar(80),

[CIGCopyTime] Datetime,
[Environment] nvarchar(3),
[Processed] nvarchar(20)
)
END
GO
