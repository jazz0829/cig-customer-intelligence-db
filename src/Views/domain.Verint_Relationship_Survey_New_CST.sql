USE [CustomerIntelligence]
GO

/****** Object:  View [domain].[Verint_Relationship_Survey]    Script Date: 09-Nov-18 10:12:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




Alter VIEW [domain].[Verint_Relationship_Survey_New_CST]
AS
SELECT [Record ID]
      ,[panelistid]
         ,case when [initial_date] BETWEEN '2018-04-01' and '2018-09-01' then '2018/06'
                     when [initial_date] BETWEEN '2018-10-01' and '2019-03-01' then '2018/11'
                     when [initial_date] BETWEEN '2019-04-01' and '2019-09-01' then '2019/06'
                     when [initial_date] BETWEEN '2019-10-01' and '2020-03-01' then '2019/11'
                     when [initial_date] BETWEEN '2020-04-01' and '2020-09-01' then '2020/06'
                     when [initial_date] BETWEEN '2020-10-01' and '2021-03-01' then '2020/11'
                     end as [wave]
         ,case when [initial_date] BETWEEN '2018-04-01' and '2018-09-01' and [NPS] is not NULL then '2018/06'
                     when [initial_date] BETWEEN '2018-10-01' and '2019-03-01' and [NPS] is not NULL then '2018/11'
                     when [initial_date] BETWEEN '2019-04-01' and '2019-09-01' and [NPS] is not NULL then '2019/06'
                     when [initial_date] BETWEEN '2019-10-01' and '2020-03-01' and [NPS] is not NULL then '2019/11'
                     when [initial_date] BETWEEN '2020-04-01' and '2020-09-01' and [NPS] is not NULL then '2020/06'
                     when [initial_date] BETWEEN '2020-10-01' and '2021-03-01' and [NPS] is not NULL then '2020/11'
                     end as [wave responded]
         ,case when NPS is not NULL then '1' else '0' end as [NPS responded?]
      ,case when [campaign_status] = '80' then 'Started Survey'
                     when [campaign_status] = '100' then 'Completed Survey'
                     when [campaign_status] = '90' then 'Unsubscribed'
                     when [campaign_status] = '98' then 'Branched Out'
                     end as [Campaign Status]
      ,[Customer_code]
      ,[Customer_name]
      ,[Usertype]
         ,[Hosting environment]
         ,[Classification]
      ,[CustomerSince]
      ,[Tenure_in_Months]
         ,case when [Tenure_in_Months] <= '6' then '1. 0-6 months'
                     when [Tenure_in_Months] BETWEEN '7' and '12' then '2. 7-12 months'
                     when [Tenure_in_Months] BETWEEN '13' and '24' then '3. 13-24 months'
                     when [Tenure_in_Months] BETWEEN '25' and '36' then '4. 25-36 months'
                     else '5. > 36 months' end as [Customer tenure range]
      ,[CustomerSinceMonth] as [CustomerSinceYearMonth]
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
      ,[IsReseller]
      ,[Number_companies]
      ,[Number_users]
      ,[Businessline]
      ,[Solution]
         ,case when [Package] like '%Advanced%' then 'Advanced'
                     when [package] like '%premium%' then 'Premium'
                     when [Package] like '%basic%' then 'Basic'
                     when [Package] like '%lite%' then 'Lite'
                     when [Package] like '%plus%' then 'Plus'
                     when [Package] like '%essentials%' then 'Essentials'
                     when [Package] like '%professional%' then 'Professional'
                     else 'Basic' end as [Edition]
      ,[MRR]
      ,[Consultrequests]
         ,[Export date]
      ,[Contract end date]
         ,[Consult date]
      ,[Consult package]
      ,[Accountmanager name]
         ,[email] as [E-mail address]
      ,[Gender]
      ,[Language]
      ,[LastLogin]
      ,case when [Maincontact] is NULL then 'No' else 'Yes' end as [Maincontact?]
      ,[Startdate user]
         ,CAST (YEAR([Startdate user]) AS VARCHAR(4)) + RIGHT('0'+CAST(MONTH([Startdate user]) AS VARCHAR(2)),2) as [UserSinceYearMonth]
      ,[User in months]
         ,case when [User in months] <= '6' then '1. 0-6 months'
                     when [User in months] BETWEEN '7' and '12' then '2. 7-12 months'
                     when [User in months] BETWEEN '13' and '24' then '3. 13-24 months'
                     when [User in months] BETWEEN '25' and '36' then '4. 25-36 months'
                     else '5. > 36 months' end as [User tenure range]
      ,[Startdate package]
      ,[Package in months]
         ,CAST (YEAR([Startdate package]) AS VARCHAR(4)) + RIGHT('0'+CAST(MONTH([Startdate package]) AS VARCHAR(2)),2) as [PackageSinceYearMonth]
         ,[NPS]
         ,case when NPS > 8 then 1 end as Prom
      ,case when NPS < 7 then 1 end as Det
      ,case when NPS in (7,8) then 1 end as Pas
         ,case when NPS > 8 then 'Promoter'
                     when NPS < 7 then 'Detractor'
                     when NPS in (7,8) then 'Passive'
                     else NPS end as PPD
         ,concat([NPS promoter verbatim],[NPS passive verbatim],[NPS detractor verbatim]) as [NPS verbatim]
      ,[NPS promoter verbatim]
      ,[NPS passive verbatim]
      ,[NPS detractor verbatim]
      ,[Positive referral]
      ,[Negative referral]
      ,[PMF]
         ,concat([PMF very - verbatim],[PMF somewhat - verbatim],[PMF not - verbatim]) as [PMF verbatim]
      ,[PMF not - verbatim]
      ,[PMF somewhat - verbatim]
      ,[PMF very - verbatim]
      ,case when [Like 1] = 'Exact Support - Community' then 'Support Portal - Community'
               when [Like 1] = 'Exact Support - Knowlege base' then 'Support Portal - Knowledge base'
                     when [Like 1] = 'Exact Support - Ideas' then 'Support Portal - Ideas'
                     else [Like 1] end as [Like 1] /***** SUPPORT PORTAL IPV CUSTOMER SUPPORT ******/
         ,concat([Like 1 - verbatim],[Like 1 - other],[Product functionality 1]) as [Like 1 verbatim]
      ,[Like 1 - verbatim]
      ,[Product functionality 1]
      ,[Like 1 - other]
      ,case when [Like 2] = 'Exact Support - Community' then 'Support Portal - Community'
               when [Like 2] = 'Exact Support - Knowledge base' then 'Support Portal - Knowledge base'
                     when [Like 2] = 'Exact Support - Ideas' then 'Support Portal - Ideas'
                     else [Like 2] end as [Like 2] /***** SUPPORT PORTAL IPV CUSTOMER SUPPORT ******/
         ,concat([Like 2 - verbatim],[Product functionality 2],[Like 1 - other]) as [Like 2 verbatim]
      ,[Like 2 - verbatim]
      ,[Product functionality 2]
         ,[Like 2 - other]
      ,case when [Like 3] = 'Exact Support - Community' then 'Support Portal - Community'
               when [Like 3] = 'Exact Support - Knowledge base' then 'Support Portal - Knowledge base'
                     when [Like 3] = 'Exact Support - Ideas' then 'Support Portal - Ideas'
                     else [Like 3] end as [Like 3] /***** SUPPORT PORTAL IPV CUSTOMER SUPPORT ******/
        ,concat([Like 3 - verbatim],[Like 3 - other],[Product functionality 3]) as [Like 3 verbatim]
      ,[Like 3 - verbatim]
      ,[Product functionality 3]
      ,[Like 3 - other]
      ,case when [Dislike 1] = 'Exact Support - Community' then 'Support Portal - Community'
               when [Dislike 1] = 'Exact Support - Knowledge base' then 'Support Portal - Knowledge base'
                     when [Dislike 1] = 'Exact Support - Ideas' then 'Support Portal - Ideas'
                     else [Dislike 1] end as [Dislike 1] /***** SUPPORT PORTAL IPV CUSTOMER SUPPORT ******/
         ,concat([Dislike 1 - verbatim],[Dislike 1 - other],[Product functionality [Q27]]]) as [Dislike 1 verbatim]
      ,[Dislike 1 - verbatim]
      ,[Product functionality [Q27]]]
      ,[Dislike 1 - other]
      ,case when [Dislike 2] = 'Exact Support - Community' then 'Support Portal - Community'
               when [Dislike 2] = 'Exact Support - Knowledge base' then 'Support Portal - Knowledge base'
                     when [Dislike 2] = 'Exact Support - Ideas' then 'Support Portal - Ideas'
                     else [Dislike 2] end as [Dislike 2] /***** SUPPORT PORTAL IPV CUSTOMER SUPPORT ******/
         ,concat([Dislike 2 - verbatim],[Dislike 2 - other],[Product functionality [Q28]]]) as [Dislike 2 verbatim]
      ,[Dislike 2 - verbatim]
      ,[Product functionality [Q28]]]
      ,[Dislike 2 - other]
      ,case when [Dislike 3] = 'Exact Support - Community' then 'Support Portal - Community'
               when [Dislike 3] = 'Exact Support - Knowledge base' then 'Support Portal - Knowledge base'
                     when [Dislike 3] = 'Exact Support - Ideas' then 'Support Portal - Ideas'
                     else [Dislike 3] end as [Dislike 3] /***** SUPPORT PORTAL IPV CUSTOMER SUPPORT ******/         
         ,concat([Dislike 3 - verbatim],[Dislike 3 - other],[Product functionality]) as [Dislike 3 verbatim]
      ,[Dislike 3 - verbatim]
      ,[Product functionality]
      ,[Dislike 3 - other]
         ,case when [Like 1] = 'Product - functionality' or [Like 2] = 'Product - functionality' or [Like 3] = 'Product - functionality' then 1 else 0 end as [Likes Product functionality]
         ,case when [Like 1] = 'Product - app center' or [Like 2] = 'Product - app center' or [Like 3] = 'Product - app center' then 1 else 0 end as [Likes App center]
         ,case when [Like 1] = 'Product - ease of use' or [Like 2] = 'Product - ease of use' or [Like 3] = 'Product - ease of use' then 1 else 0 end as [Likes Ease of use]
         ,case when [Like 1] = 'Product - value for money' or [Like 2] = 'Product - value for money' or [Like 3] = 'Product - value for money' then 1 else 0 end as [Likes Value for money]
         ,case when [Like 1] = 'Product - performance' or [Like 2] = 'Product - performance' or [Like 3] = 'Product - performance' then 1 else 0 end as [Likes Product performance]
         ,case when [Like 1] = 'Contact with support team' or [Like 2] = 'Contact with support team' or [Like 3] = 'Contact with support team' then 1 else 0 end as [Likes Contact with Support]
         ,case when [Like 1] = 'Contact with sales team' or [Like 2] = 'Contact with sales team' or [Like 3] = 'Contact with sales team' then 1 else 0 end as [Likes Contact with Sales]
         ,case when [Like 1] = 'Support Portal - Community' or [Like 2] = 'Support Portal - Community' or [Like 3] = 'Support Portal - Community' or [Like 1] = 'Exact Support - Community' or [Like 2] = 'Exact Support - Community' or [Like 3] = 'Exact Support - Community' then 1 else 0 end as [Likes Community]
         ,case when [Like 1] = 'Support Portal - Knowledge base' or [Like 2] = 'Support Portal - Knowledge base' or [Like 3] = 'Support Portal - Knowledge base' or [Like 1] = 'Exact Support - Knowledge base' or [Like 2] = 'Exact Support - Knowledge base' or [Like 3] = 'Exact Support - Knowledge base' then 1 else 0 end as [Likes Knowledge base]
         ,case when [Like 1] = 'Support Portal - Ideas' or [Like 2] = 'Support Portal - Ideas' or [Like 3] = 'Support Portal - Ideas' or [Like 1] = 'Exact Support - Ideas' or [Like 2] = 'Exact Support - Ideas' or [Like 3] = 'Exact Support - Ideas' then 1 else 0 end as [Likes Ideas]
         ,case when [Like 1] = 'Getting started' or [Like 2] = 'Getting started' or [Like 3] = 'Getting started' then 1 else 0 end as [Likes Getting started]
         ,case when [Like 1] = 'Training/e-learning' or [Like 2] = 'Training/e-learning' or [Like 3] = 'Training/e-learning' then 1 else 0 end as [Likes Training/e-learning]
         ,case when [Like 1] = 'Consultancy' or [Like 2] = 'Consultancy' or [Like 3] = 'Consultancy' then 1 else 0 end as [Likes Consultancy]
         ,case when [Like 1] = 'Continuous improvement and innovation' or [Like 2] = 'Continuous improvement and innovation' or [Like 3] = 'Continuous improvement and innovation' then 1 else 0 end as [Likes Continuous improvement and innovation]
         ,case when [Like 1] = 'Communication' or [Like 2] = 'Communication' or [Like 3] = 'Communication' then 1 else 0 end as [Likes Communication]
         ,case when [Like 1] = 'Nothing' or [Like 2] = 'Nothing' or [Like 3] = 'Nothing' then 1 else 0 end as [Likes Nothing]
         ,case when [Like 1] = 'Other' or [Like 2] = 'Other' or [Like 3] = 'Other' then 1 else 0 end as [Likes Other]
         ,case when [Dislike 1] = 'Product - functionality' or [Dislike 2] = 'Product - functionality' or [Dislike 3] = 'Product - functionality' then 1 else 0 end as [Dislikes Product functionality]
         ,case when [Dislike 1] = 'Product - app center' or [Dislike 2] = 'Product - app center' or [Dislike 3] = 'Product - app center' then 1 else 0 end as [Dislikes App center]
         ,case when [Dislike 1] = 'Product - ease of use' or [Dislike 2] = 'Product - ease of use' or [Dislike 3] = 'Product - ease of use' then 1 else 0 end as [Dislikes Ease of use]
         ,case when [Dislike 1] = 'Product - value for money' or [Dislike 2] = 'Product - value for money' or [Dislike 3] = 'Product - value for money' then 1 else 0 end as [Dislikes Value for money]
         ,case when [Dislike 1] = 'Product - performance' or [Dislike 2] = 'Product - performance' or [Dislike 3] = 'Product - performance' then 1 else 0 end as [Dislikes Product performance]
         ,case when [Dislike 1] = 'Contact with support' or [Dislike 2] = 'Contact with support' or [Dislike 3] = 'Contact with support' then 1 else 0 end as [Dislikes Contact with Support]
         ,case when [Dislike 1] = 'Contact with sales' or [Dislike 2] = 'Contact with sales' or [Dislike 3] = 'Contact with sales' then 1 else 0 end as [Dislikes Contact with Sales]
         ,case when [Dislike 1] = 'Support Portal - Community' or [Dislike 2] = 'Support Portal - Community' or [Dislike 3] = 'Support Portal - Community' or [Dislike 1] = 'Exact Support - Community' or [Dislike 2] = 'Exact Support - Community' or [Dislike 3] = 'Exact Support - Community' then 1 else 0 end as [Dislikes Community]
         ,case when [Dislike 1] = 'Support Portal - Knowledge base' or [Dislike 2] = 'Support Portal - Knowledge base' or [Dislike 3] = 'Support Portal - Knowledge base' or [Dislike 1] = 'Exact Support - Knowledge base' or [Dislike 2] = 'Exact Support - Knowledge base' or [Dislike 3] = 'Exact Support - Knowledge base' then 1 else 0 end as [Dislikes Knowledge base]
         ,case when [Dislike 1] = 'Support Portal - Ideas' or [Dislike 2] = 'Support Portal - Ideas' or [Dislike 3] = 'Support Portal - Ideas' or [Dislike 1] = 'Exact Support - Ideas' or [Like 2] = 'Exact Support - Ideas' or [Dislike 3] = 'Exact Support - Ideas' then 1 else 0 end as [Dislikes Ideas]
         ,case when [Dislike 1] = 'Getting started' or [Dislike 2] = 'Getting started' or [Dislike 3] = 'Getting started' then 1 else 0 end as [Dislikes Getting started]
         ,case when [Dislike 1] = 'Training/e-learning' or [Dislike 2] = 'Training/e-learning' or [Dislike 3] = 'Training/e-learning' then 1 else 0 end as [Dislikes Training/e-learning]
         ,case when [Dislike 1] = 'Consultancy' or [Dislike 2] = 'Consultancy' or [Dislike 3] = 'Consultancy' then 1 else 0 end as [Dislikes Consultancy]
         ,case when [Dislike 1] = 'Continuous changes in the product' or [Dislike 2] = 'Continuous changes in the product' or [Dislike 3] = 'Continuous changes in the product' then 1 else 0 end as [Dislikes Continuous changes in the product]
         ,case when [Dislike 1] = 'Communication' or [Dislike 2] = 'Communication' or [Dislike 3] = 'Communication' then 1 else 0 end as [Dislikes Communication]
         ,case when [Dislike 1] = 'Invoices from Exact' or [Dislike 2] = 'Invoices from Exact' or [Dislike 3] = 'Invoices from Exact' then 1 else 0 end as [Dislikes Invoices from Exact]
         ,case when [Dislike 1] = 'Nothing' or [Dislike 2] = 'Nothing' or [Dislike 3] = 'Nothing' then 1 else 0 end as [Dislikes Nothing]
         ,case when [Dislike 1] = 'Other' or [Dislike 2] = 'Other' or [Dislike 3] = 'Other' then 1 else 0 end as [Dislikes Other]
      ,[started]
      ,[completed]
      ,[branched_out]
      ,[over_quota]
      ,[modified]
      ,[invite_status]
         ,concat([Record ID],panelistid) as [recordpanel]
         ,concat([panelistid],[Hosting environment]) as [panelenvironment]
      ,[culture]
      ,[user_key1]
      ,[user_key2]
      ,[user_key3]
      ,[initial_date]
      ,[initial_status]
      ,[reminder1_date]
      ,[reminder1_status]
      ,[reminder2_date]
      ,[reminder2_status]
      ,[reminder3_date]
      ,[reminder3_status]
      ,[thankyou_date]
      ,[thankyou_status]
      ,[close_date]
      ,[last_page]
      ,[fi_loaded]
      ,[last_page_number]
  FROM [CustomerIntelligence].[domain].[Relationshipsurvey_New] 

GO


