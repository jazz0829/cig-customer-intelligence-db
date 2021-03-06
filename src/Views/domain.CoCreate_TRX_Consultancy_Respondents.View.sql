USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[CoCreate_TRX_Consultancy_Respondents]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[CoCreate_TRX_Consultancy_Respondents]
GO
/****** Object:  View [domain].[CoCreate_TRX_Consultancy_Respondents]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [domain].[CoCreate_TRX_Consultancy_Respondents]
AS
SELECT
	[recordid] as [Record ID],
	[Q26_1] as [Title],
	[Q26_2] as [Description],
	[Q26_3] as [First Name],
	[Q26_4] as [Middle Name],
	[Q26_5] as [Last Name],
	CASE WHEN [Q26_6] = 'V' THEN 'F' ELSE Q26_6 END as [Gender],
	[Q26_7] as [Initials],
	[Q26_8] as [Usertype],
	[Q26_9] as [Language],
	[Q26_10] as [Email],
	[Q26_11] as [Phone],
	[Q26_12] as [Last Login],
	[Q26_13] as [Maincontact],
	[Q26_14] as [Account code],
	[Q26_15] as [Account name],
	[Q26_16] as [Classification],
	cast ([Q26_17] as datetime) as [Customer Since],
	[Q26_18] as [Tenure in Months],
	[Q26_19] as [Customer Since Month],
	CASE Q26_20
		WHEN 'Eenmansbedrijf' THEN '1'
		WHEN 'Eenmansbedriijf' THEN '1'
		WHEN '2 - 4 medewerkers' THEN '2 - 4'
		WHEN '5 - 9 medewerkers' THEN '5 - 9'
		WHEN '10 - 19 medewerkers' THEN '10 - 19'
		WHEN '20 - 49 medewerkers' THEN '20 - 49'
		WHEN '50 - 99 medewerkers' THEN '50 - 99'
		WHEN '100 - 499 medewerkers' THEN '100 - 499'
		WHEN '500 - 999 medewerkers' THEN '500 - 999'
		WHEN 'Vanaf 1000 medewerkers' THEN '1000 +'
		WHEN 'NULL' THEN NULL
		ELSE Q26_20 END AS [Company Size],
	[Q26_21] as [Sector],
	[Q26_22] as [Subsector],
	[Q26_23] as [Country 1],
	[Q26_24] as [Source],
	[Q26_25] as [Accountant code],
	[Q26_26] as [Accountant name],
	[Q26_27] as [Reseller code],
	[Q26_28] as [Reseller name],
	[Q26_29] as [DatabaseID],
	CAST([Q26_30] AS int) AS [IsAccountant],
	CAST([Q26_31] AS int) AS [Blocked],
	CAST([Q26_32] AS int) AS [IsPilot],
	CAST([Q26_33] AS int) AS [IsReseller],
	CAST([Q26_34] AS int) AS [Number of companies],
	CAST([Q26_35] AS int) AS [Number of users],
	[Q26_36] as [Package],
	[Q26_37] as [Businessline],
	[Q26_38] as [Solution],
	[Q26_39] as [MRR],
	[Q26_40] as [Conversion requests],
	[Q26_41] as [Consult requests],
	[Q26_42] as [Support requests],
	cast ([Q28_1] as datetime) as [Startdate user],
	[Q28_2] as [User in months],
	cast ([Q28_3] as datetime) as [Startdate package],
	[Q28_4] as [Package in months],
	[Q28_5] as [Hosting environment],
	[Q28_6] as [Export date],
	[Q29_1] as [Office],
	[Q29_2] as [Address 1],
	[Q29_3] as [Address 2],
	[Q29_4] as [Address 3],
	[Q29_5] as [Inactive user],
	[Q29_6] as [Website],
	[Q29_7] as [Twitter],
	[Q29_8] as [Linkedin],
	[Q29_9] as [Consult date],
	[Q29_10] as [App center],
	[Q29_11] as [Name consultant],
	[Q29_12] as [Privacy],
	[Q29_13] as [Disclaimer],
	[Q29_14] as [Consult package],
	[Q30_1] as [Contract end date],
	[Q31_1] as [Account manager code],
	[Q31_2] as [Account manager name],
	case when (cast( [Q1_A_1] as int) < 1) then null when (cast ([Q1_A_1] as int) = 12) then null when (cast ([Q1_A_1] as int) >= 1) then Q1_A_1-1 end  as [OFS Consultancy Engagement],
	case when (cast( [Q1_A_2] as int) < 1) then null when (cast ([Q1_A_2] as int) = 12) then null when (cast ([Q1_A_2] as int) >= 1) then Q1_A_2-1 end  as [CE Engagement met expectations],
	case when (cast( [Q1_A_3] as int) < 1) then null when (cast ([Q1_A_3] as int) = 12) then null when (cast ([Q1_A_3] as int) >= 1) then Q1_A_3-1 end  as [CE Method to request a consultant],
	case when (cast( [Q1_A_4] as int) < 1) then null when (cast ([Q1_A_4] as int) = 12) then null when (cast ([Q1_A_4] as int) >= 1) then Q1_A_4-1 end  as [CE Clarity and timeliness of communication before consultancy],
	case when (cast( [Q1_A_5] as int) < 1) then null when (cast ([Q1_A_5] as int) = 12) then null when (cast ([Q1_A_5] as int) >= 1) then Q1_A_5-1 end  as [CE Knowledge of client's business processes before consultancy],
	case when (cast( [Q1_A_6] as int) < 1) then null when (cast ([Q1_A_6] as int) = 12) then null when (cast ([Q1_A_6] as int) >= 1) then Q1_A_6-1 end  as [CE Time between request and consultancy],
	case when (cast( [Q14_A_1] as int) < 1) then null when (cast ([Q14_A_1] as int) = 12) then null when (cast ([Q14_A_1] as int) >= 1) then Q14_A_1-1 end  as [OFS Consultant],
	case when (cast( [Q14_A_2] as int) < 1) then null when (cast ([Q14_A_2] as int) = 12) then null when (cast ([Q14_A_2] as int) >= 1) then Q14_A_2-1 end  as [CN Product knowledge],
	case when (cast( [Q14_A_3] as int) < 1) then null when (cast ([Q14_A_3] as int) = 12) then null when (cast ([Q14_A_3] as int) >= 1) then Q14_A_3-1 end  as [CN Communication skills],
	case when (cast( [Q14_A_4] as int) < 1) then null when (cast ([Q14_A_4] as int) = 12) then null when (cast ([Q14_A_4] as int) >= 1) then Q14_A_4-1 end  as [CN Accuracy],
	case when (cast( [Q14_A_5] as int) < 1) then null when (cast ([Q14_A_5] as int) = 12) then null when (cast ([Q14_A_5] as int) >= 1) then Q14_A_5-1 end  as [CN Analytical skills],
	case when (cast( [Q14_A_6] as int) < 1) then null when (cast ([Q14_A_6] as int) = 12) then null when (cast ([Q14_A_6] as int) >= 1) then Q14_A_6-1 end  as [CN Meet all commitments],
	case when (cast( [Q14_A_7] as int) < 1) then null when (cast ([Q14_A_7] as int) = 12) then null when (cast ([Q14_A_7] as int) >= 1) then Q14_A_7-1 end  as [CN Approachable],
	case when (cast( [Q14_A_8] as int) < 1) then null when (cast ([Q14_A_8] as int) = 12) then null when (cast ([Q14_A_8] as int) >= 1) then Q14_A_8-1 end  as [CN Clear on objectives, processes and needs],
	case when (cast( [Q14_A_9] as int) < 1) then null when (cast ([Q14_A_9] as int) = 12) then null when (cast ([Q14_A_9] as int) >= 1) then Q14_A_9-1 end  as [CN Translating challenges to a solution of EOL],
	[Q35] as [Are you now able to start working with EOL?],
	case when ([Q11] < 1) then null when ([Q11] >= 1) then Q11-1 end as [NPS],
	[Q15] as [NPS Verbatim],
	[panelistid] as [Panelist ID],
	cast ([started] as datetime) as [Started],
	cast ([completed] as datetime) as [Completed],
	cast ([branched_out] as datetime) as [Branched Out],
	cast ([over_quota] as datetime) as [Over Quota],
	cast ([modified] as datetime) as [Last Modified],
	[invite_status] as [Invite_Status],
	[campaign_status] as [Campaign_Status],
	[culture] as [Culture],
	[user_key1] as [User_Key1],
	[user_key2] as [User_Key2],
	[user_key3] as [User_Key3],
	[http_referer] as [Http_Referer],
	[http_user_agent] as [Http_User_Agent],
	[remote_addr] as [Remote_Addr],
	[remote_host] as [Remote_Host],
	cast ([initial_date] as datetime) as [Initial_Date],
	[initial_status] as [Initial_Status],
	cast ([reminder1_date] as datetime) as [Reminder1_Date],
	[reminder1_status] as [Reminder1_Status],
	cast ([reminder2_date] as datetime) as [Reminder2_Date],
	[reminder2_status] as [Reminder2_Status],
	cast ([reminder3_date] as datetime) as [Reminder3_Date],
	[reminder3_status] as [Reminder3_Status],
	cast ([reminder4_date] as datetime) as [Reminder4_Date],
	[reminder4_status] as [Reminder4_Status],
	cast ([thankyou_date] as datetime) as [Thankyou_Date],
	[thankyou_status] as [Thankyou_Status],
	cast ([close_date] as datetime) as [Close_Date],
	[last_page] as [Last_Page],
	[fi_loaded] as [Fi_Loaded],
	[last_page_number] as [Last_Page_Number],
	[modifier] as [Modifier],
	[device_type] as [Device_Type],
	[ua_family] as [Ua_Family],
	[ua_majorver] as [Ua_Majorver],
	[os_name] as [Os_Name],
	[os_family] as [Os_Family],
	[iploc_long] as [Iploc_Long],
	[iploc_lat] as [Iploc_Lat],
	[iploc_city] as [Iploc_City],
	[iploc_state] as [Iploc_State],
	[iploc_country] as [Iploc_Country],
	[iploc_zipcode] as [Iploc_Zipcode],
	cast ([LatestImportDate] as datetime) as [Latestimportdate],
	CASE
		WHEN [Q28_5]='DE' THEN 'Germany'
		WHEN [Q28_5]='UK' THEN 'United Kingdom'
		WHEN [Q28_5]='GB' THEN 'United Kingdom'
		WHEN [Q28_5]='US' THEN 'United States'
		WHEN [Q28_5]='NL' THEN 'Netherlands'
		WHEN [Q28_5]='ES' THEN 'Spain'
		WHEN [Q28_5]='FR' THEN 'France'
		WHEN [Q28_5]='BE' THEN 'Belgium'
		WHEN [Q28_5] IS NULL THEN 'Netherlands'
		ELSE [Q28_5] END AS [Country],
	CASE
		WHEN CAST([Q11] AS int) >=1 AND CAST([Q11] AS int)<8  THEN 'Detractor'
		WHEN CAST([Q11] AS int) >7 AND CAST([Q11] AS int)<10 THEN 'Passive'
		WHEN CAST([Q11] AS int) >9 THEN 'Promoter'
		ELSE NULL END AS [PromPasDet],
	CASE WHEN CAST([Q11] AS int) >=1 AND CAST([Q11] AS int)<8  THEN 1 ELSE 0 END AS [Detractor],
	CASE WHEN CAST([Q11] AS int) >7 AND CAST([Q11] AS int)<10 THEN 1 else 0 end as [Passive],
	CASE WHEN CAST([Q11] AS int) >9 THEN 1 else 0 end as [Promoter],
	CASE WHEN [Q11] >=1 THEN 1 ELSE 0 END AS [NPS respondent?],
	CASE [campaign_status]
		WHEN '70' THEN 'Opened not started'
		WHEN '80' THEN 'Survey started'
		WHEN '90' THEN 'Unsubscribed'
		WHEN '98' THEN 'Branched out'
		WHEN '99' THEN 'Over quota'
		WHEN '100' THEN 'Completed survey'
		ELSE [campaign_status] END as [Campaign Status]

FROM [raw].[Verint_EOL_TRX_Consultancy_Survey]
GO
