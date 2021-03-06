USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_LinkedAccountantLog]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_LinkedAccountantLog]
GO
/****** Object:  StoredProcedure [domain].[Load_LinkedAccountantLog]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[Load_LinkedAccountantLog]

AS
BEGIN
-- ==================================================================================================================================================
-- Author:		Alex Green
-- Create date: 08-02-2016
-- Description:	Records the changes a customer makes to their linked accountant: whether an accountant is linked, removed, or they've changed
--				accountants. This is needed because the ContractStatistics table is refreshed every night and any history of when a customer has
--				linked to an accountant, or removed an accountant, is lost. This script compares our day old version of the ContractStatistics table
--				(Accounts) with the recently refreshed ContractStatistics table to check for any differences.

--				Script updated 31-05-2017 because join issue identified with inconsistency in UK and GB in domain.Accounts and
--				contractdata.dbo.ContractStatistics

--				16 October 2017 changed to point to ContractStatistics coming from Corporate BI Data Warehouse
-- ==================================================================================================================================================

INSERT INTO domain.LinkedAccountantLog
	(
		  Environment
		, AccountCode
		, LinkStatus
		, [Date]
		, NewAccountantCode
		, PreviousAccountantCode
	)

SELECT
	  Environment
	, AccountCode
	, (CASE
		WHEN NewAccountantOrLinked = 1 AND PreviousAccountantOrLinked = 0 THEN 'Accountant Linked'
		WHEN NewAccountantOrLinked = 0 AND PreviousAccountantOrLinked = 1 THEN 'Accountant Link Removed'
		WHEN NewAccountantOrLinked = 1 AND PreviousAccountantOrLinked = 1 AND NewAccountantCode <> PreviousAccountantCode THEN 'Accountant Change'
		END) AS LinkStatus		-- This describes the type of change made to the linked accountant.
	, CONVERT(DATE, (GETDATE() - 1)) AS [Date]
	, NewAccountantCode
	, PreviousAccountantCode

FROM
	(
		SELECT
			ContractStatistics.Environment
			, ContractStatistics.AccountCode
			, ContractStatistics.AccountantOrLinked AS NewAccountantOrLinked
			, Accounts.AccountantOrLinked AS PreviousAccountantOrLinked
			, ContractStatistics.AccountantCode AS NewAccountantCode
			, Accounts.AccountantCode AS PreviousAccountantCode
		FROM
			(
				SELECT
					DISTINCT
						(CASE WHEN Environment = 'GB' THEN 'UK'
						ELSE Environment
						END) AS Environment
					, LTRIM(Code) AS AccountCode
					, AccountantOrLinked
					, LTRIM(AccountantCode) AS AccountantCode
				FROM [raw].[DW_ContractStatistics]
				WHERE 
					IsAccountant = 'Entrepreneur'		 -- Only selects Entrepreneurs
					AND META_LOAD_ENDDTS IS NULL		 -- If field is NULL then this means it is an old record
					AND META_ISDELETED = 0				 -- If equal to 1 then this row is one that should be deleted
			) ContractStatistics
		INNER JOIN domain.Accounts
			ON Accounts.Environment = ContractStatistics.Environment
			AND Accounts.AccountCode = ContractStatistics.AccountCode
		WHERE
			(
				ContractStatistics.AccountantOrLinked <> Accounts.AccountantOrLinked
				OR ContractStatistics.AccountantCode <> Accounts.AccountantCode
			)
	) Change

END

GO
