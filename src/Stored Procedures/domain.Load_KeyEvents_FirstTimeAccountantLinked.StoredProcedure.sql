USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_FirstTimeAccountantLinked]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_KeyEvents_FirstTimeAccountantLinked]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_FirstTimeAccountantLinked]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-05-18
-- Description:	Load procedure to fill the table domain.KeyEvents with FirstTimeAccountantLinked event
-- =============================================
CREATE PROCEDURE [domain].[Load_KeyEvents_FirstTimeAccountantLinked]
AS
BEGIN

--Table with AccountID's that have a commercial contract
WITH CTE_A
AS
	(
	SELECT
	ACS.Environment
	, ACS.AccountCode
	, ACS.AccountID
	, ACS.FirstTrialStartDate
	, ACS.FirstCommStartDate
	FROM domain.AccountsContract_Summary ACS
	INNER JOIN domain.Accounts A
	ON ACS.AccountID = A.AccountID
)

--Table that searches for the minimum date coming from the datasources
,CTE_C
AS
	(
	SELECT MIN(SUB.MaxDate) AS MaxDate
	FROM(
		SELECT MAX(Date) AS MaxDate
		FROM domain.LinkedAccountantLog
		) SUB
	)

------------------------

INSERT INTO domain.KeyEvents_All (AccountID,[Key Event],[Key Event timestamp], [InsertedDatetime])

		SELECT
			CTE_A.AccountID
			, 'First Time Accountant Linked' AS KeyEvent
			, MIN(CAST(LAL.[Date] AS DATETIME)) AS KeyEventDateTime
			, Getdate() AS InsertedDatetime
		FROM CTE_A
		INNER JOIN domain.LinkedAccountantLog LAL
			ON LAL.Environment = CTE_A.Environment
			AND LAL.AccountCode = CTE_A.AccountCode
--Checks if the AccountID already exists in the table
WHERE
--NOT EXISTS(SELECT * FROM domain.KeyEvents_All KEA WHERE [Key Event]='First Time Accountant Linked' AND CTE_A.AccountID=KEA.AccountID) AND 

LinkStatus='Accountant Linked'

GROUP BY CTE_A.AccountID
;


DELETE A
FROM (
SELECT ROW_NUMBER() OVER (PARTITION BY AccountID, Environment, DivisionCode, UserID, [Key Event] ORDER BY [Key Event timestamp] desc) as rownumber, *
FROM domain.KeyEvents_All
WHERE [Key Event]='First Time Accountant Linked') A
WHERE A.rownumber>1

--Updates the LastUpdated date

UPDATE config.KeyEvents_All_LastUpdated
SET LastUpdated=(Select Max([Key Event timestamp]) From domain.KeyEvents_All WHERE [Key Event]='First Time Accountant Linked')
WHERE [Key Event]='First Time Accountant Linked'

END
GO
