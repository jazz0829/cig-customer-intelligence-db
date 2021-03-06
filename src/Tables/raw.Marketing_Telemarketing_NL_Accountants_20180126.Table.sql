USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Marketing_Telemarketing_NL_Accountants_20180126]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Marketing_Telemarketing_NL_Accountants_20180126]
GO
/****** Object:  Table [raw].[Marketing_Telemarketing_NL_Accountants_20180126]    Script Date: 24-sept.-18 14:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Marketing_Telemarketing_NL_Accountants_20180126](
	[H-Key Telemarketing Agency] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Do Not Call] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[(KvK Nummer)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[(Achternaam 5)] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Establishment Number] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RSIN] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Legal Code] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Indicatie Starter] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bevoegd functionaris] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bevoegd functionaris geslacht] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bevoegd functionaris taal] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Corop Area Primary] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Affiliate Indicator] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
