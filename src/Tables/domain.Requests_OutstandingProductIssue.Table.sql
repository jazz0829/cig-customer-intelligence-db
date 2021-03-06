USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_OutstandingProductIssue]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_OutstandingProductIssue]
GO
/****** Object:  Table [domain].[Requests_OutstandingProductIssue]    Script Date: 24-sept.-18 14:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_OutstandingProductIssue](
	[RequestID] [uniqueidentifier] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Realized] [datetime] NULL,
	[Approved] [datetime] NULL,
	[StatusChanged] [datetime] NULL,
	[Status] [int] NULL,
	[HID] [int] NULL,
	[TypeDescription] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [uniqueidentifier] NULL,
	[ContactID] [uniqueidentifier] NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RequestComments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WorkflowComments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Related question] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Development question] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Module] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Hotfix patched?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Test OK in SAT] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
