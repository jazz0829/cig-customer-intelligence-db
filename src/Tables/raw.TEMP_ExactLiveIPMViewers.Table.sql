/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4451)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[TEMP_ExactLiveIPMViewers]    Script Date: 30/01/2018 11:59:01 ******/
DROP TABLE IF EXISTS [raw].[TEMP_ExactLiveIPMViewers]
GO
/****** Object:  Table [raw].[TEMP_ExactLiveIPMViewers]    Script Date: 30/01/2018 11:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[TEMP_ExactLiveIPMViewers]') AND type in (N'U'))
BEGIN
CREATE TABLE [raw].[TEMP_ExactLiveIPMViewers](
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accountName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[segmentJoined] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Views for Campaign "Exact Live 2017"] [float] NULL
) ON [PRIMARY]
END
GO
