USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_HealthScore_Summary]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_HealthScore_Summary]
GO
/****** Object:  View [publish].[VIEW_HealthScore_Summary]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_HealthScore_Summary]
AS


SELECT DISTINCT					-- Selects distinct in the case of duplicate reference date health score entries 
	HS.Environment
	, HS.AccountCode
	, A.[Name]
	, HS.PackageCode
	, PC.Product
	, PC.Edition
	, CASE 
		WHEN PC.Edition = 'Basic' THEN 1
		WHEN PC.Edition = 'Advanced' THEN 2
		WHEN PC.Edition = 'Premium' THEN 3
		END AS EditionRank
	
	, ACS.LatestMRR
	, CASE
			WHEN LatestMRR < 100 THEN '0-99'
			WHEN LatestMRR BETWEEN 100 AND 199 THEN '100-199'
			WHEN LatestMRR BETWEEN 200 AND 299 THEN '200-299'
			WHEN LatestMRR BETWEEN 300 AND 399 THEN '300-399'
			WHEN LatestMRR BETWEEN 400 AND 499 THEN '400-499'
			WHEN LatestMRR >= 500 THEN '500+'
			END AS LatestMRRGroup

	, CommLifetimeMonths AS Tenure
	, CASE
		WHEN CommLifetimeMonths <= 3 THEN '00-03'
		WHEN CommLifetimeMonths BETWEEN 4 AND 6 THEN '04-06'
		WHEN CommLifetimeMonths BETWEEN 7 AND 12 THEN '07-12'
		WHEN CommLifetimeMonths BETWEEN 13 AND 24 THEN '13-24'
		WHEN CommLifetimeMonths >= 25 THEN '25+'
		END AS TenureGroup
	
	, HS.HealthScore AS HealthScore
	, CASE
		WHEN HS.HealthScore BETWEEN 0 AND 9 THEN '00-09'
		WHEN HS.HealthScore BETWEEN 10 AND 19 THEN '10-19'
		WHEN HS.HealthScore BETWEEN 20 AND 29 THEN '20-29'
		WHEN HS.HealthScore BETWEEN 30 AND 39 THEN '30-39'
		WHEN HS.HealthScore BETWEEN 40 AND 49 THEN '40-49'
		WHEN HS.HealthScore BETWEEN 50 AND 59 THEN '50-59'
		WHEN HS.HealthScore BETWEEN 60 AND 69 THEN '60-69'
		WHEN HS.HealthScore BETWEEN 70 AND 79 THEN '70-79'
		WHEN HS.HealthScore BETWEEN 80 AND 89 THEN '80-89'
		WHEN HS.HealthScore BETWEEN 90 AND 99 THEN '90-99'
		END AS HealthScoreGroup

	, CONCAT
		('https://app.powerbi.com/groups/9bd79127-ab88-4715-bde4-3efa46d41aa3/reports/77bb2872-5243-4444-94e0-328b956e023b/ReportSection1?filter=VIEW_CustomerProfile_v3_Summary%252FAccountID%20eq%20%27', ACS.AccountID,'%27') AS CustomerProfile
	, CONCAT
		(
			CASE 
				WHEN ACS.Environment = 'NL' THEN 'https://start.exactonline.nl/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'BE' THEN 'https://start.exactonline.be/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'FR' THEN 'https://start.exactonline.fr/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'UK' THEN 'https://start.exactonline.co.uk/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'US' THEN 'https://start.exactonline.com/docs/LicCustomerCard.aspx?Action=0&AccountID=%7b'
				WHEN ACS.Environment = 'ES' THEN 'https://start.exactonline.es/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'DE' THEN 'https://start.exactonline.de/docs/LicCustomerCard.aspx?AccountID=%7b'
				ELSE NULL END
		, LOWER(ACS.AccountID)
		, CASE 
			WHEN ACS.Environment = 'NL' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'US' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			WHEN ACS.Environment = 'DE' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'UK' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'BE' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			ELSE '%7d'
			END) AS EOLCard
FROM publish.HealthScore HS
INNER JOIN domain.Accounts A
	ON HS.Environment = A.Environment
	AND HS.AccountCode = A.AccountCode
INNER JOIN domain.AccountsContract_Summary ACS
	ON HS.Environment = ACS.Environment
	AND HS.AccountCode = ACS.AccountCode
INNER JOIN domain.PackageClassification PC
	ON HS.PackageCode = PC.PackageCode
	AND HS.Environment = PC.Environment
-- Joins the latest health score date per package to use in the WHERE statement 
INNER JOIN 
	(
		SELECT 
			CAST(MAX(ReferenceDate) AS DATE) AS LatestHSDate
			, PackageCode
			, Environment
		FROM publish.HealthScore
		GROUP BY PackageCode, Environment
	) LatestDate
	ON LatestDate.PackageCode = HS.PackageCode
	AND LatestDate.Environment = HS.Environment

WHERE HS.ReferenceDate >= LatestDate.LatestHSDate -- Selects only customers for whom there was a healthscore generated for in the latest prediction. If a customer has churned they are then excluded from the dashboard.
AND A.Blocked = 0 -- Only non-blocked accounts
AND ACS.RequestedFullCancellation IS NULL  
GO
