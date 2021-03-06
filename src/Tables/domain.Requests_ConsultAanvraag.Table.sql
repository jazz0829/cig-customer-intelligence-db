USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_ConsultAanvraag]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_ConsultAanvraag]
GO
/****** Object:  Table [domain].[Requests_ConsultAanvraag]    Script Date: 24-sept.-18 14:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_ConsultAanvraag](
	[RequestID] [uniqueidentifier] NULL,
	[ProjectID] [uniqueidentifier] NULL,
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
	[Remark] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[-] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[--] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemID] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number of days] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Consultancy done by] [uniqueidentifier] NULL,
	[Price agreement] [uniqueidentifier] NULL,
	[Sales] [uniqueidentifier] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Internal remark] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Consultancy dag 1] [date] NULL,
	[Contact person] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Telephone number] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accountant involved] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Key-users] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Current solution] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Training planned] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Conversion] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Import files?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Particularities getting started] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Particularities process] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Apps linked] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL,
	[Amount] [float] NULL,
	[UserID] [uniqueidentifier] NULL,
	[RequestHID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
