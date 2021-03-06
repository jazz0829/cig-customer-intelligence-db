USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Eloqua_Accounts_EOLAccountID_EmailAddress_DateModified]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Accounts_EOLAccountID_EmailAddress_DateModified] ON [raw].[Eloqua_Accounts]
GO
/****** Object:  Index [IX_Eloqua_Accounts_EOLAccountID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_Accounts_EOLAccountID] ON [raw].[Eloqua_Accounts]
GO
/****** Object:  Index [CIX_Eloqua_Accounts]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [CIX_Eloqua_Accounts] ON [raw].[Eloqua_Accounts] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Eloqua_Accounts]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Eloqua_Accounts]
GO
/****** Object:  Table [raw].[Eloqua_Accounts]    Script Date: 24-sept.-18 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Eloqua_Accounts](
	[CompanyName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StateOrProvince] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipOrPostalCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessPhone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EloquaCompanyID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[CompanyCategory] [float] NULL,
	[SFDCAccountID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedByCRMSystem] [datetime] NULL,
	[Address2] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address3] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PURLName_DefaultHypersite] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fax] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Website] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLAccountCode] [float] NULL,
	[EOLAccountID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountantCode] [float] NULL,
	[AccountantID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessPhoneExtension] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChamberOfCommerce] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DUNSNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classification] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountEmail] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountStartDate] [datetime] NULL,
	[AccountEndDate] [datetime] NULL,
	[AccountStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanySize] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanySizeFrom] [float] NULL,
	[CompanySizeTo] [float] NULL,
	[AccountManagerEmail] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountManagerName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountantName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsAccountant] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsPilot] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsReseller] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NumberOfClients] [float] NULL,
	[ResellerName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sector] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subsector] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Annualrevenue] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ResellerCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UTMCampaignSpecifics] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UTMCampaignCode] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UTMCampaignContent] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UTMCampaignMedium] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UTMCampaignSource] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UTMCampaignTerm] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLContactID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedByEOLSystem] [datetime] NULL,
	[ContractCategory] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractsAttached] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCampaignID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCampaignIDDate] [datetime] NULL,
	[ConsultancyItem] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataCleansing] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CMD_IMSF] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CMD_Vertical] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CMD_OpportunityCreationDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_Eloqua_Accounts]    Script Date: 24-sept.-18 14:21:55 ******/
CREATE CLUSTERED INDEX [CIX_Eloqua_Accounts] ON [raw].[Eloqua_Accounts]
(
	[DateModified] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_Accounts_EOLAccountID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Accounts_EOLAccountID] ON [raw].[Eloqua_Accounts]
(
	[EOLAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_Accounts_EOLAccountID_EmailAddress_DateModified]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_Accounts_EOLAccountID_EmailAddress_DateModified] ON [raw].[Eloqua_Accounts]
(
	[EOLAccountID] ASC
)
INCLUDE ( 	[EmailAddress],
	[DateModified]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
