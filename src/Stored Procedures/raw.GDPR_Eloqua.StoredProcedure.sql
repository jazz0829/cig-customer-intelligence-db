USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[GDPR_Eloqua]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[GDPR_Eloqua]
GO
/****** Object:  StoredProcedure [raw].[GDPR_Eloqua]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 22-05-2018
-- Description:	
-- =============================================
CREATE PROCEDURE [raw].[GDPR_Eloqua]

AS
BEGIN
-- DELETE ELOQUA ACCOUNTS WHERE WE DO NOT HAVE AN EOL ACCOUNTID 
-- This deletes any records from the raw.Eloqua accounts table that we do not have an EOL AccountID for
-- These are considered early stage leads and as we cannot match these back to an EOL record it is almost impossible for us to check whether they would exist still/have been modified in Eloqua.
--DELETE A
--FROM [raw].Eloqua_Accounts A  
--INNER JOIN
--	(
--		SELECT *
--		FROM [raw].Eloqua_Accounts
--		WHERE 
--			EOLAccountID IS NULL
--			AND DateModified < (SELECT MAX(BackupDateTime)  -- Only selects records to be deleted without an AccountID that were modified before the most recent backup from EOL. This is due to the difference in when we receive data from the different systems.
--								FROM config.EOLHosting_BackupRestore_Summary) 
--	) NoIDs
--ON A.EmailAddress = NoIDs.EmailAddress   -- match done on email address as this is the primary key on which Eloqua is based on
--AND A.DateModified=NoIDs.DateModified

-- DELETE ELOQUA CONTACTS WHERE THERE IS NO EOL ACCOUNTID FIELD
DELETE C
FROM [raw].Eloqua_Contacts C  
INNER JOIN
	(
		SELECT *
		FROM [raw].Eloqua_Contacts 
		WHERE 
			EOLAccountID IS NULL
			AND DateModified < (SELECT MAX(BackupDateTime)  -- Only selects records to be deleted without an AccountID that were modified before the most recent backup from EOL. This is due to the difference in when we receive data from the different systems.
								FROM config.EOLHosting_BackupRestore_Summary) 
	) NoIDs
ON C.EmailAddress = NoIDs.EmailAddress   -- match done on email address as this is the primary key on which Eloqua is based on
AND C.DateModified=NoIDs.DateModified



---- DELETE EOL ACTIVITIES BOUNCEBACKS
---- Deletes any Eloqua Subscription Activities where there is no corresponding email in the Persons table
---- This will remove the activity of any early stage leads, as well as any persons who have been anonymized as email is then set to 'noreply@exact.com'
--DELETE EABounce
--FROM [raw].Eloqua_Activities_Bouncebacks EABounce  
--LEFT JOIN [raw].Persons_Email PE     
--	ON EABounce.EmailAddress = PE.Email
--WHERE PE.Email IS NULL   -- deletes all Activities bounceback records where there is no corresponding email address in the persons table


---- DELETE EOL ACTIVITIES EMAIL CLICKTHROUGHS
---- Deletes any Eloqua EmailsClickedThrough Activities where there is no corresponding email in the Persons table
---- This will remove the activity of any early stage leads, as well as any persons who have been anonymized as email is then set to 'noreply@exact.com'
--DELETE EAClick
--FROM [raw].Eloqua_Activities_EmailsClickedthrough EAClick   
--LEFT JOIN [raw].Persons_Email PE    
--	ON EAClick.EmailAddress = PE.Email
--WHERE PE.Email IS NULL   -- deletes all Activities clickthroughs records where there is no corresponding email address in the persons table


---- DELETE EOL ACTIVITIES EMAILS OPENED
---- Deletes any Eloqua EmailsOpened Activities where there is no corresponding email in the Persons table
---- This will remove the activity of any early stage leads, as well as any persons who have been anonymized as email is then set to 'noreply@exact.com'
--DELETE EAOpened
--FROM [raw].Eloqua_Activities_EmailsOpened  EAOpened   
--LEFT JOIN [raw].Persons_Email PE     
--	ON EAOpened.EmailAddress = PE.Email
--WHERE PE.Email IS NULL   -- deletes all Activities emails opened records where there is no corresponding email address in the persons table


---- DELETE EOL ACTIVITIES EMAILS SENT
---- Deletes any Eloqua Emails Sent Activities where there is no corresponding email in the Persons table
---- This will remove the activity of any early stage leads, as well as any persons who have been anonymized as email is then set to 'noreply@exact.com'
--DELETE EASent
--FROM [raw].Eloqua_Activities_EmailsSent  EASent 
--LEFT JOIN [raw].Persons_Email PE      --
--	ON EASent.EmailAddress = PE.Email
--WHERE PE.Email IS NULL   -- deletes all Activities emails sent records where there is no corresponding email address in the persons table


---- SET IP ADDRESS IN THE ELOQUA ACTIVITIES FORM SUBMIT TABLE TO NULL
---- This personal data is not needed, so it is being stripped out
--UPDATE [raw].[Eloqua_Activities_PageViews]   
--SET IpAddress = NULL 

---- SET IP ADDRESS IN THE ELOQUA ACTIVITIES PAGE VIEW TABLE TO NULL
---- This personal data is not needed, so it is being stripped out
--UPDATE [raw].[Eloqua_Activities_FormSubmits]    
--SET RawData = NULL 


---- DELETE EOL ACTIVITIES SUBSCRIPTIONS
---- Deletes any Eloqua Subscription Activities where there is no corresponding email in the Persons table
---- This will remove the activity of any early stage leads, as well as any persons who have been anonymized as email is then set to 'noreply@exact.com'
--DELETE EAS
--FROM [raw].Eloqua_Activities_Subscriptions EAS  
--LEFT JOIN [raw].Persons_Email PE 
--	ON EAS.EmailAddress = PE.Email
--WHERE PE.Email IS NULL   -- deletes all Activities Subscriptions records where there is no corresponding email address in the persons table


---- DELETE EOL ACTIVITIES UNSUBSCRIBES
---- Deletes any Eloqua Unsubscription Activities where there is no corresponding email in the Persons table
---- This will remove the activity of any early stage leads, as well as any persons who have been anonymized as email is then set to 'noreply@exact.com'
--DELETE EAUnsub
--FROM [raw].Eloqua_Activities_Unsubscriptions EAUnsub   
--LEFT JOIN [raw].Persons_Email PE      
--	ON EAUnsub.EmailAddress = PE.Email
--WHERE PE.Email IS NULL   -- deletes all Activities Unsubscriptions records where there is no corresponding email address in the persons table

END
GO
