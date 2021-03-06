USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[DW_Opportunities]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[DW_Opportunities]
GO
/****** Object:  Table [raw].[DW_Opportunities]    Script Date: 24-sept.-18 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[DW_Opportunities](
	[ID] [uniqueidentifier] NULL,
	[DIVISION] [int] NULL,
	[ACCOUNTNAME] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNT] [uniqueidentifier] NULL,
	[ACCOUNTCODE] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OWNER] [uniqueidentifier] NULL,
	[OWNERFULLNAME] [nvarchar](155) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CLOSEDATE] [datetime] NULL,
	[CREATED] [datetime] NULL,
	[CREATOR] [uniqueidentifier] NULL,
	[OPPORTUNITYSTAGE] [uniqueidentifier] NULL,
	[OPPORTUNITYSTAGEDESCRIPTION] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OPPORTUNITYSTATUS] [int] NULL,
	[PROBABILITY] [float] NULL,
	[MODIFIED] [datetime] NULL,
	[MODIFIER] [uniqueidentifier] NULL,
	[NAME] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CURRENCY] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMOUNTFC] [float] NULL,
	[AMOUNTDC] [float] NULL,
	[RATEFC] [float] NULL,
	[LEADSOURCE] [uniqueidentifier] NULL,
	[LEADSOURCEDESCRIPTION] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SALESTYPE] [uniqueidentifier] NULL,
	[SALESDESCRIPTION] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[REASONCODE] [uniqueidentifier] NULL,
	[REASONDESCRIPTION] [nvarchar](155) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NOTES] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACTIONDATE] [datetime] NULL,
	[PROJECT] [uniqueidentifier] NULL,
	[PROJECTCODE] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PROJECTDESCRIPTION] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CAMPAIGN] [uniqueidentifier] NULL,
	[CAMPAIGNDESCRIPTION] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COUNTRY] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[META_SOURCE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[META_LOAD_STARTDTS] [datetime] NOT NULL,
	[META_LOAD_ENDDTS] [datetime] NULL,
	[META_PROCESSID] [int] NOT NULL,
	[META_LASTUPDATEPROCESSID] [int] NOT NULL,
	[META_ISDELETED] [bit] NOT NULL,
	[META_HASH] [int] NOT NULL,
	[OPPORTUNITYTYPE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OPPORTUNITYTYPEDESCRIPTION] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CHANNEL] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CHANNELDESCRIPTION] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTANT] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTANTCODE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTANTNAME] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RESELLER] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RESELLERCODE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RESELLERNAME] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CREATORFULLNAME] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MODIFIERFULLNAME] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
