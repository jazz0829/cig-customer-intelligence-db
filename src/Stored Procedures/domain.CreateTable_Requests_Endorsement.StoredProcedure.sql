USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_Endorsement]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_Endorsement]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_Endorsement]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_Endorsement] 

AS
BEGIN
IF OBJECT_ID (N'Requests_Endorsement', N'U') IS NOT NULL 
DROP TABLE domain.Requests_Endorsement

CREATE TABLE [domain].[Requests_Endorsement](
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
[Type] nvarchar(max),
[Related activity] nvarchar(max),
[StartDate] Datetime,
[EndDate] Datetime,
[Planned attendees] int,
[Exact attendees] nvarchar(max),
[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END

GO
