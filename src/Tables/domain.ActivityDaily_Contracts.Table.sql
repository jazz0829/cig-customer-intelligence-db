USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Date_[Environment_AccountCode_PackageCode_AccountID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Date_[Environment_AccountCode_PackageCode_AccountID] ON [domain].[ActivityDaily_Contracts]
GO
/****** Object:  Index [IX_ActivityDaily_Contracts_Date_Environment_AccountCode_PackageCode]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_ActivityDaily_Contracts_Date_Environment_AccountCode_PackageCode] ON [domain].[ActivityDaily_Contracts]
GO
/****** Object:  Table [domain].[ActivityDaily_Contracts]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ActivityDaily_Contracts]
GO
/****** Object:  Table [domain].[ActivityDaily_Contracts]    Script Date: 24-sept.-18 14:21:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ActivityDaily_Contracts](
	[Date] [datetime] NULL,
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PackageCode] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractEventTypeCode] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountantOrLinked] [int] NULL,
	[NumberOfUsers] [int] NULL,
	[NumberOfAdministrations] [int] NULL,
	[MRR] [float] NULL,
	[AccountID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ActivityDaily_Contracts_Date_Environment_AccountCode_PackageCode]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_ActivityDaily_Contracts_Date_Environment_AccountCode_PackageCode] ON [domain].[ActivityDaily_Contracts]
(
	[Date] ASC
)
INCLUDE ( 	[Environment],
	[AccountCode],
	[PackageCode]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Date_[Environment_AccountCode_PackageCode_AccountID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Date_[Environment_AccountCode_PackageCode_AccountID] ON [domain].[ActivityDaily_Contracts]
(
	[Date] ASC
)
INCLUDE ( 	[Environment],
	[AccountCode],
	[PackageCode],
	[AccountID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
