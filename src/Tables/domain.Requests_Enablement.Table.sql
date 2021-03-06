USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_Enablement]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_Enablement]
GO
/****** Object:  Table [domain].[Requests_Enablement]    Script Date: 24-sept.-18 14:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_Enablement](
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
	[Next action date] [date] NULL,
	[Type of onboarding] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Information] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date welcome call] [date] NULL,
	[Certification] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accountancy profile created] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Risk profile] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Desired date operational] [date] NULL,
	[Start date consult] [date] NULL,
	[Consultancy provided by] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date customer implemented] [date] NULL,
	[Training followed] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Survey respons] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date onboarding review call] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
