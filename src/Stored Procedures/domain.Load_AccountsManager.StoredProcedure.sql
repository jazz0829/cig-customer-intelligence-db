USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_AccountsManager]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_AccountsManager]
GO
/****** Object:  StoredProcedure [domain].[Load_AccountsManager]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================================
-- Author:		Alex Green (based on initial script from Jennifer Vink)
-- Create date: 24-11-2015
-- Description:	Loads the data into the AccountsManager table

-- UPDATED: 16/10/2017
-- Changed to use Corporate BI DW version of ContractStatistics
-- ===========================================================================================
CREATE PROCEDURE [domain].[Load_AccountsManager]

AS
BEGIN 

TRUNCATE TABLE CustomerIntelligence.domain.AccountsManager

INSERT INTO CustomerIntelligence.domain.AccountsManager
(
AccountManagerID,
Environment,
AccountManagerCode,
AccountManagerName,
BusinessLineCode,
BusinessLineDescription
)

SELECT
	U.UserID AS AccountManagerID,	
	T.Environment,
	AccountManagerCode,
	AccountManagerName,
	BusinessLineCode,
	BusinessLineDescription


/*This FROM statement selects only the AccountManagerName, BusinessLineCode and BusinessLineDescription for the AccountManagerCode based on the
 most recent contract event activity*/ 
FROM 
	(SELECT	
		LTRIM(AccountManagerCode) AS AccountManagerCode,
		AccountManagerName,
		BusinessLineCode,
		BusinessLineDescription,
		Environment,
             ROW_NUMBER() OVER(PARTITION BY AccountManagerCode ORDER BY EventDate DESC) AS RowNumber
		FROM [raw].[DW_ContractStatistics]
		WHERE
			META_LOAD_ENDDTS IS NULL		 -- If field is NULL then this means it is an old record
			AND META_ISDELETED = 0			 -- If equal to 1 then this row is one that should be deleted
	) AS T
LEFT JOIN domain.Users U
ON T.AccountManagerCode=U.HID AND T.Environment=U.Environment AND T.ACCOUNTMANAGERNAME=U.FullName
WHERE RowNumber = 1 AND AccountManagerCode IS NOT NULL
ORDER BY AccountManagerCode

END

GO
