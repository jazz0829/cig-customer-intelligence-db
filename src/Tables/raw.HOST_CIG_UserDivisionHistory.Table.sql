USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_UserDivisionHistory]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_UserDivisionHistory]
GO
/****** Object:  Table [raw].[HOST_CIG_UserDivisionHistory]    Script Date: 24-sept.-18 14:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_UserDivisionHistory](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
