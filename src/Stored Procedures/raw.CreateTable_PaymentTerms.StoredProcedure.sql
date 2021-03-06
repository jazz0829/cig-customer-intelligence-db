USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[CreateTable_PaymentTerms]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[CreateTable_PaymentTerms]
GO
/****** Object:  StoredProcedure [raw].[CreateTable_PaymentTerms]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 06/01/2017
-- Description:	This procedure drops the previous version of the PaymentTerms table and rebuilds it. 
--				This is the first attempt at building a modified version of Payment terms 
--				This table does not contain all columns from EOL Hosting as some are too sensitive for Customer Intelligence to collect
-- =====================================================================================================================================================================

CREATE PROCEDURE [raw].[CreateTable_PaymentTerms]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.raw.PaymentTerms', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.[raw].PaymentTerms

CREATE TABLE CustomerIntelligence.[raw].PaymentTerms
(
	[PaymentTermsID] [uniqueidentifier] NOT NULL,
	[Environment] [nchar](3) NULL,
	[AccountID] [uniqueidentifier] NULL,
	[AccountContact] [uniqueidentifier] NULL,	
	[DivisionCode] [int] NOT NULL,
	[EntryID] [uniqueidentifier] NULL,
	[Journal] [nvarchar](20) NULL ,
	[LineType] [smallint] NOT NULL,
	[Currency] [nchar](3) NULL,
	[AmountFC] [float] NOT NULL,
	[RateFC] [float] NULL,
	[AmountDC] [float] NOT NULL,
	[EntryDate] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[EndYear] [smallint] NULL,
	[EndPeriod] [smallint] NULL,
	[EntryNumber] [int] NULL,
	[InvoiceNumber] [int] NULL,
	[Status] [smallint] NULL,
	[MatchID] [uniqueidentifier] NULL,
	[WriteOffCode] [nchar](1) NULL,
	[Source] [int] NOT NULL,
	[PaymentCondition] [nchar](2) NULL,
	[PaymentDiscountType] [nchar](1) NULL,
	[PaymentDiscount] [float] NULL,
	[PaymentReference] [nvarchar](60) NULL,
	[PaymentMethod] [nchar](1) NULL,
	[PaymentDays] [int] NULL,
	[PaymentStatus] [nchar](1) NULL,
	[TransactionID] [uniqueidentifier] NULL,
	[TransactionType] [int] NULL,
	[TransactionReportingYear] [smallint] NULL,
	[TransactionReportingPeriod] [smallint] NULL,
	[TransactionReversal] [bit] NOT NULL,
	[TransactionStatus] [smallint] NULL,
	[TransactionDueDate] [datetime] NULL,
	[TransactionAmountFC] [float] NOT NULL,
	[TransactionAmountDC] [float] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	--[Processed] [bit] NULL,
)

END













GO
