USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_LegislationTemplate]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_KeyEvents_LegislationTemplate]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_LegislationTemplate]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-05-17
-- Description:	Load procedure to run add the date for creating a first legaslation template
-- =============================================
CREATE PROCEDURE [domain].[Load_KeyEvents_LegislationTemplate] 
AS
BEGIN
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

,CTE_C
AS
	(
	SELECT MIN(SUB.MaxDate) AS MaxDate
	FROM(
		SELECT MAX(CigCopyTime) AS MaxDate
		FROM raw.HOST_CIG_DivisionStatistics
		) SUB
	)

INSERT INTO domain.KeyEvents_All

SELECT 
	SUB.AccountID,
	SUB.Environment,
	SUB.DivisionCode,
	NULL,
	SUB.KeyEvent,
	SUB.KeyEventDate,
	Getdate() AS InsertedDatetime
FROM(
	SELECT 
		DIV.AccountID, 
		DIV.Environment,
		DIV.DivisionCode,
		'Legislation Template Created' AS KeyEvent,
		DIV.sysCreated AS KeyEventDate, 
		DST.StartupTypeDescription,
		ROW_NUMBER() OVER (PARTITION BY AccountID ORDER BY DIV.sysCreated ASC) AS RowNumber

	FROM domain.Divisions DIV

	JOIN domain.DivisionStatistics_Summary DSS
	ON DIV.DivisionCode=DSS.DivisionCode AND DIV.Environment=DSS.Environment

	JOIN domain.DivisionStartupType DST
	ON DSS.StartupType=DST.StartupType
	
	WHERE
	StartupTypeDescription='LegislationTemplate'
	)SUB

WHERE 
	RowNumber='1'
	AND SUB.KeyEventDate<=(Select MIN(MaxDate) From CTE_C)
	AND SUB.KeyEventDate>(Select LastUpdated FROM config.KeyEvents_All_LastUpdated WHERE [Key Event]='Legislation Template Created')
	--AND NOT EXISTS(SELECT * FROM domain.KeyEvents_All KEA WHERE [Key Event]='Legislation Template Created' AND SUB.DivisionCode=KEA.DivisionCode AND SUB.Environment=KEA.Environment)
END 

DELETE A
FROM (
SELECT ROW_NUMBER() OVER (PARTITION BY AccountID, Environment, DivisionCode, [Key Event] ORDER BY [Key Event timestamp] desc) as rownumber, *
FROM domain.KeyEvents_All
WHERE [Key Event]='Legislation Template Created') A
WHERE A.rownumber>1


UPDATE config.KeyEvents_All_LastUpdated
SET LastUpdated=(Select Max([Key Event timestamp]) From domain.KeyEvents_All WHERE [Key Event]='Legislation Template Created')
WHERE [Key Event]='Legislation Template Created'



GO
