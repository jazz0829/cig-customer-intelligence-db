USE [CustomerIntelligence]
GO
/****** Object:  Index [CIX_UserIDsHashed]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [CIX_UserIDsHashed] ON [domain].[UserIDsHashed] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[UserIDsHashed]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[UserIDsHashed]
GO
/****** Object:  Table [domain].[UserIDsHashed]    Script Date: 24-sept.-18 14:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[UserIDsHashed](
	[UserId] [uniqueidentifier] NOT NULL,
	[UserIdHashed] [char](28) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_UserIDsHashed]    Script Date: 24-sept.-18 14:21:45 ******/
CREATE CLUSTERED INDEX [CIX_UserIDsHashed] ON [domain].[UserIDsHashed]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
