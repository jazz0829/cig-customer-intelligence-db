USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_CustomerProgress]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_CustomerProgress]
GO
/****** Object:  Table [domain].[Requests_CustomerProgress]    Script Date: 24-sept.-18 14:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_CustomerProgress](
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
	[Basic setup] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Apps] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Setup master data] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Match customer/solution] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Action date] [date] NULL,
	[EndDate] [date] NULL,
	[New action] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Start profile] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[End profile] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Effort %] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contract value] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Go-live date] [date] NULL,
	[Onboarded by AMT?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sweetspot customer?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sector] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classification 1] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classification 2] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classification 3] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL,
	[UserID] [uniqueidentifier] NULL,
	[ConsultancyRequestID] [uniqueidentifier] NULL,
	[DocumentID] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
