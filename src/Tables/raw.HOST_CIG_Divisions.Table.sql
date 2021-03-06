USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Environment_Division_CIGCopyTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Environment_Division_CIGCopyTime] ON [raw].[HOST_CIG_Divisions] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_Divisions]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_Divisions]
GO
/****** Object:  Table [raw].[HOST_CIG_Divisions]    Script Date: 24-sept.-18 14:22:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_Divisions](
	[Code] [int] NOT NULL,
	[HID] [bigint] NOT NULL,
	[Main] [bit] NOT NULL,
	[CustomerPortal] [bit] NOT NULL,
	[BlockingStatus] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[Origin] [smallint] NOT NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[TemplateCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxOfficeNumber] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DatevAccountantNumber] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DatevClientNumber] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShareCapital] [float] NULL,
	[LinkedDivision] [int] NULL,
	[LegislationCode] [bigint] NULL,
	[Deleted] [datetime] NULL,
	[Deleter] [uniqueidentifier] NULL,
	[Website] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Account] [uniqueidentifier] NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Customer] [uniqueidentifier] NULL,
	[Country] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivitySector] [uniqueidentifier] NULL,
	[ActivitySubSector] [uniqueidentifier] NULL,
	[CompanySize] [uniqueidentifier] NULL,
	[ChamberOfCommerce] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Postcode] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DunsNumber] [nvarchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessType] [uniqueidentifier] NULL,
	[Sector] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubSector] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Environment_Division_CIGCopyTime]    Script Date: 24-sept.-18 14:22:07 ******/
CREATE CLUSTERED INDEX [IX_Environment_Division_CIGCopyTime] ON [raw].[HOST_CIG_Divisions]
(
	[Environment] ASC,
	[Code] ASC,
	[CIGCopyTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
