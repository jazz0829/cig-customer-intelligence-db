USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_SalesCommunicationNote]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_SalesCommunicationNote]
GO
/****** Object:  Table [domain].[Requests_SalesCommunicationNote]    Script Date: 24-sept.-18 14:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_SalesCommunicationNote](
	[RequestID] [uniqueidentifier] NULL,
	[RequestHID] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Realized] [datetime] NULL,
	[ActionDate] [datetime] NULL,
	[Status] [int] NULL,
	[HID] [int] NULL,
	[Subject] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [uniqueidentifier] NULL,
	[ContactID] [uniqueidentifier] NULL,
	[UserID] [uniqueidentifier] NULL,
	[RequestComments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Document] [uniqueidentifier] NULL,
	[Opportunity] [uniqueidentifier] NULL,
	[VAR] [uniqueidentifier] NULL,
	[CommunicationCategory] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price] [float] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
