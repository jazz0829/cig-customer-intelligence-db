USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[GA_Help_New_Pageviews]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[GA_Help_New_Pageviews]
GO
/****** Object:  Table [raw].[GA_Help_New_Pageviews]    Script Date: 24-sept.-18 14:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[GA_Help_New_Pageviews](
	[LatestImportDate] [datetime] NOT NULL,
	[HashedCustomer] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HashedUser] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HashedDivision] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Timestamp] [bigint] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[UserType] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Legislation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Language] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Solution] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Filename] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParameterType] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParameterValue] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PagePath] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Medium] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Browser] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Device] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TimeOnPage] [float] NULL,
	[Bounce] [int] NULL,
	[Exit] [int] NULL,
	[Hits] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
