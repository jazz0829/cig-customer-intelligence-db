USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Users]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Users]
GO
/****** Object:  Table [domain].[Users]    Script Date: 24-sept.-18 14:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[HID] [int] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[PersonID] [uniqueidentifier] NOT NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FullName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Digipass] [uniqueidentifier] NULL,
	[AuthenticationType] [int] NOT NULL,
	[LockoutTime] [datetime] NULL,
	[LockoutAttempts] [int] NULL,
	[Blocked] [tinyint] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ValidationDate] [datetime] NULL,
	[ValidationID] [uniqueidentifier] NULL,
	[LastLogin] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[CIGCopyTime] [datetime] NULL,
	[TotpRegistrationUtcDate] [datetime] NULL,
	[TotpSkippedUtc] [datetime] NULL,
	[TotpForcedByExactUtc] [datetime] NULL,
	[MarketingOptInDate] [datetime] NULL,
	[MarketingOptOutDate] [datetime] NULL
) ON [PRIMARY]
GO
