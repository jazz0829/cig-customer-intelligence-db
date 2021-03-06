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
/****** Object:  User [EXACT-SOFTWARE\SvcAcctCIPSQLJobs]    Script Date: 14-juin-18 10:40:35 ******/
DROP USER IF EXISTS [EXACT-SOFTWARE\SvcAcctCIPSQLJobs]
GO
/****** Object:  User [EXACT-SOFTWARE\SvcAcctCIPSQLJobs]    Script Date: 14-juin-18 10:40:35 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'EXACT-SOFTWARE\SvcAcctCIPSQLJobs')
CREATE USER [EXACT-SOFTWARE\SvcAcctCIPSQLJobs] FOR LOGIN [EXACT-SOFTWARE\SvcAcctCIPSQLJobs] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [EXACT-SOFTWARE\SvcAcctCIPSQLJobs]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [EXACT-SOFTWARE\SvcAcctCIPSQLJobs]
GO
