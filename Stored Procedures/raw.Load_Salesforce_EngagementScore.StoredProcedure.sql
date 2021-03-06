USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_EngagementScore]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Salesforce_EngagementScore]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_EngagementScore]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-03-21
-- Description:	
-- =============================================
CREATE PROCEDURE [raw].[Load_Salesforce_EngagementScore] 
AS
BEGIN
TRUNCATE TABLE raw.Salesforce_Account_EngagementScore

INSERT INTO raw.Salesforce_Account_EngagementScore (Id,Customer_Score__c,RowNumber)
Select 
	ACC.Id,
	HealthScore,
	Row_Number() OVER (ORDER BY ACC.Id) AS RowNumber


From raw.Salesforce_Account_Latest ACC
JOIN domain.Accounts A
ON ACC.Exact_ID__c=CAST(A.AccountID AS varchar(max))
JOIN (SELECT
	AccountCode,
	Environment,
	HealthScore
FROM
(
		Select 
			AccountCode,
			Environment,
			Healthscore,
			ROW_NUMBER() OVER (Partition By AccountCode, Environment ORDER BY PredictDate desc) AS RowNumber
		FROM publish.HealthScore
) SUB
WHERE SUB.RowNumber='1') HS
ON HS.AccountCode=A.AccountCode AND HS.Environment=A.Environment

END
GO
