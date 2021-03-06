USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_WelcomeCall]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_WelcomeCall]
GO
/****** Object:  Table [domain].[Requests_WelcomeCall]    Script Date: 24-sept.-18 14:21:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_WelcomeCall](
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
	[-] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reached] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accountancy profile] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Welcome] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accountancy program] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Login data] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Help tools] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account information] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[My Exact Online] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account manager] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tips] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[--] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Related question] [uniqueidentifier] NULL,
	[StartDate] [date] NULL,
	[Action date] [date] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
