USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[GDPR_Delete_Persons]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[GDPR_Delete_Persons]
GO
/****** Object:  StoredProcedure [raw].[GDPR_Delete_Persons]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 22-05-2018
-- Description:	
-- =============================================
CREATE PROCEDURE [raw].[GDPR_Delete_Persons]

AS
BEGIN
WITH CTE_P
AS
(	
	SELECT DISTINCT ID AS PersonID 
	FROM raw.HOST_CIG_Persons
	WHERE IsAnonymized='1'
)

--ADD NEW PERSONIDs TO THE LOG
INSERT INTO config.GDPR_PersonsDeletionLog (PersonID, DateTimeSelect)
SELECT PersonID, getdate()
FROM CTE_P
WHERE PersonID NOT IN (SELECT PersonID FROM config.GDPR_PersonsDeletionLog)

BEGIN TRY
BEGIN TRANSACTION
--DELETES HISTORY OF PERSONS TABLE RECORDS WHERE THE PERSON ISANONYMIZED, LEAVING ONLY THE LATEST ANONYMIZED RECORD
DELETE SUBP
FROM 
(
	SELECT *,
		ROW_NUMBER() OVER (Partition BY ID Order by CIGCopyTime desc) as RowNumber
	FROM raw.HOST_CIG_Persons
	WHERE ID IN (
					SELECT Distinct PersonID
					From config.GDPR_PersonsDeletionLog
					--WHERE Processed = 0 -- NOT IN USE ANYMORE
				)
) SUBP
WHERE RowNumber>1


--DELETES HISTORY OF USERS TABLE RECORDS WHERE THE PERSON ISANONYMIZED, LEAVING ONLY THE LATEST ANONYMIZED RECORD
DELETE SUBU
FROM 
(
	SELECT *,
		ROW_NUMBER() OVER (Partition BY ID Order by CIGCopyTime desc) as RowNumber
	FROM raw.HOST_CIG_Users
	WHERE Person IN (
					SELECT Distinct PersonID
					From config.GDPR_PersonsDeletionLog
					--WHERE Processed = 0 -- NOT IN USE ANYMORE
				)
) SUBU
WHERE RowNumber>1

-- DELETE SALESFORCE RAW USER RECORDS FOR ISANONYMIZED PERSONS
DELETE SF_Users_GDPR
FROM 
(
	SELECT *,
		ROW_NUMBER() OVER (Partition BY ID Order by ETLInsertTime desc, LastModifiedDate desc) as RowNumber
	FROM raw.Salesforce_User   -- NEED TO CHANGE TO REAL TABLE NAME
	WHERE UserID__c IN (
							SELECT DISTINCT CAST(U.UserID AS varchar(50))
							FROM config.GDPR_PersonsDeletionLog PDL
							INNER JOIN domain.Users U
								ON PDL.PersonID = U.PersonID
							--WHERE PDL.Processed = 0 -- NOT IN USE ANYMORE
						 )
) SF_Users_GDPR
WHERE RowNumber > 1  -- Deletes all records except the latest one 

-- DELETE SALESFORCE RAW CONTACT RECORDS FOR ISANONYMIZED PERSONS
DELETE SF_Contacts_GDPR
FROM 
(
	SELECT *,
		ROW_NUMBER() OVER (Partition BY ID Order by ETLInsertTime desc, LastModifiedDate desc) as RowNumber
	FROM raw.Salesforce_Contact  
	WHERE UserID__c IN (
							SELECT DISTINCT CAST(U.UserID AS varchar(50))
							FROM config.GDPR_PersonsDeletionLog PDL
							INNER JOIN domain.Users U
								ON PDL.PersonID = U.PersonID
							--WHERE PDL.Processed = 0 -- NOT IN USE ANYMORE
						)
) SF_Contacts_GDPR
WHERE RowNumber > 1  -- Deletes all records except the latest one 

-- DELETE ELOQUA CONTACT RAW RECORDS PRIOR TO A CONTACT BEING ANONYMIZED 
-- This deletes the history of any records (deltas) for Eloqua contacts that have not been anonymized. This leaves on the latest (post anonymized) records
DELETE ElqC
FROM [raw].Eloqua_Contacts ElqC     -- NEED TO CHANGE TO ACTUAL TABLE NAME
INNER JOIN
	(
		SELECT 
			eC.EOLContactID
			, eC.DateModified
			, ROW_NUMBER() OVER(PARTITION BY eC.EOLAccountID ORDER BY eC.DateModified DESC) AS RN  -- Orders by most recent date modified for any Eloqua Account that has been anonymized. This is used to delete any raw records that occur before this record.
		FROM [raw].Eloqua_Contacts eC    -- NEED TO CHANGE TO ACTUAL TABLE NAME
		INNER JOIN domain.Contacts C
			ON CAST(C.ContactID as varchar(50)) = eC.EOLContactID
		INNER JOIN config.GDPR_PersonsDeletionLog GDPRlog
			ON GDPRlog.PersonID = C.PersonID
		--WHERE GDPRlog.Processed = 0 -- NOT IN USE ANYMORE
	) ToDeleteEloqC
ON ToDeleteEloqC.EOLContactID = ElqC.EOLContactID
AND ToDeleteEloqC.DateModified = ElqC.DateModified
WHERE RN > 1  -- Only deletes records prior to the most recent record


-- Update PersonsDeletionLog
--UPDATE config.GDPR_PersonsDeletionLog
--SET Processed='1'
--WHERE Processed = 0

COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH



END
GO
