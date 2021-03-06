USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_CustomerCare]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_CustomerCare]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_CustomerCare]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-11-28
-- Description:	CreateTable procedure for building the Customer Care Request table
-- =============================================
Create PROCEDURE [domain].[CreateTable_Requests_CustomerCare] 

AS
BEGIN
IF OBJECT_ID (N'Requests_CustomerCare', N'U') IS NOT NULL 
DROP TABLE domain.Requests_CustomerCare

CREATE TABLE [domain].[Requests_CustomerCare](
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
[Subject] nvarchar(max),
[Follow up by] uniqueidentifier,
[Next action date] datetime,
[NPS score] nvarchar(max),
[NPS status] nvarchar(max),
[Churn risk] nvarchar(max),
[Training followed] nvarchar(max),
[Complaint request] uniqueidentifier,
[Project] uniqueidentifier,
[Consultancy request] uniqueidentifier,
[Apps in use] bit,
[Responsible for sales at that time] uniqueidentifier,
[MRR value during call] float,
[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END
GO
