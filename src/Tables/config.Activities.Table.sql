USE [CustomerIntelligence]
GO
/****** Object:  Index [ClusteredIndex-20170118-163753]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [ClusteredIndex-20170118-163753] ON [config].[Activities] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [config].[Activities]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[Activities]
GO
/****** Object:  Table [config].[Activities]    Script Date: 24-sept.-18 14:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[Activities](
	[ActivityID] [int] NOT NULL,
	[ActivitySource] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityField] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityDetail] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateMethod] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityType] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityGroup] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivitySubGroup] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityDescription] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityAction] [int] NULL,
	[LogText] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DailyUsage] [int] NULL,
	[Onboarding] [int] NULL,
	[UpdateMethodProcedure] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstDate] [date] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedMonth] [date] NULL,
	[AccountancyBasic] [int] NULL,
	[AccountancyAdvanced] [int] NULL,
	[AccountancyPremium] [int] NULL,
	[AccountingBasic] [int] NULL,
	[AccountingAdvanced] [int] NULL,
	[AccountingPremium] [int] NULL,
	[WholesaleDistributionBasic] [int] NULL,
	[WholesaleDistributionAdvanced] [int] NULL,
	[WholesaleDistributionPremium] [int] NULL,
	[ProfessionalServicesBasic] [int] NULL,
	[ProfessionalServicesAdvanced] [int] NULL,
	[ProfessionalServicesPremium] [int] NULL,
	[ManufacturingBasic] [int] NULL,
	[ManufacturingAdvanced] [int] NULL,
	[NL] [int] NULL,
	[DE] [int] NULL,
	[FR] [int] NULL,
	[UK] [int] NULL,
	[BE] [int] NULL,
	[US] [int] NULL,
	[ES] [int] NULL,
	[Sequence] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [ClusteredIndex-20170118-163753]    Script Date: 24-sept.-18 14:20:58 ******/
CREATE CLUSTERED INDEX [ClusteredIndex-20170118-163753] ON [config].[Activities]
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
