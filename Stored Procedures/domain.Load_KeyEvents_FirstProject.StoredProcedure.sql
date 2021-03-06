USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_FirstProject]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_KeyEvents_FirstProject]
GO
/****** Object:  StoredProcedure [domain].[Load_KeyEvents_FirstProject]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[Load_KeyEvents_FirstProject]
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
		SELECT MAX(CigCopyTime) AS MaxDate
		FROM raw.HOST_CIG_DivisionStatistics
	)
	
------------------------

INSERT INTO domain.KeyEvents_All (AccountID, Environment,DivisionCode,[Key Event],[Key Event timestamp],InsertedDatetime)

SELECT
        CTE_A.AccountID
		, CTE_A.Environment AS Environment
		, D.DivisionCode AS DivisionCode
        , 'First Project' AS KeyEvent
		, MIN(FirstProject) AS KeyEventDate
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
                    , MIN([Date]) AS FirstProject                         
            FROM domain.DivisionStatistics_Daily DSD

			JOIN domain.Divisions D
			ON DSD.DivisionCode = D.DivisionCode AND DSD.Environment=D.Environment

			JOIN domain.Accounts A
			ON D.AccountID = A.AccountID

            WHERE 
					 ISNULL([ProjectTypeFixedPrice],0) + ISNULL([ProjectTypeTimeAndMaterial],0) + ISNULL([ProjectTypeNonBillable],0) + ISNULL([ProjectTypePrepaidHTB],0) + ISNULL([ProjectTypePrepaidRetainer],0)> 0 

            GROUP BY
                    DSD.Environment
                    , DSD.DivisionCode
			) SUB
	WHERE SUB.FirstProject<=(Select MIN(MaxDate) From CTE_C)
	AND SUB.FirstProject>(Select LastUpdated FROM config.KeyEvents_All_LastUpdated WHERE [Key Event]='First Project')                         
    ) DSD
ON D.Environment = DSD.Environment AND D.DivisionCode = DSD.DivisionCode
	            
GROUP BY CTE_A.AccountID, DSD.FirstProject, CTE_A.Environment, D.DivisionCode

DELETE A
FROM (
SELECT ROW_NUMBER() OVER (PARTITION BY AccountID, Environment, DivisionCode, [Key Event] ORDER BY [Key Event timestamp] desc) as rownumber, *
FROM domain.KeyEvents_All
WHERE [Key Event]='First Project') A
WHERE A.rownumber>1
END
--;
BEGIN
--Updates the LastUpdated date
UPDATE config.KeyEvents_All_LastUpdated
SET LastUpdated=(Select Max([Key Event timestamp]) From domain.KeyEvents_All WHERE [Key Event]='First Project')
WHERE [Key Event]='First Project'
END
GO
