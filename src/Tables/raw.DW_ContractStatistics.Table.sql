USE [CustomerIntelligence]
GO
/****** Object:  Index [CIX_DW_ContractStatistics_LoadDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [CIX_DW_ContractStatistics_LoadDate] ON [raw].[DW_ContractStatistics] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[DW_ContractStatistics]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[DW_ContractStatistics]
GO
/****** Object:  Table [raw].[DW_ContractStatistics]    Script Date: 24-sept.-18 14:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[DW_ContractStatistics](
	[ENVIRONMENT] [nchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CODE] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NAME] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CHAMBEROFCOMMERCE] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VATNUMBER] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[POSTCODE] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CITY] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATE] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COUNTRY] [nchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTMANAGER] [uniqueidentifier] NULL,
	[LEADSOURCE] [uniqueidentifier] NULL,
	[RESELLER] [uniqueidentifier] NULL,
	[BLOCKED] [tinyint] NULL,
	[SECTORCODE] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SECTORDESCRIPTION] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SUBSECTORCODE] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SUBSECTORDESCRIPTION] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COMPSIZECODE] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COMPSIZEDESCRIPTION] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BUSTYPECODE] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BUSTYPEDESCRIPTION] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTCLASSIFICATIONCODE] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTCLASSIFICATIONDESCRIPTION] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LEADSOURCECODE] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LEADSOURCEDESCRIPTION] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ISACCOUNTANT] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTANTORLINKED] [tinyint] NULL,
	[ENTREPRENEURACCOUNTANTLINKED] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTANTCODE] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTANTNAME] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTMANAGERACCOUNTANT] [uniqueidentifier] NULL,
	[RESELLERCODE] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RESELLERNAME] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CONTRACTNUMBER] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CONTRACTTYPE] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[STARTDATE] [date] NULL,
	[ENDDATE] [date] NULL,
	[FINALDATE] [date] NULL,
	[EVENTYEARMONTH] [int] NULL,
	[EVENTYEAR] [int] NULL,
	[EVENTMONTH] [int] NULL,
	[EVENTDATE] [date] NOT NULL,
	[EVENTTYPE] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EVENTDESCRIPTION] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INFLOWOUTFLOW] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ITEM] [uniqueidentifier] NULL,
	[ITEMCODE] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ITEMDESCRIPTION] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ITEMTYPE] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PACKAGE] [uniqueidentifier] NULL,
	[PACKAGECODE] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LINEPACKAGE] [tinyint] NULL,
	[NUMBEROFADMINISTRATIONS] [int] NULL,
	[QUANTITY] [int] NULL,
	[CONTRACTLINEVALUE] [float] NULL,
	[VALUEPERMONTH] [float] NULL,
	[VALUEPERYEAR] [float] NULL,
	[ACCOUNTMANAGERCODE] [int] NULL,
	[ACCOUNTMANAGERNAME] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BUSINESSLINECODE] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BUSINESSLINEDESCRIPTION] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PACKAGEDESCRIPTION] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNTCLASSIFICATION] [uniqueidentifier] NULL,
	[ACCOUNTMANAGERACCOUNTANTCODE] [int] NULL,
	[ACCOUNTMANAGERACCOUNTANTNAME] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NUMBEROFUSERS] [int] NULL,
	[CONTRACTLINEVALUEDC] [float] NULL,
	[VALUEPERMONTHDC] [float] NULL,
	[VALUEPERYEARDC] [float] NULL,
	[EXCHANGERATE] [float] NULL,
	[ITEMBASEPRICEPERMONTH] [float] NULL,
	[ITEMBASEPRICEPERYEAR] [float] NULL,
	[LASTMODIFIED] [datetime] NULL,
	[ADMINISTRATIONSINUSE] [int] NULL,
	[CAMPAIGNNAME] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CAMPAIGNSOURCE] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CAMPAIGNMEDIUM] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CAMPAIGNTERM] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CAMPAIGNCONTENT] [nvarchar](510) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CANCELLATIONREASON] [int] NULL,
	[META_SOURCE] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[META_LOAD_STARTDTS] [datetime] NOT NULL,
	[META_LOAD_ENDDTS] [datetime] NULL,
	[META_PROCESSID] [int] NULL,
	[META_LASTUPDATEPROCESSID] [int] NOT NULL,
	[META_ISDELETED] [bit] NOT NULL,
	[META_HASH] [varbinary](20) NULL,
	[TIMEUNIT] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACCOUNT] [uniqueidentifier] NULL,
	[CANCELLATIONDATE] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_DW_ContractStatistics_LoadDate]    Script Date: 24-sept.-18 14:21:53 ******/
CREATE CLUSTERED INDEX [CIX_DW_ContractStatistics_LoadDate] ON [raw].[DW_ContractStatistics]
(
	[META_LOAD_STARTDTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
