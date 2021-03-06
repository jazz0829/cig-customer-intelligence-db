USE [CustomerIntelligence]
GO
/****** Object:  Index [CIX_DW_AppBillingProposal_LoadDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [CIX_DW_AppBillingProposal_LoadDate] ON [raw].[DW_AppBillingProposal] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[DW_AppBillingProposal]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[DW_AppBillingProposal]
GO
/****** Object:  Table [raw].[DW_AppBillingProposal]    Script Date: 24-sept.-18 14:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[DW_AppBillingProposal](
	[APP] [uniqueidentifier] NULL,
	[APPNAME] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PARTNER] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PARTNERCODE] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PARTNERNAME] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[YEAR] [int] NULL,
	[MONTH] [int] NULL,
	[NUMBEROFCOMPANIES] [int] NULL,
	[ITEM] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ITEMCODE] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ITEMDESCRIPTION] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ITEMPRICE] [float] NULL,
	[AMOUNT] [float] NULL,
	[INVOICEDATE] [datetime2](7) NULL,
	[ENVIRONMENT] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[META_SOURCE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[META_LOAD_STARTDTS] [datetime] NOT NULL,
	[META_LOAD_ENDDTS] [datetime] NULL,
	[META_PROCESSID] [int] NOT NULL,
	[META_LASTUPDATEPROCESSID] [int] NOT NULL,
	[META_ISDELETED] [bit] NOT NULL,
	[META_HASH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_DW_AppBillingProposal_LoadDate]    Script Date: 24-sept.-18 14:21:53 ******/
CREATE CLUSTERED INDEX [CIX_DW_AppBillingProposal_LoadDate] ON [raw].[DW_AppBillingProposal]
(
	[META_LOAD_STARTDTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
