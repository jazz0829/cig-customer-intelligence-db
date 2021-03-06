USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_Contact_Latest]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Salesforce_Contact_Latest]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_Contact_Latest]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-02-05
-- Description:	Load Procedure Latest Salesforce Table
-- =============================================
CREATE PROCEDURE [raw].[Load_Salesforce_Contact_Latest] 

AS
BEGIN 
TRUNCATE TABLE raw.Salesforce_Contact_Latest
END
BEGIN


	WITH Salesforce_Contact_Latest
		(
		Id, 
		FirstName,
		LastName, 
		AccountId, 
		CreatedDate, 
		IsDeleted, 
		IsEmailBounced, 
		LastActivityDate, 
		LastCURequestDate, 
		LastCUUpdateDate, 
		LastModifiedDate, 
		LastViewedDate, 
		Enddate__c, 
		UserID__c, 
		EOL_User__c, 
		Exact_ID__c, 
		Gender__c, 
		Language__c, 
		Startdate__c, 
		EtlInsertTime, 
		RN)
	AS 
	(
		SELECT 
			Id, 
			FirstName, 
			LastName, 
			AccountId, 
			CreatedDate, 
			IsDeleted, 
			IsEmailBounced,
			LastActivityDate, 
			LastCURequestDate, 
			LastCUUpdateDate, 
			LastModifiedDate, 
			LastViewedDate, 
			Enddate__c, 
			UserID__c, 
			EOL_User__c, 
			Exact_ID__c, 
			Gender__c, 
			Language__c, 
			Startdate__c, 
			EtlInsertTime,
			ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
		FROM [raw].Salesforce_Contact
	)


INSERT INTO raw.Salesforce_Contact_Latest
	(
	[Id], 
	[FirstName], 
	[LastName], 
	[AccountId], 
	[CreatedDate], 
	[IsDeleted], 
	[IsEmailBounced], 
	[LastActivityDate], 
	[LastCURequestDate], 
	[LastCUUpdateDate], 
	[LastModifiedDate], 
	[LastViewedDate], 
	[Enddate__c], 
	[UserID__c], 
	[EOL_User__c], 
	[Exact_ID__c], 
	[Gender__c], 
	[Language__c],
	[Startdate__c], 
	[EtlInsertTime]
	)
	SELECT  
	Id, 
	FirstName, 
	LastName, 
	AccountId, 
	CreatedDate, 
	IsDeleted, 
	IsEmailBounced, 
	LastActivityDate, 
	LastCURequestDate, 
	LastCUUpdateDate, 
	LastModifiedDate,
	LastViewedDate, 
	Enddate__c, 
	UserID__c, 
	EOL_User__c, 
	Exact_ID__c, 
	Gender__c, 
	Language__c, 
	Startdate__c, 
	EtlInsertTime
	FROM Salesforce_Contact_Latest
	WHERE RN = 1
END
GO
