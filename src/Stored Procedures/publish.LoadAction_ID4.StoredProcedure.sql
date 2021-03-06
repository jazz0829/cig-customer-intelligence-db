USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [publish].[LoadAction_ID4]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [publish].[LoadAction_ID4]
GO
/****** Object:  StoredProcedure [publish].[LoadAction_ID4]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [publish].[LoadAction_ID4]
AS

-- ==========================================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 30-08-2016
-- Description:	This script identifies existing customers (with a commercial lifetime of at least 6 months) that have not been active in the last 28 days up until today. Of these customers
--				 those that have had a closed Customer Progress request in the last 6 months are identified to be sent through to the Account Management team for a follow-up chat.
-- ==========================================================================================================================================================================================

-- This sets the commercial lifetime of customers in months for the WHERE selection below
DECLARE @CommercialLifetimeMonths int
SET  @CommercialLifetimeMonths = 6
;

WITH ActionID4CustomerSelection (Environment, AccountCode, /*MainContact,*/ Name, CommLifetimeMonths, LatestCommPackage, Product, Edition, LatestMRR, CustomerProgressCreated, CustomerProgressCreator, CustomerProgressStatus, CustomerProgressEndDate, EverUpgraded)
AS
	(
		SELECT *

		FROM
			(
				SELECT
					NoActivityCustomers.Environment
					, NoActivityCustomers.AccountCode
					--, MainContactSub.MainContact
					, Name
					, CommLifetimeMonths
					, LatestCommPackage
					, Product
					, Edition
					, LatestMRR
					, Created AS CustomerProgressCreated
					, CreatorFullName	AS CustomerProgressCreator
					, [Status] AS CustomerProgressStatus
					, StartDate AS CustomerProgressEndDate			-- For some reason in ExportEOLRequests the StartDate column is the date the customer progress request was closed
					, CASE WHEN Upgrades.AccountCode IS NOT NULL THEN 'Yes' ELSE 'No' END AS EverUpgraded
				FROM
					(
						SELECT
							CustomerSelection.Environment
							, CustomerSelection.AccountCode
							, Name
							, CustomerSelection.CommLifetimeMonths
							, CustomerSelection.LatestCommPackage
							, CustomerSelection.Product
							, CustomerSelection.Edition
							, LatestMRR
							-- This takes the sum of activity for each week since today
							, SUM(CASE WHEN WeekSinceToday = 7 THEN SumQuantity ELSE NULL END) AS Week7
							, SUM(CASE WHEN WeekSinceToday = 6 THEN SumQuantity ELSE NULL END) AS Week6 
							, SUM(CASE WHEN WeekSinceToday = 5 THEN SumQuantity ELSE NULL END) AS Week5 
							, SUM(CASE WHEN WeekSinceToday = 4 THEN SumQuantity ELSE NULL END) AS Week4 
							, SUM(CASE WHEN WeekSinceToday = 3 THEN SumQuantity ELSE NULL END) AS Week3 
							, SUM(CASE WHEN WeekSinceToday = 2 THEN SumQuantity ELSE NULL END) AS Week2 
							, SUM(CASE WHEN WeekSinceToday = 1 THEN SumQuantity ELSE NULL END) AS Week1 
							, SUM(CASE WHEN WeekSinceToday = 0 THEN SumQuantity ELSE NULL END) AS Week0 

						FROM
							(	
								SELECT   
									ACS.Environment
									, ACS.AccountCode
									, Name
									, ACS.CommLifetimeMonths
									, LatestCommPackage
									, PC.Product
									, PC.Edition
									, LatestMRR
									, FLOOR(DATEDIFF(DAY, AD.[Date], GETDATE())/7) AS WeekSinceToday	-- This rounds the date from the activity log to weeks from the current date
									, SUM(AD.Quantity) AS SumQuantity									-- This aggregates activity across all users and administrations of the customer

								FROM CustomerIntelligence.domain.AccountsContract_Summary ACS

								-- Join Accounts table
								INNER JOIN CustomerIntelligence.domain.Accounts
									ON ACS.Environment = Accounts.Environment
									AND ACS.AccountCode = Accounts.AccountCode

								-- Joins the Product and Edition to the latest package code
								INNER JOIN CustomerIntelligence.domain.PackageClassification PC
									ON ACS.LatestCommPackage = PC.PackageCode
									AND ACS.Environment = PC.Environment
		
								-- Joins the Activity Log for only manual page views since 1 July 2016 
								LEFT JOIN CustomerIntelligence.domain.ActivityDaily AD
									ON ACS.Environment = AD.Environment
									AND ACS.AccountCode = AD.AccountCode
									AND AD.[Date] >= '2016-07-01'			
									AND (AD.ActivityID = 1 OR ActivityID = 8)						-- This takes either total page views or the number of mobile users. This does not include total mobile page views, but it does provide a quantity if there were any mobile page views.

								-- Filters only customers of interest
								WHERE 
									HadCommContract = 1												-- Customers with a commercial contract
									AND CommLifetimeMonths >= @CommercialLifetimeMonths				-- Customers with at least a commercial lifetime set by the variable at the top of the script
									AND FullCancellationRequestDate IS NULL							-- Customers that have not yet requested a full commercial cancellation
									AND Churned = 0													-- Customers that have not churned
									AND ACS.Environment IN ('NL')									-- Customers in the Netherlands
									AND	AccountClassificationCode IN ('EOL', 'ACC', 'AC7', 'JBO')	-- Filters out non-commercial account types
									AND PC.Solution  = 'Industry'									-- Only industry customers
									AND Blocked = 0													-- Customers that have not been blocked

									GROUP BY
										  ACS.Environment
										, ACS.AccountCode
										, Name
										, ACS.CommLifetimeMonths
										, LatestCommPackage
										, PC.Product
										, PC.Edition
										, AD.[Date]
										, LatestMRR

							) CustomerSelection

							-- This joins weeks to the CustomerSelection subquery to have values for weeks where there is not activity for customers in the activity log
							FULL OUTER JOIN 
								(
									SELECT 
										NULL AS Week0
										, NULL AS Week1
										, NULL AS Week2
										, NULL AS Week3
										, NULL AS Week4
										, NULL AS Week5
										, NULL AS Week6
										, NULL AS Week7
								) AS Weeks
							ON CustomerSelection.AccountCode = Weeks.Week0

						WHERE AccountCode IS NOT NULL			-- Removes the blank line that occurs from joining the Weeks table

						GROUP BY
							CustomerSelection.Environment
							, CustomerSelection.AccountCode
							, Name
							, CustomerSelection.CommLifetimeMonths
							, CustomerSelection.LatestCommPackage
							, CustomerSelection.Product
							, CustomerSelection.Edition
							, LatestMRR

						-- Puts customers with no activity as first in the list
						--ORDER BY
							--Week0, Week1, Week2, Week3, Week4, Week5, Week6, Week7, CommLifetimeMonths
					) NoActivityCustomers

				LEFT JOIN 
					(
						SELECT 
							Environment
							, AccountCode
							, Created
							, StartDate
							, CreatorFullName
							, CASE 
								WHEN Status = 50 THEN 'Closed'
								WHEN Status = 40 THEN 'Check-up'
								WHEN Status = 30 THEN 'Welcome'
								ELSE NULL END
								AS [Status]
						FROM
							[ContractData].[dbo].[ExportEOLRequests]
						WHERE TypeDescription = 'Customer Progress'
					) CustomerProgress
					ON NoActivityCustomers.Environment = CustomerProgress.Environment
					AND NoActivityCustomers.AccountCode = CustomerProgress.AccountCode

				LEFT JOIN
					(
						SELECT 
							Environment
							, AccountCode
						FROM CustomerIntelligence.domain.Contracts
						WHERE 
							ContractEventTypeCode = 'CUP'
							AND LinePackage = 1
							AND InflowOutflow = 'Inflow'
							AND ContractType = 'C'
					) Upgrades
					ON NoActivityCustomers.Environment = Upgrades.Environment
					AND NoActivityCustomers.AccountCode = Upgrades.AccountCode
				
				/*
				LEFT JOIN
					(
						SELECT
							Environment
							, LTRIM(Code) AS AccountCode
							, MainContact
						FROM
							CIG_Backup_ALL_20160825.dbo.CIG_Accounts
					) MainContactSub
					ON NoActivityCustomers.Environment = MainContactSub.Environment
					AND NoActivityCustomers.AccountCode = MainContactSub.AccountCode
				*/


				WHERE
					Week0 IS NULL
					AND Week1 IS NULL
					AND Week2 IS NULL
					AND Week3 IS NULL
					--AND Status IS NULL

				GROUP BY
					NoActivityCustomers.Environment
					, NoActivityCustomers.AccountCode
					--, MainContactSub.MainContact
					, Name
					, CommLifetimeMonths
					, LatestCommPackage
					, Product
					, Edition
					, LatestMRR
					, Created 
					, CreatorFullName	
					, [Status]
					, StartDate
					, Upgrades.AccountCode
			) SubQ
		
		WHERE CustomerProgressStatus = 'Closed'					-- Only selects customers with a closed progress request
		AND CustomerProgressEndDate >= '2016-01-01'				-- Only selects customers with a progress report that ended since the start of 2016
	)


INSERT INTO CustomerIntelligence.publish.ActionSelectionLog (ContactID, Environment, AccountCode, ActionID, DateSelectedForAction)
SELECT 
	NULL /*MainContact*/ AS ContactID								-- Selects the main contact as the ContactID -- Set to NULL after temporary EOL Hosting table removed
	, Environment
	, AccountCode
	, 4 AS ActionID
	, GETDATE() AS DateSelectedForAction					-- Sets the current date as the date the customer was selected for the action
FROM ActionID4CustomerSelection
WHERE NOT EXISTS											-- Selects only customers that are currently not in the ActionSelectionLog table for ActionID 1
	( 
		SELECT *
		FROM CustomerIntelligence.publish.ActionSelectionLog
		WHERE ActionID4CustomerSelection.Environment = ActionSelectionLog.Environment
		AND ActionID4CustomerSelection.AccountCode = ActionSelectionLog.AccountCode
		AND ActionID = 4
	)
GO
