USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_FirstAccountCard]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_KeyEvents_FirstAccountCard]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_FirstAccountCard]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-05-08
-- Description:	Load procedure to fill the table domain.KeyEvents with FirstAccountCard event
-- =============================================
CREATE PROCEDURE [domain].[Load_KeyEvents_FirstAccountCard]
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
		--SELECT MAX(LogDateTime) AS MaxDate
		--FROM raw.EOLActivityLog
		--UNION
		SELECT MAX(CigCopyTime) AS MaxDate
		FROM raw.HOST_CIG_DivisionStatistics
		) SUB
	)
	
------------------------

INSERT INTO domain.KeyEvents_All (AccountID, Environment,DivisionCode,[Key Event],[Key Event timestamp],InsertedDatetime)

SELECT
        CTE_A.AccountID
		, CTE_A.Environment AS Environment
		, D.DivisionCode AS DivisionCode
		--, al.UserID As UserID
        , 'First Account Card' AS KeyEvent
		, 
		--	CASE 
		--	WHEN CAST(MIN(FirstAccountCard) as DATE) = CAST(COALESCE(MAX(al.LogDateTime), GETDATE()) AS DATE)
		--	THEN MIN(al.LogDateTime) 
		--	ELSE 
		MIN(FirstAccountCard) 
		--END AS KeyEventDate
		, Getdate() AS InsertedDatetime
FROM CTE_A  
 
JOIN domain.Divisions D
ON D.AccountID = CTE_A.AccountID   

--Joins the DivisionStatisticsDaily table to find the first date of the Key Event   
JOIN                               
    (      
	SELECT *
	FROM
            (
			SELECT
                    DSD.Environment
                    , DSD.DivisionCode
                    , MIN([Date]) AS FirstAccountCard                         
            FROM domain.DivisionStatistics_Daily DSD

			JOIN domain.Divisions D
			ON DSD.DivisionCode = D.DivisionCode AND DSD.Environment=D.Environment

			JOIN domain.Accounts A
			ON D.AccountID = A.AccountID

            WHERE 
					AccountCount > 0 

            GROUP BY
                    DSD.Environment
                    , DSD.DivisionCode
			) SUB
	WHERE SUB.FirstAccountCard<=(Select MIN(MaxDate) From CTE_C)
	AND SUB.FirstAccountCard>(Select LastUpdated FROM config.KeyEvents_All_LastUpdated WHERE [Key Event]='First Account Card')                         
    ) DSD
ON D.Environment = DSD.Environment AND D.DivisionCode = DSD.DivisionCode

--Joins the ActivityLog table to find the time on the day where the key event appeared        
--LEFT OUTER JOIN [raw].EOLActivityLog al
--ON al.AccountID = d.AccountID
--    AND al.App IN ('CRMAccountCard.aspx', 'CRMAccount.aspx')
--	AND al.Action = '6'
--    AND al.LogDateTime < DATEADD(Day, 1, (DSD.FirstAccountCard)) 
--	AND al.LogDateTime >= DATEADD(Day, -1, (DSD.FirstAccountCard))   
--    AND DSD.DivisionCode = AL.AdministrationCode 
--	AND LogDateTime<=(Select MIN(MaxDate) From CTE_C)
--	AND LogDateTime>(Select LastUpdated FROM config.KeyEvents_All_LastUpdated WHERE [Key Event]='First Account Card') --Checks only the date between the lastupdated datetime and the minimum date coming from CTE_C

--Checks if the DivisionCode already is in the table
--WHERE 
--NOT EXISTS(SELECT * FROM domain.KeyEvents_All KEA WHERE [Key Event]='First Account Card' AND D.DivisionCode=KEA.DivisionCode AND D.Environment=KEA.Environment)
	            
GROUP BY CTE_A.AccountID, DSD.FirstAccountCard, CTE_A.Environment, D.DivisionCode--, al.UserID
END

DELETE A
FROM (
SELECT ROW_NUMBER() OVER (PARTITION BY AccountID, Environment, DivisionCode,UserID, [Key Event] ORDER BY [Key Event timestamp] desc) as rownumber, *
FROM domain.KeyEvents_All
WHERE [Key Event]='First Account Card') A
WHERE A.rownumber>1

;
--Updates the LastUpdated date
UPDATE config.KeyEvents_All_LastUpdated
SET LastUpdated=(Select Max([Key Event timestamp]) From domain.KeyEvents_All WHERE [Key Event]='First Account Card')
WHERE [Key Event]='First Account Card'

GO
