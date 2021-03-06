USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_CancellationDowngrade_ImmediateEffect]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_CancellationDowngrade_ImmediateEffect]
GO
/****** Object:  Table [domain].[Requests_CancellationDowngrade_ImmediateEffect]    Script Date: 24-sept.-18 14:21:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_CancellationDowngrade_ImmediateEffect](
	[Status] [int] NULL,
	[RequestID] [uniqueidentifier] NULL,
	[HID] [int] NULL,
	[TypeDescription] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [uniqueidentifier] NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RequestComments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WorkflowComments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reason] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RelatedRequest] [uniqueidentifier] NULL,
	[Type] [uniqueidentifier] NULL,
	[DecreaseInMRR] [float] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Realized] [datetime] NULL,
	[Approved] [datetime] NULL,
	[Processed] [datetime] NULL,
	[StatusChanged] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
