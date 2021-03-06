USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_FirstMobileAppUsed]    Script Date: 04-Oct-18 13:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-05-08
-- Description:	Load procedure to fill the table domain.KeyEvents with FirstPurchaseEntry event
-- =============================================
ALTER PROCEDURE [domain].[Load_KeyEvents_FirstMobileAppUsed]
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


------------------------

INSERT INTO domain.KeyEvents_All (AccountID, [Key Event],[Key Event timestamp],InsertedDatetime)

SELECT AD.AccountID, 'First Time Mobile App Used', MIN(date) as [Key Event timestamp], getdate()
FROM domain.ActivityDaily AD
JOIN CTE_A
ON CTE_A.AccountID=AD.AccountID
WHERE ActivityID='8'
GROUP BY AD.AccountID

END
;

DELETE A
FROM (
SELECT ROW_NUMBER() OVER (PARTITION BY AccountID, Environment, DivisionCode, UserID, [Key Event] ORDER BY [Key Event timestamp] desc) as rownumber, *
FROM domain.KeyEvents_All
WHERE [Key Event]='First Time Mobile App Used') A
WHERE A.rownumber>1


--Updates the LastUpdated date

UPDATE config.KeyEvents_All_LastUpdated
SET LastUpdated=(Select Max([Key Event timestamp]) From domain.KeyEvents_All WHERE [Key Event]='First Time Mobile App Used')
WHERE [Key Event]='First Time Mobile App Used'
