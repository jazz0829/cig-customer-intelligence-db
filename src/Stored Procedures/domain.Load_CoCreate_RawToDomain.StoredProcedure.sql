USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_CoCreate_RawToDomain]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_CoCreate_RawToDomain]
GO
/****** Object:  StoredProcedure [domain].[Load_CoCreate_RawToDomain]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2016-09-20
-- Description:	Load the CoCreate data from the raw table to the domain table
-- =============================================
CREATE PROCEDURE [domain].[Load_CoCreate_RawToDomain] 
AS
TRUNCATE TABLE CustomerIntelligence.domain.CoCreate_Relationship_Survey
BEGIN

INSERT INTO CustomerIntelligence.domain.CoCreate_Relationship_Survey
SELECT 
LatestImportDate, 
recordid, 
Q26_1, 
Q24_1, 
Q24_2, 
Q24_3, 
Q24_4, 
Q24_5, 
Q24_6, 
Q24_7, 
Q24_8, 
Q24_9,
Q24_10, 
Q24_11, 
Q24_12, 
Q24_13, 
Q24_14, 
Q24_15,
Q24_16, 
Q24_17, 
Q24_18, 
Q24_19, 
Q24_20, 
Q24_21, 
Q24_22, 
Q24_23, 
Q24_24, 
Q24_25, 
Q24_26,
Q24_27, 
Q24_28, 
Q24_29, 
Q24_30, 
Q24_31, 
Q24_32, 
Q24_33, 
Q24_34, 
Q24_35, 
Q24_36, 
Q24_37, 
Q24_38, 
Q24_39, 
Q24_40, 
Q24_41, 
Q24_42, 
Q27_1, 
Q27_2, 
Q27_3, 
Q27_4, 
Q27_5, 
Q27_6, 
Q28_1,
Q28_2, 
Q28_3, 
Q28_4, 
Q28_5, 
Q28_6, 
Q28_7, 
Q28_8, 
Q28_9, 
Q28_10, 
Q28_11, 
Q28_12, 
Q28_13, 
Q28_14, 
Q29_1, 
Q29_2, 
Q1, 
Q6, 
Q8, 
Q8SPECIFIED_6, 
Q10, 
Q11, 
Q12_A_1, 
Q12_A_2, 
Q12_A_3, 
Q12_A_4, 
Q7, 
Q13_A_1, 
Q13_A_2, 
Q13_A_3, 
Q13_A_4, 
Q13_A_5, 
Q15_A_1, 
Q15_A_2, 
Q15_A_3, 
Q15_A_4, 
Q15_A_5, 
Q14_A_1, 
Q14_A_2, 
Q14_A_3, 
Q14_A_4, 
Q16_A_1, 
Q16_A_2, 
Q16_A_3, 
Q16_A_4, 
Q16_A_5, 
Q16_A_6, 
Q16_A_7, 
Q16_A_8, 
Q16_A_9, 
Q30_1, 
Q17_A_1, 
Q17_A_2, 
Q17_A_3, 
Q17_A_4, 
Q18_A_1,
Q18_A_2, 
Q18_A_3, 
Q19, 
Q20, 
Q22, 
panelistid, 
started, 
completed, 
branched_out, 
over_quota, 
modified, 
invite_status, 
campaign_status, 
culture, 
user_key1, 
user_key2, 
user_key3, 
http_referer, 
http_user_agent, 
remote_addr, 
remote_host, 
initial_date, 
initial_status, 
reminder1_date, 
reminder1_status, 
reminder2_date,
reminder2_status, 
reminder3_date, 
reminder3_status, 
reminder4_date, 
reminder4_status, 
thankyou_date, 
thankyou_status, 
close_date, 
last_page, 
fi_loaded, 
last_page_number, 
modifier,
Q31,
Q32
FROM CustomerIntelligence.[raw].[Verint_CoCreate_Relationship_Survey]

END
GO
