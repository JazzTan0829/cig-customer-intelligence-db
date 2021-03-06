USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Marketing_CustomerSegments]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Marketing_CustomerSegments]
GO
/****** Object:  View [domain].[Marketing_CustomerSegments]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [domain].[Marketing_CustomerSegments]
AS

SELECT 
	AccountID,
	Name,
	AccountCode,
	Environment,
	LatestCommPackage,
	Product,
	Edition,
	SubGroups
FROM
(
  SELECT 
	A.AccountID,
	A.Name,
	ACS.AccountCode,
	ACS.Environment,
	LatestCommPackage,
	Product,
	Edition,
	--SUBGROUP1
	CASE 
		WHEN 
			Product='Accountancy'
			AND Edition='Advanced' 
			AND ACS.Environment IN ('BE', 'NL') 
			AND Churned='0' 
		THEN 1 ELSE NULL 
	END AS [SubGroup1],
	--SUBGROUP2
	CASE 
		WHEN 
			Product='Accountancy'
			AND Edition='Premium' 
			AND ACS.Environment IN ('BE', 'NL') 
			AND Churned='0' 
		THEN 1 ELSE NULL 
	END AS [SubGroup2],
	--SUBGROUP3
	CASE 
		WHEN 
			Product='Accountancy'
			AND Edition='Basic' 
			AND ACS.Environment IN ('BE', 'NL') 
			AND LatestMRR='0' 
			AND ISNULL(AD.LastLoginDate,'1970-01-01')<DATEADD(YEAR,-2,getdate()) 
			AND ISNULL(ACS.AccountantLinked,0)='0'
			AND Churned='0' 
		THEN 1 ELSE NULL END
	AS [SubGroup3],
	--SUBGROUP4
		CASE 
		WHEN 
			Product='Accountancy'
			AND Edition='Basic' 
			AND ACS.Environment IN ('BE', 'NL') 
			AND LatestMRR='0' 
			AND ISNULL(AD.LastLoginDate,'1970-01-01')>=DATEADD(YEAR,-2,getdate()) 
			AND ISNULL(ACS.AccountantLinked,'0')='0'
			AND Churned='0' 
		THEN 1 ELSE NULL END
	AS [SubGroup4],
	--SUBGROUP5
	CASE 
		WHEN 
			Product='Accountancy'
			AND Edition='Basic' 
			AND ACS.Environment IN ('BE', 'NL') 
			AND LatestMRR>'0' 
			AND ISNULL(ACC.NumberOfCustomersLinked,'0')='0'
			AND Churned='0' 
		THEN 1 ELSE NULL END
	AS [SubGroup5],
	--SUBGROUP6
	CASE 
		WHEN 
			Product='Accountancy'
			AND Edition='Basic' 
			AND ACS.Environment IN ('BE', 'NL') 
			AND LatestMRR='0' 
			AND ISNULL(ACC.NumberOfCustomersLinked,'0')>'0'
			AND ISNULL(ACC.NumberOfCustomersLinked,'0')<'3'
			AND Churned='0' 
		THEN 1 ELSE 0 END
	AS [SubGroup6],
	--SUBGROUP7
	CASE 
		WHEN 
			Product='Accountancy'
			AND Edition='Basic' 
			AND ACS.Environment IN ('BE', 'NL') 
			AND LatestMRR='0' 
			AND ISNULL(ACC.NumberOfCustomersLinked,'0')>'2'
			AND Churned='0' 
		THEN 1 ELSE 0 END
	AS [SubGroup7],	
--SUBGROUP8
	CASE 
		WHEN 
			Product='Accountancy'
			AND Edition='Basic' 
			AND ACS.Environment IN ('BE', 'NL') 
			AND LatestMRR>'0' 
			AND ISNULL(ACC.NumberOfCustomersLinked,'0')>'0'
			AND Churned='0' 
		THEN 1 ELSE 0 END
	AS [SubGroup8],

--SUBGROUP16
	CASE 
		WHEN 
			Churned='1' 
		THEN 1 ELSE 0 END
	AS [SubGroup16]

FROM domain.Accounts A

LEFT JOIN domain.AccountsContract_Summary ACS
ON A.AccountID=ACS.AccountID

LEFT JOIN domain.PackageClassification PC
ON ACS.LatestCommPackage=PC.PackageCode AND ACS.Environment=PC.Environment

LEFT JOIN (SELECT AccountID, MAX(Date) AS LastLoginDate FROM domain.ActivityDaily WHERE ActivityID='1' GROUP BY AccountID) AS AD
ON A.AccountID=AD.AccountID

LEFT JOIN (SELECT A.AccountID, count(Distinct AC.AccountID) [NumberOfCustomersLinked] From domain.Accounts AC LEFT JOIN domain.Accounts A ON AC.AccountantCode=A.AccountCode AND AC.Environment=A.Environment GROUP BY A.AccountID) AS ACC
ON A.AccountID=ACC.AccountID

WHERE 
	AccountClassificationCode IN ('EOL', 'ACC', 'AC7', 'AC1', 'JBO')

	
) AS cp
UNPIVOT 
(
  binary FOR SubGroups IN (SubGroup1, SubGroup2, SubGroup3, SubGroup4, SubGroup5, SubGroup6, SubGroup7, SubGroup8, SubGroup16)
) AS up
 Where binary='1'

 --Order by SubGroups
GO
