/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4451)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [CustomerIntelligence]
GO
/****** Object:  User [EXACT-SOFTWARE\svcacct-ci-t-web-api]    Script Date: 14-juin-18 10:40:35 ******/
DROP USER IF EXISTS [EXACT-SOFTWARE\svcacct-ci-t-web-api]
GO
/****** Object:  User [EXACT-SOFTWARE\svcacct-ci-t-web-api]    Script Date: 14-juin-18 10:40:35 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'EXACT-SOFTWARE\svcacct-ci-t-web-api')
CREATE USER [EXACT-SOFTWARE\svcacct-ci-t-web-api] FOR LOGIN [EXACT-SOFTWARE\svcacct-ci-t-web-api] WITH DEFAULT_SCHEMA=[publish]
GO
