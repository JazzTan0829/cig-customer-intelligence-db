USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_AccountsContract_PerMonth]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_AccountsContract_PerMonth]
GO
/****** Object:  StoredProcedure [domain].[Load_AccountsContract_PerMonth]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ====================================================================================================================================================================================================
-- Author:		Alex Green (based on original script by Ronald Dahne)
-- Create date: 30/11/2015
-- Description:	This script loads the AccountsContract_PerMonth contract data for each month. This procedure is executed by the Loop_AccountsContract_PerMonth procedure.
--				This selects the customer's contract status as at the end of the month. However, it now also includes the month in which a customer has churned as the final, even 
--				if they churned before the end of the month. This is because this final month is useful for the assessing the impact of the churned customer in analysis.
--				Because of this CALCULATIONS OF MRR BY MONTH ARE NOT ACCURATE USING THIS TABLE, as customers appear in one more month than they are actually paying for.
-- ====================================================================================================================================================================================================


-- =================================================================================NOTE==============================================================================================================
-- There are a small number of accounts for which the package stated in the AccountsContract_Summary table may differ to what is stated in respective month in the
-- AccountsContract_PerMonth table. This is generally due to anomalies in the contract data. These anomalies are more common in non-commercial contracts, so excluding
-- AccountClassificationCodes such as 'EMP', 'DEA', 'EDU', and 'GLB' removes most of the difference in counts. 


-- The table is truncated in the Loop_AccountsContract_PerMonth script before the data is refreshed everyday.


-- Changed the code to take sum all the number of administrations and users regardless of Contract Type. Previously, only administrations and users were summed if they appeared
-- in a row with the relevant Contract Type. However, it appeared that some commercial customers had increased users and administrations that had a Trial contract type. It was
-- decided that it is better to count these trial addon administrations and users.

-- Alex Green - 16/02/2016  


-- Changed the code so that customers who have churned appear in the month that they churned. Previously they only appeared in a month if their contract was still active on the
-- last day of the month. In order to take a sum of the number of users, administrations, and MRR in the final month (given the OUTFLOW of a churned customer causes the sum to
-- equal 0) any rows in the contract data that have the ContractEventTypeCode 'CFC' (Full Cancellation) are excluded. In order to keep entries accurate for customer who have 
-- churned, then returned to Exact, we needed to include and group by ContractNumber.

-- Alex Green 25/2/2016 


-- Added a calculation for the commercial lifetime of the customer at each month. This is based on the StartDate of their first commercial contract. Any rows for their Trial
-- will appear as NULL.

-- Alex Green 11/03/2016


-- Included two new columns: NumberOfPayingUsers and NumberOfFreeUsers. These are used to separate out users who customers are paying for, and are not paying for.

-- Alex Green - 31/03/2016


-- Updated the way in which we include customers in the final month. This now uses a CONCAT to compare YearMonth of the FinalDate and the InputEndDate. 
-- Included new column: Churned. If the customer has churned in that particular month, then this column will show a 1. Otherwise it will show a 0.

-- Alex Green - 08/04/2016

-- Included code to rebuild the indexes at the end of the script, as these become fragemented each time the table is reloaded
-- Alex Green - 04/10/2016
-- ====================================================================================================================================================================================================

CREATE PROC [domain].[Load_AccountsContract_PerMonth] (@InputEndDate DATE)  -- This takes the EndDate output from the Loop_AccountsContract_PerMonth as the input for this procedure

AS

-- First part of script identifies the latest Package, ContractType, and Contract Number for each active customer
INSERT INTO AccountsContract_PerMonth (Environment, AccountCode, Year, Month, YearMonth, PackageCode, ContractType, ContractNumber, AccountID)
SELECT
	Summary.Environment
	, Summary.AccountCode
	, Year
	, Month
	, Concat(Year, RIGHT(100+month,2)) as YearMonth
	, PackageCode
	, ContractType
	, ContractNumber
	, AC.AccountID

FROM
	(
		SELECT
			  Environment 
			, AccountCode 
			, YEAR (@InputEndDate) AS Year  
			, MONTH (@InputEndDate) AS Month		
			, ItemCode AS PackageCode
			, ContractType 
			, ContractNumber
			, ROW_NUMBER() OVER(PARTITION BY Environment, AccountCode, YEAR (@InputEndDate), MONTH (@InputEndDate) ORDER BY SUM(Quantity) DESC, ContractType) AS RowNumber		-- This RowNumber is used in the WHERE statement. For customers who changed contract in a month, this selects the active contract at the end of the month by ordering by the sum of Quantity (which is 1 for contracts that are still active). It also sorts by alphabetic ContractType, so commercial contracts are always selected over a trial.

		FROM 
			[domain].Contracts
		WHERE
			LinePackage = 1	
			AND StartDate <= @InputEndDate
			AND CONCAT(YEAR(FinalDate), RIGHT(100+MONTH(FinalDate),2)) >= CONCAT(YEAR(@InputEndDate), RIGHT(100+MONTH(@InputEndDate),2))										-- Selects only the months in which the customer's final contract date is equal, or less than the year and month of the InputDate
			AND EventDate <= @InputEndDate

		GROUP BY
			  Environment 
			, AccountCode 
			, ItemCode 
			, ContractType 
			, ContractNumber

	) AS Summary

--JOIN ACCOUNT TO GET THE AccountID
JOIN domain.Accounts AC
ON Summary.AccountCode=AC.AccountCode AND Summary.Environment=AC.Environment 

WHERE RowNumber = 1														-- This selects the the first row as ordered by OVER(PARTITION...ORDER BY) in the SELECT statement.



-- Second part of the script updates the totals of users, admins, and MRR for each customer for that month
UPDATE [domain].AccountsContract_PerMonth
SET 
	NumberOfAvailableAdmins		= Totals.NumberOfAvailableAdmins ,
	NumberOfArchivedAdmins		= Totals.NumberOfArchivedAdmins ,
	NumberOfUsers				= Totals.NumberOfUsers ,
	NumberOfPayingUsers			= Totals.NumberOfPayingUsers ,
	NumberOfFreeUsers			= Totals.NumberOfFreeUsers ,
	MRR							= Totals.MRR

FROM
	(	
		SELECT
			  Environment
			, AccountCode
			, ContractNumber		
			, SUM (CASE WHEN ItemCode != 'EOL9950' AND (ContractEventTypeCode <> 'CFC') THEN NumberOfAdministrations END) AS NumberOfAvailableAdmins		--EOL9950 is the ItemCode for an archived administration. This line counts the sum of NumberOfAdministrations that are not archived. CFC is a Comemrcial Full Cancellation (churn). These are excluded so that we can still get the number of for the month in which the customer has churned.
			, SUM (CASE WHEN ItemCode = 'EOL9950' AND (ContractEventTypeCode <> 'CFC') THEN NumberOfAdministrations ELSE 0 END) AS NumberOfArchivedAdmins	-- Counts the number of archived administrations. CFC is a Commercial Full Cancellation (churn). These are excluded so that we can still get the number of for the month in which the customer has churned.
			, SUM	(CASE WHEN (ContractEventTypeCode <> 'CFC') THEN NumberOfUsers END) AS NumberOfUsers													-- CFC is a Commercial Full Cancellation (churn). These are excluded so that we can still get the number of for the month in which the customer has churned.
			, SUM (CASE WHEN ValuePerMonth <> 0 AND ContractEventTypeCode <> 'CFC' THEN NumberOfUsers ELSE 0 END) AS NumberOfPayingUsers					-- Counts the number of customers with a ValuePerMonth value that is not 0
			, SUM (CASE WHEN ValuePerMonth = 0 AND ContractEventTypeCode <> 'CFC' THEN NumberOfUsers ELSE 0 END) AS NumberOfFreeUsers						-- Counts the number of customers with a ValuePerMonth value that is 0
			, ROUND(SUM(CASE WHEN (ContractEventTypeCode <> 'CFC') THEN ValuePerMonth END),2) AS MRR														-- CFC is a Commercial Full Cancellation (churn). These are excluded so that we can still get the number of for the month in which the customer has churned.

		FROM
			[domain].Contracts 
		WHERE
			StartDate <= @InputEndDate
			AND CONCAT(YEAR(FinalDate), RIGHT(100+MONTH(FinalDate),2)) >= CONCAT(YEAR(@InputEndDate), RIGHT(100+MONTH(@InputEndDate),2))					-- Selects only the months in which the customer's final contract date is equal, or less than the year and month of the InputDate
			AND EventDate <= @InputEndDate
		GROUP BY
			  Environment
			, AccountCode
			, ContractNumber											-- Groups by Contract Number, so only the sum of users, admins and MRR for the most recent contract is taken.
	) Totals

WHERE 
	AccountsContract_PerMonth.Environment = Totals.Environment
	AND AccountsContract_PerMonth.AccountCode = Totals.AccountCode
	AND YEAR(@InputEndDate) = Year
	AND MONTH(@InputEndDate) = Month
	AND AccountsContract_PerMonth.ContractNumber = Totals.ContractNumber


-- Third part of the script updates the commercial lifetime of the customer at the end of the month
UPDATE [domain].AccountsContract_PerMonth
SET 
	CommercialLifetimeMonths		= CommLife.CommercialLifetimeMonths 

FROM
	(
		SELECT 
			Environment
			, AccountCode
			, DATEDIFF(MONTH, FirstCommStartDate, @InputEndDate) AS CommercialLifetimeMonths	-- Calculates the date difference in months between the date of the first commercial contract and the end of the loop month
		FROM
			(
				SELECT
					Environment
					, AccountCode
					, MIN(StartDate) AS FirstCommStartDate										-- Selects the earliest StartDate for a commercial contract for that customer
				FROM [domain].Contracts
				WHERE
					Linepackage = 1
					AND InflowOutflow = 'Inflow'
					AND ContractType = 'C'
					AND StartDate <= @InputEndDate
				GROUP BY
					Environment
					, AccountCode
			) FirstComm
	) CommLife

WHERE 
	AccountsContract_PerMonth.Environment = CommLife.Environment
	AND AccountsContract_PerMonth.AccountCode = CommLife.AccountCode
	AND YEAR(@InputEndDate) = Year
	AND MONTH(@InputEndDate) = Month


-- Final part of the script identifies whether the customer (commercial or trial) has churned in that month
UPDATE [domain].AccountsContract_PerMonth
SET 
	Churned		= Churn.Churned

FROM
	(
		SELECT 
			Environment
			, AccountCode
			, ContractType
			, ContractNumber
			, MAX(CASE WHEN FinalDate <= @InputEndDate AND (ContractEventTypeCode = 'CFC' OR ContractEventTypeCode = 'TFC') THEN 1 ELSE 0 END) AS Churned
		FROM
			[domain].Contracts
		WHERE
			LinePackage = 1	
			AND StartDate <= @InputEndDate
			AND CONCAT(YEAR(FinalDate), RIGHT(100+MONTH(FinalDate),2)) >= CONCAT(YEAR(@InputEndDate), RIGHT(100+MONTH(@InputEndDate),2))						-- Selects only the months in which the customer's final contract date is equal, or less than the year and month of the InputDate		
		GROUP BY
			Environment
			, AccountCode
			, ContractType
			, ContractNumber
	) Churn

WHERE 
	AccountsContract_PerMonth.Environment = Churn.Environment
	AND AccountsContract_PerMonth.AccountCode = Churn.AccountCode
	AND YEAR(@InputEndDate) = Year
	AND MONTH(@InputEndDate) = Month
	AND AccountsContract_PerMonth.ContractNumber = Churn.ContractNumber


-- ========================================================================================================================================
--Rebuild the indexes

ALTER INDEX ALL ON [domain].AccountsContract_PerMonth REBUILD
GO
