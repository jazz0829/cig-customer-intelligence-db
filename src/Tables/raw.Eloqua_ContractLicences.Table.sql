USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Eloqua_ContractLicences_EOLContractID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_ContractLicences_EOLContractID] ON [raw].[Eloqua_ContractLicences]
GO
/****** Object:  Index [IX_Eloqua_ContractLicences_EOLContactID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_ContractLicences_EOLContactID] ON [raw].[Eloqua_ContractLicences]
GO
/****** Object:  Index [IX_Eloqua_ContractLicences_EOLAccountID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Eloqua_ContractLicences_EOLAccountID] ON [raw].[Eloqua_ContractLicences]
GO
/****** Object:  Index [CIX_Eloqua_ContractLicences]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [CIX_Eloqua_ContractLicences] ON [raw].[Eloqua_ContractLicences] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Eloqua_ContractLicences]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Eloqua_ContractLicences]
GO
/****** Object:  Table [raw].[Eloqua_ContractLicences]    Script Date: 24-sept.-18 14:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Eloqua_ContractLicences](
	[EOLContractID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLAccountID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLContactID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractStartDate] [datetime] NULL,
	[ContractFinalDate] [datetime] NULL,
	[ContractStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractCancellationDate] [datetime] NULL,
	[ContractCancellationReason] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Package] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModulesAll] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModulesCommercial] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModulesTrial] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModulesPilot] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModulesInactive] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractValue] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLAccountCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TotalContractValue] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationEvent] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemPayroll] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DatePayrollUsage] [datetime] NULL,
	[ItemScaning] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateScaningUsage] [datetime] NULL,
	[DataCleansing] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExternalId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_Eloqua_ContractLicences]    Script Date: 24-sept.-18 14:21:59 ******/
CREATE CLUSTERED INDEX [CIX_Eloqua_ContractLicences] ON [raw].[Eloqua_ContractLicences]
(
	[UpdatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_ContractLicences_EOLAccountID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_ContractLicences_EOLAccountID] ON [raw].[Eloqua_ContractLicences]
(
	[EOLAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_ContractLicences_EOLContactID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_ContractLicences_EOLContactID] ON [raw].[Eloqua_ContractLicences]
(
	[EOLContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eloqua_ContractLicences_EOLContractID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Eloqua_ContractLicences_EOLContractID] ON [raw].[Eloqua_ContractLicences]
(
	[EOLContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
