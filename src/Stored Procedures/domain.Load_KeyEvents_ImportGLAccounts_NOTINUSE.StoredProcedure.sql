USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_ImportGLAccounts_NOTINUSE]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_KeyEvents_ImportGLAccounts_NOTINUSE]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_ImportGLAccounts_NOTINUSE]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-05-08
-- Description:	Load procedure to fill the table domain.KeyEvents with Import GLAccounts event
-- =============================================
CREATE PROCEDURE [domain].[Load_KeyEvents_ImportGLAccounts_NOTINUSE]
AS
BEGIN

--Table that searches for the minimum date coming from the datasources
WITH CTE_C
AS
	(
	SELECT MIN(SUB.MaxDate) AS MaxDate
	FROM(
		SELECT MAX(LogDateTime) AS MaxDate
		FROM raw.EOLActivityLog
		UNION
		SELECT MAX(CigCopyTime) AS MaxDate
		FROM raw.HOST_CIG_DivisionStatistics
		) SUB
	)
	
------------------------

INSERT INTO domain.KeyEvents_All_TEST

Select 
	AccountID, 
	al.Environment,  
	AdministrationCode,
	UserID, 
	'Import GLAccounts' AS KeyEvent,
	Max(LogDateTime) AS MaxDate,
	GETDATE(),
	SUB.GLAccountCount
FROM raw.EOLActivityLog al

LEFT JOIN 
	(
		SELECT DivisionCode, Environment, Date, GLAccountCount
		FROM domain.DivisionStatistics_DailyChanges
		WHERE GLAccountCount > 0
	) SUB
ON al.AdministrationCode=SUB.DivisionCode AND al.Environment=SUB.Environment AND (Cast(LogDateTime as Date)=SUB.Date OR Cast(LogDateTime as Date)=DATEADD(day,1,SUB.Date))

WHERE ((al.App='FinGLAccountsImport.aspx' AND al.Action = '202') OR (al.App='XMLUpload.aspx' AND al.LogText LIKE 'Topic=GLAccounts%' AND Action='202')) AND LogDateTime>'2016-11-14'

--AND al.LogDateTime <= (Select MIN(MaxDate) From CTE_C)
--AND al.LogDateTime > (Select LastUpdated FROM config.KeyEvents_All_LastUpdated WHERE [Key Event]='Import GLAccounts')  

GROUP BY 
	AccountID, 
	al.Environment, 
	AccountCode, 
	AdministrationCode,
	UserID, 
	CAST(LogDateTime AS DATE),
	SUB.GLAccountCount
ORDER BY AccountID, AccountCode, AdministrationCode, UserID       

--Updates the LastUpdated date
--UPDATE config.KeyEvents_All_LastUpdated
--SET LastUpdated=(Select Max([Key Event timestamp]) From domain.KeyEvents_All_TEST WHERE [Key Event]='Import GLAccounts')
--WHERE [Key Event]='Import GLAccounts'

END
GO
