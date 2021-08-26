USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[20180222_AccountingCustomerWholesalePotential]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[20180222_AccountingCustomerWholesalePotential]
GO
/****** Object:  Table [raw].[20180222_AccountingCustomerWholesalePotential]    Script Date: 24-sept.-18 14:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[20180222_AccountingCustomerWholesalePotential](
	[Account Code] [float] NULL,
	[Upgrade Probability] [float] NULL
) ON [PRIMARY]
GO
