USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_NoActivityDashboard_Accounts]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_NoActivityDashboard_Accounts]
GO
/****** Object:  View [publish].[VIEW_NoActivityDashboard_Accounts]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_NoActivityDashboard_Accounts]
WITH SCHEMABINDING
AS

SELECT 
	ACS.AccountID
	, ACS.Environment
	, ACS.AccountCode
	, CONCAT(ACS.Environment, ACS.AccountCode) AS EnviroAccount
	, Accounts.[Name]
	, FirstCommStartDate
	, LatestCommFinalDate
	, P.Product 
	, P.Edition
	, ACS.LatestCommPackage
	, CASE 
		WHEN P.Edition = 'Basic' THEN 1
		WHEN P.Edition = 'Advanced' THEN 2
		WHEN P.Edition = 'Premium' THEN 3
		END AS EditionRank
	, LatestMRR
	, AccountantName AS Accountant
	, AccountManagerName AS AccountManager
	, ResellerName AS Reseller
	, CommLifetimeMonths AS TenureInMonths
	, Enab.[Desired date operational] AS GoLiveDate
		
	, CASE
		WHEN CommLifetimeMonths <= 3 THEN 1
		WHEN CommLifetimeMonths BETWEEN 4 AND 6 THEN 2
		WHEN CommLifetimeMonths BETWEEN 7 AND 12 THEN 3
		WHEN CommLifetimeMonths BETWEEN 13 AND 24 THEN 4
		WHEN CommLifetimeMonths >= 25 THEN 5
		END AS TenureRank
	
	, CASE
		WHEN LatestMRR < 100 THEN '0-99'
		WHEN LatestMRR BETWEEN 100 AND 199 THEN '100-199'
		WHEN LatestMRR BETWEEN 200 AND 299 THEN '200-299'
		WHEN LatestMRR BETWEEN 300 AND 399 THEN '300-399'
		WHEN LatestMRR BETWEEN 400 AND 499 THEN '400-499'
		WHEN LatestMRR >= 500 THEN '500+'
		END AS LatestMRRGroup
	
	, CASE WHEN Churned = 0 THEN 'No' ELSE 'Yes' END AS Churned
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
			WHEN ACS.Environment = 'US' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			WHEN ACS.Environment = 'DE' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'UK' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'ES' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'FR' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'BE' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			ELSE '%7d'
			END) AS EOLCard
	,Accounts.CustomerProfileURL
	,ACS.FullCancellationRequestDate

FROM domain.AccountsContract_Summary ACS

-- Join Accounts table
INNER JOIN domain.Accounts 
	ON ACS.Environment = Accounts.Environment
	AND ACS.AccountCode = Accounts.AccountCode 

-- Join PackageClassification
INNER JOIN domain.PackageClassification P
	ON ACS.Environment = P.Environment
	AND ACS.LatestCommPackage = P.PackageCode

-- Join Account Managers
LEFT JOIN domain.AccountsManager AccMan
	ON Accounts.AccountManagerCode = AccMan.AccountManagerCode

-- Join Resellers
LEFT JOIN 
	(	
		SELECT 
			R.Environment
			, R.ResellerCode
			, R.ResellerName
		FROM domain.Reseller R
		INNER JOIN domain.Accounts A
			ON A.Environment = R.Environment
			AND A.AccountCode = R.ResellerCode
		WHERE 
			AccountClassificationCode = 'EPM'			-- This only includes 'real' resellers
	) R
	ON Accounts.Environment = R.Environment
	AND Accounts.ResellerCode = R.ResellerCode

-- Join Accountants
LEFT JOIN domain.Accountants 
	ON Accountants.Environment = Accounts.Environment
	AND Accountants.AccountantCode = Accounts.AccountantCode

-- Join Enablement requests
LEFT JOIN
	(
		SELECT 
			AccountID
			, [Desired date operational]
			, ROW_NUMBER() OVER(PARTITION BY AccountID ORDER BY Created DESC) AS RowNum	 -- In case there are duplicate records for a customer, takes on the latest created request
		FROM domain.Requests_Enablement 
	) AS Enab
	ON Enab.AccountID = ACS.AccountID
	AND RowNum = 1

-- Exclude non-commercial accounts
WHERE				
	(AccountClassificationCode = 'EOL'
	OR AccountClassificationCode = 'ACC'
	OR AccountClassificationCode = 'AC7'
	OR AccountClassificationCode = 'JBO' 
	OR AccountClassificationCode = 'AC1')	

-- Excludes blocked customers
    AND Blocked = 0			
-- Removes Partner product types
	AND P.Product <> 'Partner'
-- Only customers that have had a commercial contract
	AND HadCommContract = 1
-- Only customers who have a contract final date in the future or have churned in the last two months
	--AND DATEDIFF(MONTH, LatestCommFinalDate, GETDATE()) <= 2 
	AND Churned = 0

/*
CREATE UNIQUE CLUSTERED INDEX IX_EnviroAccount
ON publish.VIEW_NoActivityDashboard_Accounts(EnviroAccount)
GO
*/
GO
