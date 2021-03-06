USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [publish].[Load_NoActivity_Dashboard]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [publish].[Load_NoActivity_Dashboard]
GO
/****** Object:  StoredProcedure [publish].[Load_NoActivity_Dashboard]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 26-10-2016
-- Description:	This builds the table used in the inactive customers profile. This table joins a calendar date from the last two months to each account that 
--				had an active contract during that time. Activity Daily is then joined to each calendar date to provide an indicator or whether the 
--				account had any activity or not, as well as the total page views for that day.

--				The previous data is removed and rebuilt each day because currently Activity Daily is not always up to date. Once this job is scheduled to
--				be at least caught up to yesterday's date, then this script can be rebuilt to only add each new day's data and remove the earliest month's
--				data once a new month is reached.
-- ============================================================================================================================================================

-- This selects the earliest date from the calendar month two months ago. This means that the longest potential time window for the profile is three months
-- (if we are currently at the end of a calendar month). This is to limit the amount of data in the profile so that performance is not too slow.

CREATE PROCEDURE [publish].[Load_NoActivity_Dashboard]

AS
BEGIN

DECLARE @DateSince DATE
SET @DateSince =
	(
		SELECT MIN(CalendarDate)
		FROM config.Calendar
		WHERE DATEDIFF(MONTH, [CalendarDate], GETDATE()) <= 2
	)

DECLARE @CurrentDate AS DATE
SET @CurrentDate = 
		(SELECT
			CAST(LastUpdatedDateTime AS DATE) AS LastUpdatedDate		-- Selects the latest date that ActivityDaily is processed to
		FROM config.Activities
		WHERE ActivityID = 1
		)


-- Truncates the previous data before rebuilding with the latest data.
TRUNCATE TABLE CustomerIntelligence.publish.NoActivity_Dashboard ; 

INSERT INTO CustomerIntelligence.publish.NoActivity_Dashboard
	(
		AccountID
		, Environment
		, AccountCode
		, EnviroAccount
		, CalendarDate
		, ActiveOrNot
		, PageviewQuantity
	)


SELECT
	ACS.AccountID
	, ACS.Environment
	, ACS.AccountCode
	, CONCAT(ACS.Environment, ACS.AccountCode) AS EnviroAccount				-- Needs to concatenate Environment and Account for a unique key to join on in Power BI
	, Cal.CalendarDate
	, CASE WHEN SumQuantity IS NULL THEN 0 ELSE 1 END AS ActiveOrNot		-- Sets a binary indicator for whether there was activity in the account or not
	, ISNULL(SumQuantity, 0) AS PageviewQuantity	

FROM CustomerIntelligence.domain.AccountsContract_Summary ACS

JOIN CustomerIntelligence.domain.Accounts A
	ON ACS.Environment = A.Environment
	AND ACS.AccountCode = A.AccountCode

-- Joins each calendar date to each account
JOIN CustomerIntelligence.config.Calendar Cal
	ON 1=1
	AND CalendarDate BETWEEN @DateSince AND @CurrentDate
	AND Cal.CalendarDate BETWEEN ACS.FirstCommStartDate AND 
		(CASE WHEN ACS.Churned = 1 THEN LatestCommFinalDate ELSE GETDATE() END)

-- Joins Activity Daily to the calendar dates
LEFT JOIN
	( 
		SELECT
			Environment
			, AccountCode
			, [Date]
			, SUM(Quantity)	AS SumQuantity
		FROM CustomerIntelligence.domain.ActivityDaily 
		WHERE
			ActivityID = 1
			AND [Date] >= @DateSince
		GROUP BY
			Environment
			, AccountCode
			, [Date]
	) AD
	ON ACS.Environment = AD.Environment
	AND ACS.AccountCode = AD.AccountCode	
	AND AD.[Date] = Cal.CalendarDate

WHERE 
	(AccountClassificationCode = 'EOL'
	OR AccountClassificationCode = 'ACC'
	OR AccountClassificationCode = 'AC7'
	OR AccountClassificationCode = 'JBO'
	OR AccountClassificationCode = 'AC1')

END
GO
