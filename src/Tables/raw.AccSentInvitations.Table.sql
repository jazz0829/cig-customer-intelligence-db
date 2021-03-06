USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[AccSentInvitations]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[AccSentInvitations]
GO
/****** Object:  Table [raw].[AccSentInvitations]    Script Date: 24-sept.-18 14:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[AccSentInvitations](
	[Country] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Invitation Sent] [datetime] NULL,
	[Accountant (Code + Name)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accountant] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Invoice debtor] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accepted] [datetime] NULL,
	[Customer (Code + Name)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Customer] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subscription created] [datetime] NULL,
	[Delegated division (Code + Name)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Delegated division] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[F15] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[F16] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[F17] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
