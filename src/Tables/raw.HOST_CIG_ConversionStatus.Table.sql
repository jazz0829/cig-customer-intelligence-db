USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_ConversionStatus]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_ConversionStatus]
GO
/****** Object:  Table [raw].[HOST_CIG_ConversionStatus]    Script Date: 24-sept.-18 14:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_ConversionStatus](
	[Division] [int] NULL,
	[Name] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IDKey] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DirPath] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [int] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[Document] [uniqueidentifier] NULL,
	[ConversionSource] [int] NULL,
	[Administration] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[DatabaseID] [uniqueidentifier] NULL,
	[HID] [int] NOT NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
