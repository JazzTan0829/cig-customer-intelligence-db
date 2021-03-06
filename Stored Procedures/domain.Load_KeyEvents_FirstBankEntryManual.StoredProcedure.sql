USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_FirstBankEntryManual]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_KeyEvents_FirstBankEntryManual]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_FirstBankEntryManual]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-05-18
-- Description:	Load procedure to fill the table domain.KeyEvents with FirstBankEntryManual event
-- =============================================
CREATE PROCEDURE [domain].[Load_KeyEvents_FirstBankEntryManual]
AS
BEGIN

--Table with AccountID's that have a commercial contract
WITH CTE_A
AS
	(
	SELECT
	ACS.Environment
	, ACS.AccountCode
	, ACS.AccountID
	, ACS.FirstTrialStartDate
	, ACS.FirstCommStartDate
	FROM domain.AccountsContract_Summary ACS
	INNER JOIN domain.Accounts A
	ON ACS.AccountID = A.AccountID
)

--Table that searches for the minimum date coming from the datasources
,CTE_C
AS
	(
	SELECT MIN(SUB.MaxDate) AS MaxDate
	FROM(
		--SELECT MAX(LogDateTime) AS MaxDate
		--FROM raw.EOLActivityLog
		--UNION
		SELECT MAX(CigCopyTime) AS MaxDate
		FROM raw.HOST_CIG_DivisionStatistics
		) SUB
	)

------------------------

INSERT INTO domain.KeyEvents_All (AccountID, Environment,DivisionCode,[Key Event],[Key Event timestamp],InsertedDatetime)

SELECT
        CTE_A.AccountID
		, CTE_A.Environment AS Environment
		, D.DivisionCode AS DivisionCode
		--, al.UserID As UserID
        , 'First Bank Entry Manual' AS KeyEvent
		, 
		--CASE
			--WHEN CAST(MIN(FirstBankEntryManual) as DATE) = CAST(COALESCE(MAX(al.LogDateTime), GETDATE()) AS DATE)
			--THEN MIN(al.LogDateTime)
			--ELSE 
			MIN(FirstBankEntryManual) 
			--END AS KeyEventDate
		, Getdate() AS InsertedDatetime
FROM CTE_A

JOIN domain.Divisions D
ON D.AccountID = CTE_A.AccountID

--Joins the DivisionStatisticsDaily table to find the first date of the Key Event
JOIN
    (
	SELECT *
	FROM
            (
			SELECT
                    DSD.Environment
                    , DSD.DivisionCode
                    , MIN([Date]) AS FirstBankEntryManual
            FROM domain.DivisionStatistics_Daily DSD

			JOIN domain.Divisions D
			ON DSD.DivisionCode = D.DivisionCode AND DSD.Environment=D.Environment

			JOIN domain.Accounts A
			ON D.AccountID = A.AccountID

            WHERE
                    BankEntryCountManual > 0

            GROUP BY
                    DSD.Environment
                    , DSD.DivisionCode
			) SUB
	WHERE SUB.FirstBankEntryManual<=(Select MIN(MaxDate) From CTE_C)
	AND SUB.FirstBankEntryManual>(Select LastUpdated FROM config.KeyEvents_All_LastUpdated WHERE [Key Event]='First Bank Entry Manual')
    ) DSD
ON D.Environment = DSD.Environment AND D.DivisionCode = DSD.DivisionCode

--Joins the ActivityLog table to find the time on the day where the key event appeared
--LEFT OUTER JOIN [raw].EOLActivityLog al
--ON al.AccountID = d.AccountID
--    AND al.App = 'FinEntryBankCash.aspx'
--	--AND al.Action <> '6'
--	AND LogText LIKE '%Inserted%'
--    AND al.LogDateTime < DATEADD(Day, 1, (DSD.FirstBankEntryManual))
--	AND al.LogDateTime >= DATEADD(Day, -1, (DSD.FirstBankEntryManual))
--    AND DSD.DivisionCode = AL.AdministrationCode
--	AND LogDateTime<=(Select MIN(MaxDate) From CTE_C)
--	AND LogDateTime>(Select LastUpdated FROM config.KeyEvents_All_LastUpdated WHERE [Key Event]='First Bank Entry Manual') --Checks only the date between the lastupdated datetime and the minimum date coming from CTE_C

----Checks if the DivisionCode already is in the table
--WHERE
--NOT EXISTS(SELECT * FROM domain.KeyEvents_All KEA WHERE [Key Event]='First Bank Entry Manual' AND D.DivisionCode=KEA.DivisionCode AND D.Environment=KEA.Environment)

GROUP BY CTE_A.AccountID, DSD.FirstBankEntryManual, CTE_A.Environment, D.DivisionCode--, al.UserID
END
;

DELETE A
FROM (
SELECT ROW_NUMBER() OVER (PARTITION BY AccountID, Environment, DivisionCode, UserID, [Key Event] ORDER BY [Key Event timestamp] desc) as rownumber, *
FROM domain.KeyEvents_All
WHERE [Key Event]='First Bank Entry Manual') A
WHERE A.rownumber>1

--Updates the LastUpdated date

UPDATE config.KeyEvents_All_LastUpdated
SET LastUpdated=(Select Max([Key Event timestamp]) From domain.KeyEvents_All WHERE [Key Event]='First Bank Entry Manual')
WHERE [Key Event]='First Bank Entry Manual'

GO
