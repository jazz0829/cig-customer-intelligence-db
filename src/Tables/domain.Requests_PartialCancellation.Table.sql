USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_PartialCancellation]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_PartialCancellation]
GO
/****** Object:  Table [domain].[Requests_PartialCancellation]    Script Date: 24-sept.-18 14:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_PartialCancellation](
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
	[Trial?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Full cancellation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel administrations] [int] NULL,
	[Cancel users] [int] NULL,
	[View users] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel digipasses] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel budget] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel electronic banking] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel costs analysis] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel currency] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel invoice] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel activa] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel accountancy tools] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reason cancellation] [int] NULL,
	[Reason internal cancellation] [int] NULL,
	[Switched to] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reverse cancellation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mutation date] [date] NULL,
	[Date next action] [date] NULL,
	[Confirmation sent?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Confirmation cancellation] [uniqueidentifier] NULL,
	[Confirmed since:] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[# month to collect] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
