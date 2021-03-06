USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivityDaily_Contracts]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ActivityDaily_Contracts]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivityDaily_Contracts]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 14-06-2016
-- Description:	Insert the contractflow data
-- =============================================
CREATE PROCEDURE [domain].[Load_ActivityDaily_Contracts]

AS
BEGIN
TRUNCATE TABLE domain.ActivityDaily_Contracts
	--Insert the contractdata flow
	BEGIN
	INSERT INTO [domain].[ActivityDaily_Contracts] (Date, Environment, AccountCode, PackageCode, ContractEventTypeCode, AccountantOrLinked, NumberOfUsers, NumberOfAdministrations, MRR)
	Select *
	From
		(
		SELECT
		CS.Eventdate,
		CS.Environment,
		CS.AccountCode,
		(
			Select top 1 ItemCode
			From domain.Contracts
			Where Linepackage='1'
			AND Eventdate<=CS.Eventdate
			AND CS.AccountCode=AccountCode
			AND CS.Environment=Environment
			AND InflowOutflow='Inflow'
			Order by EventDate DESC
		)As PackageCode,
		ContractEventTypeCode ,
		Linked,
		(
			Select Sum(NumberOfUsers)
			From domain.Contracts
			where Eventdate<=CS.Eventdate
			AND CS.AccountCode=AccountCode
			AND CS.Environment=Environment
		) As NumberOfUsers,
		(
			Select Sum(NumberOfAdministrations)
			From domain.Contracts
			where Eventdate<=CS.Eventdate
			AND CS.AccountCode=AccountCode
			AND CS.Environment=Environment
		)As NumberOfAdministrations,
		(
			Select SUM(ValuePerMonth)
			From domain.Contracts
			Where Eventdate<=CS.Eventdate
			AND CS.AccountCode=AccountCode
			AND CS.Environment=Environment
		) AS MRR

		FROM domain.Contracts CS

		LEFT JOIN
		(Select Date, AccountCode, Environment, (CASE  WHEN LinkStatus='Accountant Linked' THEN 1 ELSE 0 END) AS Linked
		From domain.LinkedAccountantLog
		Where LinkStatus='Accountant Linked' OR  LinkStatus='Accountant Link Removed' ) LINK
		ON LINK.AccountCode=CS.AccountCode AND LINK.Environment=CS.Environment

		WHERE (InflowOutflow='Inflow' OR (InflowOutflow = 'Outflow' AND ContractEventTypeCode = 'PRC'))			-- Includes outflow for price agreements 
		AND Linepackage=(Case ContractEventTypeCode WHEN 'TN' THEN '1' WHEN 'CN' THEN '1' WHEN 'CT' THEN '1' WHEN 'CDN' THEN '1' WHEN 'CUP' THEN '1' ELSE '0' End)

	) SUB
		Group BY SUB.Environment, SUB.EventDate, SUB.AccountCode,ContractEventTypeCode , PackageCode, NumberOfUsers, NumberOfAdministrations, SUB.MRR, SUB.Linked
		Order by SUB.Environment, SUB.AccountCode, SUB.EventDate
	END

	--Update the FirstDateLinkToAccountant
	BEGIN
	UPDATE domain.ActivityDaily_Contracts
	SET
		AccountantOrLinked = CASE	WHEN t.AccountantLinked='1' AND t.DateFirstLinkedToAccountant IS NULL THEN '1'
									WHEN t.AccountantLinked='1' AND t.DateFirstLinkedToAccountant<=ActivityDaily_Contracts.Date THEN '1'
									WHEN t.AccountantLinked='0' AND t.DateFirstLinkedToAccountant IS NULL THEN '0'
									WHEN t.AccountantLinked='0' AND t.DateFirstLinkedToAccountant<=ActivityDaily_Contracts.Date THEN '1'
									WHEN t.AccountantLinked='1' AND t.DateFirstLinkedToAccountant>=ActivityDaily_Contracts.Date THEN '0'
									WHEN t.AccountantLinked='0' AND t.DateFirstLinkedToAccountant>=ActivityDaily_Contracts.Date THEN '0' END
	FROM
		(
			SELECT
				ACS.Environment
				, ACS.AccountCode
				, MAX(CASE WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithAccountant' THEN 1 ELSE 0 END) AS AccountantLinked
				, MAX(CASE
					WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithAccountant' AND FirstCommStartDate >= '2016-02-09' AND LinkStatus = 'Accountant Linked' THEN [Date]
					WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithAccountant' AND FirstCommStartDate >= '2016-02-09' AND LinkStatus IS NULL THEN FirstCommStartDate
					WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithoutAccountant' AND FirstCommStartDate >= '2016-02-09' AND LinkStatus = 'Accountant Linked' THEN [Date]
					WHEN FirstCommStartDate <= '2016-02-09' AND LinkStatus = 'Accountant Linked' THEN [Date]
					ELSE NULL END
					) AS DateFirstLinkedToAccountant
			FROM domain.AccountsContract_Summary ACS

			INNER JOIN domain.Accounts
				ON ACS.Environment = Accounts.Environment
				AND ACS.AccountCode = Accounts.AccountCode

			LEFT JOIN
				(
					SELECT
						Environment
						, AccountCode
						, LinkStatus
						, [Date]
						, ROW_NUMBER() OVER(PARTITION BY Environment, AccountCode ORDER BY [Date]) AS RowNumber
					FROM
						domain.LinkedAccountantLog
					WHERE
						LinkStatus = 'Accountant Linked'
				) LAL
			ON ACS.Environment = LAL.Environment
			AND ACS.AccountCode = LAL.AccountCode
			AND RowNumber = 1

			GROUP BY
				ACS.Environment
				, ACS.AccountCode
		) AS t
	WHERE
		t.Environment = ActivityDaily_Contracts.Environment
		AND t.AccountCode = ActivityDaily_Contracts.AccountCode
	END

	--Insert the rows with the correct dat when the customer is really linked.
	BEGIN
	INSERT INTO [domain].[ActivityDaily_Contracts] ([Date], [Environment], [AccountCode], [PackageCode], [ContractEventTypeCode], [AccountantOrLinked], [NumberOfUsers], [NumberOfAdministrations], [MRR])
	SELECT
			MAX(CASE
				WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithAccountant' AND FirstCommStartDate >= '2016-02-09' AND LinkStatus = 'Accountant Linked' THEN [Date]
				WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithAccountant' AND FirstCommStartDate >= '2016-02-09' AND LinkStatus IS NULL THEN FirstCommStartDate
				WHEN EntrepreneurAccountantLinked = 'EntrepreneurWithoutAccountant' AND FirstCommStartDate >= '2016-02-09' AND LinkStatus = 'Accountant Linked' THEN [Date]
				ELSE NULL END
				) AS DateFirstLinkedToAccountant
			, ACS.Environment
			, ACS.AccountCode
			, (SELECT TOP 1 PackageCode FROM [ActivityDaily_Contracts] WHERE AccountCode= ACS.AccountCode AND Environment=ACS.Environment  ORDER BY AccountantOrLinked ASC, Date DESC ) AS PackageCode
			, 'LINK' AS ContractEventTypeCode
			, '1' AS AccountantOrLinked
			, (SELECT TOP 1 NumberOfUsers FROM [ActivityDaily_Contracts] WHERE AccountCode= ACS.AccountCode AND Environment=ACS.Environment ORDER BY AccountantOrLinked ASC,Date DESC) As NumberOfUsers
			, (SELECT TOP 1 NumberOfAdministrations FROM [ActivityDaily_Contracts] WHERE AccountCode= ACS.AccountCode AND Environment=ACS.Environment ORDER BY AccountantOrLinked ASC,Date DESC) As NumberOfAdministrations
			, (SELECT TOP 1 MRR FROM [ActivityDaily_Contracts] WHERE AccountCode= ACS.AccountCode AND Environment=ACS.Environment ORDER BY AccountantOrLinked ASC,Date DESC) AS MRR


		FROM domain.AccountsContract_Summary ACS

		INNER JOIN domain.Accounts
			ON ACS.Environment = Accounts.Environment
			AND ACS.AccountCode = Accounts.AccountCode

		LEFT JOIN
			(
				SELECT
					Environment
					, AccountCode
					, LinkStatus
					, [Date]
					, ROW_NUMBER() OVER(PARTITION BY Environment, AccountCode ORDER BY [Date]) AS RowNumber
				FROM
					domain.LinkedAccountantLog
				WHERE
					LinkStatus = 'Accountant Linked'
			) LAL
		ON ACS.Environment = LAL.Environment
		AND ACS.AccountCode = LAL.AccountCode
		AND RowNumber = 1
		Where ACS.HadCommContract='1' AND DateFirstLinkedToAccountant IS NOT NULL
		GROUP BY
			ACS.Environment
			, ACS.AccountCode
	END

	-- Accountant linked only for commercial lifetime
	BEGIN
		Update [Domain].[ActivityDaily_Contracts]
		Set AccountantOrLinked = '0' WHERE ContractEventTypeCode='TN'
	END

	-- Update de row where linking the accountant is on the same day as changing the package
	BEGIN
		UPDATE domain.[ActivityDaily_Contracts]
		Set PackageCode=SUB.PackageCode, NumberOfAdministrations=SUB.NumberOfAdministrations, NumberOfUsers=SUB.NumberOfUsers, MRR=SUB.MRR

		FROM domain.[ActivityDaily_Contracts] ADC

		JOIN(
		Select PackageCode, AccountCode, Environment, Date,NumberOfAdministrations,NumberOfUsers, MRR
		From domain.[ActivityDaily_Contracts]
		WHERE ContractEventTypeCode<>'LINK') AS SUB
		ON SUB.AccountCode=ADC.AccountCode AND SUB.Environment=ADC.Environment AND SUB.Date=ADC.Date

		Where SUB.Date=ADC.Date AND ContractEventTypeCode='LINK'
	END

	--Update AccountID
	UPDATE ADC
	SET ADC.AccountID = AC.AccountID
	FROM domain.ActivityDaily_Contracts ADC
		LEFT JOIN domain.Accounts AC
		ON ADC.AccountCode=AC.AccountCode AND ADC.Environment=AC.Environment
	WHERE ADC.AccountID IS NULL

END
GO
