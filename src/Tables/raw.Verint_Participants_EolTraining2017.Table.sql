USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Verint_Participants_EolTraining2017]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Verint_Participants_EolTraining2017]
GO
/****** Object:  Table [raw].[Verint_Participants_EolTraining2017]    Script Date: 24-sept.-18 14:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Verint_Participants_EolTraining2017](
	[Recordid] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Panelistid] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Started] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Completed] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branched_out] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Over_quota] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Modified] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Invite_status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Campaign_status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Culture] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User_key1] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User_key2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User_key3] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Http_referer] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Http_user_agent] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Remote_addr] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Remote_host] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Initial_date] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Initial_status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder1_date] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder1_status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder2_date] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder2_status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder3_date] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder3_status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder4_date] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reminder4_status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Thankyou_date] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Thankyou_status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Close_date] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Last_page] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fi_loaded] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Url] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Last_page_number] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Modifier] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Device_type] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ua_family] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ua_majorver] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Os_name] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Os_family] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Iploc_long] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Iploc_lat] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Iploc_city] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Iploc_state] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Iploc_country] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Iploc_zipcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProjectId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL
) ON [PRIMARY]
GO
