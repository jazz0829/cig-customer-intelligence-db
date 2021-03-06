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
/****** Object:  Table [raw].[TEMP_2017-12-22_SeenAcctLiteIPMUpgrade]    Script Date: 30/01/2018 11:59:01 ******/
DROP TABLE IF EXISTS [raw].[TEMP_2017-12-22_SeenAcctLiteIPMUpgrade]
GO
/****** Object:  Table [raw].[TEMP_2017-12-22_SeenAcctLiteIPMUpgrade]    Script Date: 30/01/2018 11:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[TEMP_2017-12-22_SeenAcctLiteIPMUpgrade]') AND type in (N'U'))
BEGIN
CREATE TABLE [raw].[TEMP_2017-12-22_SeenAcctLiteIPMUpgrade](
	[name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[emailAddress] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[displayName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accountName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[engagementScore] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[engagementPercentChange] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[firstActivity] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lastActivity] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[totalActions] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[segmentJoined] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	["""Upgrade Acc Lite"" Actions for all time"] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
