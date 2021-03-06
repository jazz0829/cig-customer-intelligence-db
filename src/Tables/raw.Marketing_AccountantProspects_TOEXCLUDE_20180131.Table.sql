USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Marketing_AccountantProspects_TOEXCLUDE_20180131]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Marketing_AccountantProspects_TOEXCLUDE_20180131]
GO
/****** Object:  Table [raw].[Marketing_AccountantProspects_TOEXCLUDE_20180131]    Script Date: 24-sept.-18 14:22:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Marketing_AccountantProspects_TOEXCLUDE_20180131](
	[(KvK Nummer)] [float] NULL,
	[(Bedrijfsnaam)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Straat)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Adress] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Huisnummer)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Huisnummer ext#)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Postcode)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Woonplaats)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Straat handelsadres)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Huisnummer handelsadres)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Toevoeging huisnummer handelsadres)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Postcode handelsadres)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Plaats handelsadres)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Telefoonnummer)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Mobiel telefoon nummer)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Aantal werknemers)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Integratie datum)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Kredietwaardigheid)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Kredietlimiet)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Omzet)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Bedrijfstype)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Bedrijfstakcode)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Bedrijfstakbeschrijving)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Status onderneming)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(URL)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Initialen 1)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Achternaam 1)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Initialen 2)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Achternaam 2)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Initialen 3)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Achternaam 3)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Initialen 4)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Achternaam 4)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Initialen 5)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(Achternaam 5)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
