USE [CustomerIntelligence]
GO
/****** Object:  Index [EnviroAccount_Date]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [EnviroAccount_Date] ON [publish].[NoActivity_Dashboard] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [publish].[NoActivity_Dashboard]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [publish].[NoActivity_Dashboard]
GO
/****** Object:  Table [publish].[NoActivity_Dashboard]    Script Date: 24-sept.-18 14:21:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [publish].[NoActivity_Dashboard](
	[AccountID] [uniqueidentifier] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EnviroAccount] [nvarchar](21) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CalendarDate] [datetime] NULL,
	[ActiveOrNot] [int] NOT NULL,
	[PageviewQuantity] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EnviroAccount_Date]    Script Date: 24-sept.-18 14:21:47 ******/
CREATE CLUSTERED INDEX [EnviroAccount_Date] ON [publish].[NoActivity_Dashboard]
(
	[EnviroAccount] ASC,
	[CalendarDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
