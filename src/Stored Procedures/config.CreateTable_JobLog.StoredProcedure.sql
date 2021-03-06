USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[CreateTable_JobLog]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[CreateTable_JobLog]
GO
/****** Object:  StoredProcedure [config].[CreateTable_JobLog]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [config].[CreateTable_JobLog] as


CREATE TABLE [config].[JobLog](
	[StartEndTime] [datetime] NULL,
	[Job] [nvarchar](60) NULL,
	[Action] [nvarchar](30) NULL		
)
CREATE CLUSTERED INDEX StartEndTime ON JobLog (StartEndTime)


GO
