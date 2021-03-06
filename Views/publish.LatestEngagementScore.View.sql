USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[LatestEngagementScore]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[LatestEngagementScore]
GO
/****** Object:  View [publish].[LatestEngagementScore]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[LatestEngagementScore]
AS

SELECT
	A.AccountID
	, HS.Environment
	, HS.AccountCode
	, HS.PredictDate
	, HS.EngagementScore
FROM 
	(
		SELECT 
			Environment
			, AccountCode
			, PredictDate
			, HealthScore AS EngagementScore
			, ROW_NUMBER() OVER(PARTITION BY Environment, AccountCode ORDER BY PredictDate DESC) AS RowNum   -- The latest record becomes row number 1
		FROM publish.HealthScore 
	) HS
INNER JOIN domain.Accounts A
	ON HS.Environment = A.Environment
	AND HS.AccountCode = A.AccountCode
WHERE HS.RowNum = 1
GO
