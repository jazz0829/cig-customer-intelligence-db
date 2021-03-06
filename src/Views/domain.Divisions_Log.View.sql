USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Divisions_Log]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Divisions_Log]
GO
/****** Object:  View [domain].[Divisions_Log]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [domain].[Divisions_Log] AS
SELECT 
	Code as DivisionCode,
	Environment,
	Event,
	EventDate
FROM
(

SELECT 
	*,
	CASE			
		WHEN ROWNUMBER=1 AND CAST(CIGCopyTime as DATE)<>'2016-11-15' AND BlockingStatus='101' THEN 'StartDate'
		WHEN ROWNUMBER=1 AND ((CAST(CIGCopyTime as DATE)='2016-11-15' OR (CAST(CIGCopyTime as DATE)='2016-11-14' AND Environment='US'))) AND BlockingStatus='101' THEN 'StartDate'
				
		WHEN ROWNUMBER=2 AND CAST(CIGCopyTime as DATE)>'2016-11-15' AND BlockingStatus='101' AND Deleted IS NOT NULL THEN 'Deleted'
		WHEN ROWNUMBER=2 AND ((CAST(CIGCopyTime as DATE)>'2016-11-15' OR (CAST(CIGCopyTime as DATE)='2016-11-14' AND Environment='US'))) AND BlockingStatus='101' AND Deleted IS NOT NULL THEN 'Deleted'

		WHEN ROWNUMBER=2 AND CAST(CIGCopyTime as DATE)>'2016-11-15' AND EndDate IS NOT NULL AND EndDate<getdate() THEN 'Ended'
		WHEN ROWNUMBER=2 AND ((CAST(CIGCopyTime as DATE)>'2016-11-15' OR (CAST(CIGCopyTime as DATE)='2016-11-14' AND Environment='US'))) AND EndDate IS NOT NULL AND EndDate<getdate()THEN 'Ended'

		WHEN ROWNUMBER=2 AND CAST(CIGCopyTime as DATE)>'2016-11-15' AND BlockingStatus='101' THEN 'Blocked'
		WHEN ROWNUMBER=2 AND ((CAST(CIGCopyTime as DATE)>'2016-11-15' OR (CAST(CIGCopyTime as DATE)='2016-11-14' AND Environment='US'))) AND BlockingStatus='101' THEN 'Blocked'
		WHEN ROWNUMBER=3 AND CAST(CIGCopyTime as DATE)>'2016-11-15' AND BlockingStatus='101' THEN 'Blocked'

		WHEN ROWNUMBER=1 AND CAST(CIGCopyTime as DATE)<>'2016-11-15' THEN 'StartDate'
		WHEN ROWNUMBER=1 AND ((CAST(CIGCopyTime as DATE)='2016-11-15' OR (CAST(CIGCopyTime as DATE)='2016-11-14' AND Environment='US'))) THEN 'StartDate'

		WHEN BlockingStatus='101' AND LAG='0' AND Deleted>'1990-01-01' AND LAGDELETED IS NULL THEN 'Blocked&Deleted'
		WHEN BlockingStatus='101' AND LAG='0' AND EndDate>'1990-01-01' AND LAGENDDATE IS NULL THEN 'Blocked&Deleted'
		WHEN BlockingStatus='101' AND LAG='100' AND Deleted>'1990-01-01' THEN 'Blocked&Deleted'

		WHEN BlockingStatus='101' AND LAG='0' THEN 'Blocked'
		WHEN Status='1' AND LAGSTATUS='0' THEN 'Archived'
		WHEN Status='1' AND LAGSTATUS='999' THEN 'Archived' 
		WHEN Status='1' AND LAGSTATUS='1' THEN 'Archived'

		WHEN Deleted>'1990-01-01' AND LAGDELETED IS NULL THEN 'Deleted'
		WHEN EndDate>'1990-01-01' AND LAGENDDATE IS NULL THEN 'Ended'
	END As Event,
	CASE 
		WHEN ROWNUMBER=1 AND CAST(CIGCopyTime as DATE)<>'2016-11-15' AND syscreated<'2016-11-15' THEN syscreated
		WHEN ROWNUMBER=1 AND ((CAST(CIGCopyTime as DATE)='2016-11-15' AND Environment='US')) THEN  syscreated

		WHEN ROWNUMBER=2 AND CAST(CIGCopyTime as DATE)>'2016-11-15' AND BlockingStatus='101' AND Deleted IS NOT NULL THEN Deleted
		WHEN ROWNUMBER=2 AND ((CAST(CIGCopyTime as DATE)>'2016-11-15' AND Environment='US')) AND BlockingStatus='101' AND Deleted IS NOT NULL THEN Deleted

		WHEN ROWNUMBER=2 AND CAST(CIGCopyTime as DATE)>'2016-11-15'  AND EndDate IS NOT NULL AND EndDate<getdate() THEN EndDate
		WHEN ROWNUMBER=2 AND ((CAST(CIGCopyTime as DATE)>'2016-11-15' AND Environment='US')) AND EndDate IS NOT NULL AND EndDate<getdate() THEN EndDate

		WHEN ROWNUMBER=2 AND CAST(CIGCopyTime as DATE)>'2016-11-15' AND BlockingStatus='101' THEN sysmodified
		WHEN ROWNUMBER=2 AND ((CAST(CIGCopyTime as DATE)>'2016-11-15' OR (CAST(CIGCopyTime as DATE)='2016-11-14' AND Environment='US'))) AND BlockingStatus='101' THEN sysmodified
		WHEN ROWNUMBER=3 AND CAST(CIGCopyTime as DATE)>'2016-11-15' AND BlockingStatus='101' THEN sysmodified

		WHEN ROWNUMBER=1 AND CAST(CIGCopyTime as DATE)<>'2016-11-15' THEN syscreated
		WHEN ROWNUMBER=1 AND ((CAST(CIGCopyTime as DATE)='2016-11-15' OR (CAST(CIGCopyTime as DATE)='2016-11-14' AND Environment='US'))) THEN syscreated

		WHEN BlockingStatus='101' AND LAG='0' AND Deleted>'1990-01-01' AND LAGDELETED IS NULL THEN Deleted
		WHEN BlockingStatus='101' AND LAG='0' AND EndDate>'1990-01-01' AND LAGENDDATE IS NULL THEN EndDate
		WHEN BlockingStatus='101' AND LAG='100' AND Deleted>'1990-01-01' THEN Deleted

		WHEN BlockingStatus='101' AND LAG='0' THEN CIGCopyTime
		WHEN Status='1' AND LAGSTATUS='0' THEN CIGCopyTime
		WHEN Status='1' AND LAGSTATUS='999' THEN sysmodified
		WHEN Status='1' AND LAGSTATUS='1' THEN sysmodified

		WHEN Deleted>'1990-01-01' AND LAGDELETED IS NULL THEN Deleted
		WHEN EndDate>'1990-01-01' AND LAGENDDATE IS NULL THEN EndDate
	END AS EventDate

FROM
(

		Select 
			Code,
			Environment,
			CIGCopyTime,
			Blockingstatus,
			syscreated,
			sysmodified,
			Lag(Blockingstatus,1,999) OVER (Partition BY Code, Environment ORDER BY Code, Environment, CIGCopyTime) AS LAG,
			Lead(Blockingstatus,1,999) OVER (Partition BY Code, Environment ORDER BY Code, Environment, CIGCopyTime) AS LEAD,
			Status,
			Lag(Status,1,999) OVER (Partition BY Code, Environment ORDER BY Code, Environment, CIGCopyTime ) AS LAGSTATUS,
			Lead(Status,1,999) OVER (Partition BY Code, Environment ORDER BY Code, Environment, CIGCopyTime ) AS LEADSTATUS,
			Deleted,
			Lag(Deleted,1,'1900-01-01') OVER (Partition BY Code, Environment ORDER BY Code, Environment, CIGCopyTime ) AS LAGDELETED,
			Lead(Deleted,1,'1900-01-01') OVER (Partition BY Code, Environment ORDER BY Code, Environment, CIGCopyTime ) AS LEADDELETED,
			EndDate,
			Lag(EndDate,1,'1900-01-01') OVER (Partition BY Code, Environment ORDER BY Code, Environment, CIGCopyTime ) AS LAGENDDATE,
			Lead(EndDate,1,'1900-01-01') OVER (Partition BY Code, Environment ORDER BY Code, Environment, CIGCopyTime ) AS LEADENDDATE,
			ROW_NUMBER() OVER (Partition BY Code, Environment ORDER BY CIGCopyTime) AS ROWNUMBER

		From raw.HOST_CIG_Divisions
		--WHERE BlockingStatus IN ('0', '101', '100')
		--WHERE Code='1629101'
		

		--ORDER BY Code, Environment, CIGCopyTime desc

)SUB
WHERE 
	((BlockingStatus='101' AND LAG<='100') 
	OR (BlockingStatus='0' AND LAG='999') 
	OR (Status='1' AND LAGSTATUS='0' AND( LEADSTATUS<>'0' OR LEADSTATUS='999') )
	OR (Status='0' AND LAGSTATUS='999') 
	OR (Status='1' AND LAGSTATUS='999') 
	OR (Deleted IS NOT NULL AND LAGDELETED IS NULL AND (LEADDELETED IS NOT NULL OR LEADDELETED='1900-01-01'))
	OR (Deleted IS NULL AND Deleted='1990-01-01') 
	OR (EndDate IS NOT NULL AND LAGENDDATE IS NULL AND (LEADENDDATE IS NOT NULL OR LEADENDDATE='1900-01-01'))
	OR (EndDate IS NULL AND LAGENDDATE='1990-01-01') 
	OR ROWNUMBER=1 OR ROWNUMBER=2)
--AND Code='1600050'
--AND Environment='NL'


) SUB1
WHERE Event IS NOT NULL
--AND Code='1629101'
--AND Environment='NL'
--order by Code, Environment, CIGCopyTime
GO
