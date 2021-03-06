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
/****** Object:  Table [dbo].[RonaldCustomerCases]    Script Date: 30/01/2018 11:59:01 ******/
DROP TABLE IF EXISTS [dbo].[RonaldCustomerCases]
GO
/****** Object:  Table [dbo].[RonaldCustomerCases]    Script Date: 30/01/2018 11:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RonaldCustomerCases]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RonaldCustomerCases](
	[CreateDateTime] [datetime] NULL,
	[CreatedDate] [date] NULL,
	[ClosedDateTime] [datetime] NULL,
	[ClosedDate] [date] NULL,
	[CaseNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CaseID] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subject] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsClosed] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[IsEscalated] [bit] NULL,
	[Origin] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Priority] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CaseSubject] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MainReason] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubReason] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
