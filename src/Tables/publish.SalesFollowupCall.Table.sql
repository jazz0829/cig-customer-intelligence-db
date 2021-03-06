USE [CustomerIntelligence]
GO
/****** Object:  Table [publish].[SalesFollowupCall]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [publish].[SalesFollowupCall]
GO
/****** Object:  Table [publish].[SalesFollowupCall]    Script Date: 24-sept.-18 14:21:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [publish].[SalesFollowupCall](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountID] [uniqueidentifier] NULL,
	[AccountCode] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ContractEventDate] [date] NULL,
	[PackageCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerSaleType] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountManagerCode] [int] NULL,
	[ConsultancyRequestCreated] [datetime] NULL,
	[ConsultancyRequestProcessed] [datetime] NULL,
	[OnboardingRequestCreated] [datetime] NULL,
	[OnboardingRequestProcessed] [datetime] NULL,
	[LatestHealthScore] [int] NULL,
	[FullCancellationRequestDate] [date] NULL,
	[Churned] [int] NULL,
	[DateSelectedForCall] [datetime] NULL,
	[DateSentToSales] [datetime] NULL
) ON [PRIMARY]
GO
