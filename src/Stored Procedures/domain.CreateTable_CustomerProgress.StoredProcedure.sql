USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CustomerProgress]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_CustomerProgress]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CustomerProgress]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_CustomerProgress] 
AS
BEGIN
IF OBJECT_ID (N'CustomerProgress', N'U') IS NOT NULL 
DROP TABLE domain.CustomerProgress

CREATE TABLE [domain].[CustomerProgress](
[Status] int,
[ID] uniqueidentifier,
[HID] int ,
[TypeDescription] nvarchar(200),
[AccountID] uniqueidentifier,
[ContactID] uniqueidentifier,
[Description] nvarchar(255),
[RequestComments] nvarchar(255),
[WorkflowComments] nvarchar(255),
[Basic setup] nvarchar(80),
[Apps] nvarchar(80),
[Setup master data] nvarchar(80),
[Match customer/solution] nvarchar(80),
[Action date] Date,
[EndDate] Date,
[New action] nvarchar(80),
[Start profile] nvarchar(80),
[End profile] nvarchar(80),
[Effort %] nvarchar(80),
[Contract value] nvarchar(80),
[Go-live date] Date,
[Onboarded by AMT?] nvarchar(80),
[Sweetspot customer?] nvarchar(80),
[Sector] nvarchar(80),
[Classification 1] nvarchar(80),
[Classification 2] nvarchar(80),
[Classification 3] nvarchar(80),

[CIGCopyTime] Datetime,
[Environment] nvarchar(3),
[Processed] nvarchar(20)
)
END
GO
