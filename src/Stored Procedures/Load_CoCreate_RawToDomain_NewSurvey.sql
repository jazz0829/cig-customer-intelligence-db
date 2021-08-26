USE [CustomerIntelligence]
GO

/****** Object:  StoredProcedure [domain].[Load_CoCreate_RawToDomain_NewSurvey]    Script Date: 08-Nov-18 17:39:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Levon Goceryan
-- Create date: 2018-11-08
-- Description:	Load the new survey CoCreate data from the raw table to the domain table
-- =============================================
ALTER PROCEDURE [domain].[Load_CoCreate_RawToDomain_NewSurvey] 
AS
TRUNCATE TABLE [CustomerIntelligence].[domain].[Relationshipsurvey_New]
BEGIN

INSERT INTO [CustomerIntelligence].[domain].[Relationshipsurvey_New]
(      [Record ID]
      ,[Salutation ]
      ,[Title]
      ,[Description]
      ,[Firstname]
      ,[MiddleName]
      ,[Lastname]
      ,[Gender]
      ,[Initials]
      ,[Usertype]
      ,[Language]
      ,[email]
      ,[phone]
      ,[LastLogin]
      ,[Maincontact]
      ,[Customer_code]
      ,[Customer_name]
      ,[Classification]
      ,[CustomerSince]
      ,[Tenure_in_Months]
      ,[CustomerSinceMonth]
      ,[CompanySize]
      ,[Sector]
      ,[Subsector]
      ,[Country]
      ,[Source]
      ,[Accountant_code]
      ,[Accountant_name]
      ,[Reseller_code]
      ,[Reseller_name]
      ,[DatabaseID]
      ,[IsAccountant]
      ,[Blocked]
      ,[IsPilot]
      ,[IsReseller]
      ,[Number_companies]
      ,[Number_users]
      ,[Package]
      ,[Businessline]
      ,[Solution]
      ,[MRR]
      ,[Conversionrequests]
      ,[Consultrequests]
      ,[Supportrequests]
      ,[Startdate user]
      ,[User in months]
      ,[Startdate package]
      ,[Package in months]
      ,[Hosting environment]
      ,[Export date]
      ,[Contract end date]
      ,[Office]
      ,[Address1]
      ,[Address2]
      ,[Address3]
      ,[Inactive user]
      ,[Website]
      ,[Twitter]
      ,[Linkedin]
      ,[Consult date]
      ,[App center]
      ,[Name consultant]
      ,[Privacy]
      ,[Disclaimer]
      ,[Consult package]
      ,[Accountmanager code]
      ,[Accountmanager name]
      ,[NPS]
      ,[NPS promoter verbatim]
      ,[NPS passive verbatim]
      ,[NPS detractor verbatim]
      ,[Positive referral]
      ,[Negative referral]
      ,[PMF]
      ,[PMF not - verbatim]
      ,[PMF somewhat - verbatim]
      ,[PMF very - verbatim]
      ,[Like 1]
      ,[Like 1 - verbatim]
      ,[Product functionality 1]
      ,[Like 1 - other]
      ,[Like 2]
      ,[Like 2 - verbatim]
      ,[Like 2 - Other]
      ,[Like 3]
      ,[Like 3 - verbatim]
      ,[Product functionality 3]
      ,[Like 3 - other]
      ,[Product functionality 2]
      ,[Dislike 1]
      ,[Dislike 1 - verbatim]
      ,[Product functionality [Q27]]]
      ,[Dislike 1 - other]
      ,[Dislike 2]
      ,[Dislike 2 - verbatim]
      ,[Product functionality [Q28]]]
      ,[Dislike 2 - other]
      ,[Dislike 3]
      ,[Dislike 3 - verbatim]
      ,[Product functionality]
      ,[Dislike 3 - other]
      ,[panelistid]
      ,[started]
      ,[completed]
      ,[branched_out]
      ,[over_quota]
      ,[modified]
      ,[invite_status]
      ,[campaign_status]
      ,[culture]
      ,[user_key1]
      ,[user_key2]
      ,[user_key3]
      ,[http_referer]
      ,[http_user_agent]
      ,[remote_addr]
      ,[remote_host]
      ,[initial_date]
      ,[initial_status]
      ,[reminder1_date]
      ,[reminder1_status]
      ,[reminder2_date]
      ,[reminder2_status]
      ,[reminder3_date]
      ,[reminder3_status]
      ,[reminder4_date]
      ,[reminder4_status]
      ,[thankyou_date]
      ,[thankyou_status]
      ,[close_date]
      ,[last_page]
      ,[fi_loaded]
      ,[last_page_number]
      ,[modifier]
      ,[device_type]
      ,[ua_family]
      ,[ua_majorver]
      ,[os_name]
      ,[os_family]
      ,[iploc_long]
      ,[iploc_lat]
      ,[iploc_city]
      ,[iploc_state]
      ,[iploc_country]
      ,[iploc_zipcode]
	  ,[Refreshdate]
	  )
	  select 
[recordid] as [Record ID],
[Q35_1] as 'Salutation ',
[Q36_1] as 'Title',
[Q36_2] as 'Description',
[Q36_3] as 'Firstname',
[Q36_4] as 'MiddleName',
[Q36_5] as 'Lastname',
[Q36_6] as 'Gender',
[Q36_7] as 'Initials',
[Q36_8] as 'Usertype',
[Q36_9] as 'Language',
[Q36_10] as 'email',
[Q36_11] as 'phone',
[Q36_12] as 'LastLogin',
[Q36_13] as 'Maincontact',
[Q36_14] as 'Customer_code',
[Q36_15] as 'Customer_name',
[Q36_16] as 'Classification',
[Q36_17] as 'CustomerSince',
[Q36_18] as 'Tenure_in_Months',
[Q36_19] as 'CustomerSinceMonth',
[Q36_20] as 'CompanySize',
[Q36_21] as 'Sector',
[Q36_22] as 'Subsector',
[Q36_23] as 'Country',
[Q36_24] as 'Source',
[Q36_25] as 'Accountant_code',
[Q36_26] as 'Accountant_name',
[Q36_27] as 'Reseller_code',
[Q36_28] as 'Reseller_name',
[Q36_29] as 'DatabaseID',
[Q36_30] as 'IsAccountant',
[Q36_31] as 'Blocked',
[Q36_32] as 'IsPilot',
[Q36_33] as 'IsReseller',
[Q36_34] as 'Number_companies',
[Q36_35] as 'Number_users',
[Q36_36] as 'Package',
[Q36_37] as 'Businessline',
[Q36_38] as 'Solution',
[Q36_39] as 'MRR',
[Q36_40] as 'Conversionrequests',
[Q36_41] as 'Consultrequests',
[Q36_42] as 'Supportrequests',
[Q37_1] as 'Startdate user',
[Q37_2] as 'User in months',
[Q37_3] as 'Startdate package',
[Q37_4] as 'Package in months',
[Q37_5] as 'Hosting environment',
[Q37_6] as 'Export date',
[Q38_1] as 'Contract end date',
[Q39_1] as 'Office',
[Q39_2] as 'Address1',
[Q39_3] as 'Address2',
[Q39_4] as 'Address3',
[Q39_5] as 'Inactive user',
[Q39_6] as 'Website',
[Q39_7] as 'Twitter',
[Q39_8] as 'Linkedin',
[Q39_9] as 'Consult date',
[Q39_10] as 'App center',
[Q39_11] as 'Name consultant',
[Q39_12] as 'Privacy',
[Q39_13] as 'Disclaimer',
[Q39_14] as 'Consult package',
[Q40_1] as 'Accountmanager code',
[Q40_2] as 'Accountmanager name',
[Q7] as 'NPS',
[Q8] as 'NPS promoter verbatim',
[Q9] as 'NPS passive verbatim',
[Q10] as 'NPS detractor verbatim',
case [Q11]
	WHEN '0' THEN '0' 
	WHEN '1' THEN '1' 
	WHEN '2' THEN '2' 
	WHEN '3' THEN '3' 
	WHEN '4' THEN '4' 
	WHEN '5' THEN '5' 
	WHEN '6' THEN '6' 
	WHEN '7' THEN '7' 
	WHEN '8' THEN '8' 
	WHEN '9' THEN '9' 
	WHEN '10' THEN '10' 
	WHEN '11' THEN '11+' 
	else [Q11] END as  'Positive referral',
CASE [Q31]
	WHEN '0' THEN '0' 
	WHEN '1' THEN '1' 
	WHEN '2' THEN '2' 
	WHEN '3' THEN '3' 
	WHEN '4' THEN '4' 
	WHEN '5' THEN '5' 
	WHEN '6' THEN '6' 
	WHEN '7' THEN '7' 
	WHEN '8' THEN '8' 
	WHEN '9' THEN '9' 
	WHEN '10' THEN '10' 
	WHEN '11' THEN '11+' 
	else [Q11] END as  'Negative referral',
CASE [Q20] 
	WHEN '1' THEN 'Not disappointed'
	WHEN '2' THEN 'Somewhat disappointed'
	WHEN '3' THEN 'Very disappointed'
	else [Q20] END as 'PMF',
[Q21] as 'PMF not - verbatim',
[Q22] as 'PMF somewhat - verbatim',
[Q23] as 'PMF very - verbatim',
CASE [Q1] 
	WHEN '1' THEN 'Contact with sales team' 
	WHEN '2' THEN 'Contact with support team' 
	WHEN '3' THEN 'Exact Support - Community' 
	WHEN '4' THEN 'Exact Support - Ideas' 
	WHEN '5' THEN 'Exact Support - Knowledge base' 
	WHEN '6' THEN 'Consultancy' 
	WHEN '7' THEN 'Getting started' 
	WHEN '8' THEN 'Product - app center' 
	WHEN '9' THEN 'Product - performance' 
	WHEN '10' THEN 'Product - ease of use' 
	WHEN '11' THEN 'Product - functionality' 
	WHEN '12' THEN 'Product - value for money' 
	WHEN '13' THEN 'Continuous improvement and innovation' 
	WHEN '14' THEN 'Training/e-learning' 
	WHEN '15' THEN 'Communication' 
	WHEN '16' THEN 'Nothing' 
	WHEN '17' THEN 'Other' 
	ELSE [Q1] END as 'Like 1',
[Q2] as 'Like 1 - verbatim',
[Q25] as 'Product functionality 1',
[Q34] as 'Like 1 - other',
CASE [Q3] 
	WHEN '1' THEN 'Contact with sales team' 
	WHEN '2' THEN 'Contact with support team' 
	WHEN '3' THEN 'Exact Support - Community' 
	WHEN '4' THEN 'Exact Support - Ideas' 
	WHEN '5' THEN 'Exact Support - Knowledge base' 
	WHEN '6' THEN 'Consultancy' 
	WHEN '7' THEN 'Getting started' 
	WHEN '8' THEN 'Product - app center' 
	WHEN '9' THEN 'Product - performance' 
	WHEN '10' THEN 'Product - ease of use' 
	WHEN '11' THEN 'Product - functionality' 
	WHEN '12' THEN 'Product - value for money' 
	WHEN '13' THEN 'Continuous improvement and innovation' 
	WHEN '14' THEN 'Training/e-learning' 
	WHEN '15' THEN 'Communication' 
	WHEN '16' THEN 'Nothing' 
	WHEN '17' THEN 'Other' 
	ELSE [Q3] END as 'Like 2',
[Q4] as 'Like 2 - verbatim',
[Q33] as 'Like 2 - Other',
CASE [Q5] 
	WHEN '1' THEN 'Contact with sales team' 
	WHEN '2' THEN 'Contact with support team' 
	WHEN '3' THEN 'Exact Support - Community' 
	WHEN '4' THEN 'Exact Support - Ideas' 
	WHEN '5' THEN 'Exact Support - Knowledge base' 
	WHEN '6' THEN 'Consultancy' 
	WHEN '7' THEN 'Getting started' 
	WHEN '8' THEN 'Product - app center' 
	WHEN '9' THEN 'Product - performance' 
	WHEN '10' THEN 'Product - ease of use' 
	WHEN '11' THEN 'Product - functionality' 
	WHEN '12' THEN 'Product - value for money' 
	WHEN '13' THEN 'Continuous improvement and innovation' 
	WHEN '14' THEN 'Training/e-learning' 
	WHEN '15' THEN 'Communication' 
	WHEN '16' THEN 'Nothing' 
	WHEN '17' THEN 'Other' 
	ELSE [Q5] END as 'Like 3',
[Q6] as 'Like 3 - verbatim',
[Q24] as 'Product functionality 3',
[Q19] as 'Like 3 - other',
[Q26] as 'Product functionality 2',
CASE [Q12] 
	WHEN '1' THEN 'Contact with sales' 
	WHEN '2' THEN 'Contact with support' 
	WHEN '3' THEN 'Exact Support - Community' 
	WHEN '4' THEN 'Exact Support - Ideas' 
	WHEN '5' THEN 'Exact Support - Knowledge base' 
	WHEN '6' THEN 'Consultancy' 
	WHEN '7' THEN 'Getting started' 
	WHEN '8' THEN 'Product - ease of use' 
	WHEN '9' THEN 'Product - performance' 
	WHEN '10' THEN 'Product - functionality' 
	WHEN '11' THEN 'Product - value for money' 
	WHEN '12' THEN 'Continuous changes in the product' 
	WHEN '13' THEN 'Training/e-learning' 
	WHEN '14' THEN 'Communication' 
	WHEN '15' THEN 'Invoices from Exact' 
	WHEN '16' THEN 'Nothing' 
	WHEN '17' THEN 'Other' 
	ELSE [Q12] END as 'Dislike 1',
[Q13] as 'Dislike 1 - verbatim',
[Q27] as 'Product functionality [Q27]',
[Q32] as 'Dislike 1 - other',
CASE [Q14] 
	WHEN '1' THEN 'Contact with sales' 
	WHEN '2' THEN 'Contact with support' 
	WHEN '3' THEN 'Exact Support - Community' 
	WHEN '4' THEN 'Exact Support - Ideas' 
	WHEN '5' THEN 'Exact Support - Knowledge base' 
	WHEN '6' THEN 'Consultancy' 
	WHEN '7' THEN 'Getting started' 
	WHEN '8' THEN 'Product - ease of use' 
	WHEN '9' THEN 'Product - performance' 
	WHEN '10' THEN 'Product - functionality' 
	WHEN '11' THEN 'Product - value for money' 
	WHEN '12' THEN 'Continuous changes in the product' 
	WHEN '13' THEN 'Training/e-learning' 
	WHEN '14' THEN 'Communication' 
	WHEN '15' THEN 'Invoices from Exact' 
	WHEN '16' THEN 'Nothing' 
	WHEN '17' THEN 'Other' 
	ELSE [Q14] END as 'Dislike 2',
[Q15] as 'Dislike 2 - verbatim',
[Q28] as 'Product functionality [Q28]',
[Q30] as 'Dislike 2 - other',
CASE [Q16] 
	WHEN '1' THEN 'Contact with sales' 
	WHEN '2' THEN 'Contact with support' 
	WHEN '3' THEN 'Exact Support - Community' 
	WHEN '4' THEN 'Exact Support - Ideas' 
	WHEN '5' THEN 'Exact Support - Knowledge base' 
	WHEN '6' THEN 'Consultancy' 
	WHEN '7' THEN 'Getting started' 
	WHEN '8' THEN 'Product - ease of use' 
	WHEN '9' THEN 'Product - performance' 
	WHEN '10' THEN 'Product - functionality' 
	WHEN '11' THEN 'Product - value for money' 
	WHEN '12' THEN 'Continuous changes in the product' 
	WHEN '13' THEN 'Training/e-learning' 
	WHEN '14' THEN 'Communication' 
	WHEN '15' THEN 'Invoices from Exact' 
	WHEN '16' THEN 'Nothing' 
	WHEN '17' THEN 'Other' 
	ELSE [Q16] END as 'Dislike 3',
[Q17] as 'Dislike 3 - verbatim',
[Q29] as 'Product functionality',
[Q18] as 'Dislike 3 - other',
[panelistid],
[started],
[completed],
[branched_out],
[over_quota],
[modified],
[invite_status],
[campaign_status],
[culture],
[user_key1],
[user_key2],
[user_key3],
[http_referer],
[http_user_agent],
[remote_addr],
[remote_host],
[initial_date],
[initial_status],
[reminder1_date],
[reminder1_status],
[reminder2_date],
[reminder2_status],
[reminder3_date],
[reminder3_status],
[reminder4_date],
[reminder4_status],
[thankyou_date],
[thankyou_status],
[close_date],
[last_page],
[fi_loaded],
[last_page_number],
[modifier],
[device_type],
[ua_family],
[ua_majorver],
[os_name],
[os_family],
[iploc_long],
[iploc_lat],
[iploc_city],
[iploc_state],
[iploc_country],
[iploc_zipcode],
Getdate() as [Refreshdate]
FROM
CustomerIntelligence.raw.verint_Relationship_Survey (nolock)


END


GO


