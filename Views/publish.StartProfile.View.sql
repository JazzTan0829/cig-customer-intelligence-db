USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[StartProfile]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[StartProfile]
GO
/****** Object:  View [publish].[StartProfile]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [publish].[StartProfile] AS
(



SELECT  (CASE WHEN acs.Churned = 1 THEN 'Churned' ELSE 'Active' END) Churned, 
	acs.FirstCommStartDate, acs.FullCancellationRequestDate, acs.LatestCommFinalDate, 
	(CASE WHEN acs.Churned = 1 THEN DATEDIFF (d, acs.FirstCommStartDate, acs.LatestCommFinalDate) ELSE NULL END) DaysToChurn,
	(CASE WHEN acs.Churned = 1 THEN DATEDIFF (ww, acs.FirstCommStartDate, acs.LatestCommFinalDate) ELSE NULL END) WeeksToChurn,
	(CASE WHEN acs.Churned = 1 THEN DATEDIFF (mm, acs.FirstCommStartDate, acs.LatestCommFinalDate) ELSE NULL END) MonthsToChurn,
	
	(CASE WHEN acs.HadTrial = 1 THEN 'Had trial' ELSE 'No trial' END) HadTrial,
	c.FirstDateTrialActivity,
	(CASE WHEN acs.HadTrial = 1 AND c.FirstDateTrialActivity IS NOT NULL THEN 'ActiveTrial' 
	      WHEN acs.HadTrial = 1 AND c.FirstDateTrialActivity IS  NULL  THEN 'PassiveTrial'
		  ELSE 'NoTrial' END) ActiveTrial,

	acs.Environment, acs.AccountCode, 
	acs.LatestCommPackage, pc.Solution, pc.Product, pc.Edition,
	b.FirstDateActivity, b.FirstDateFinancial, b.FirstDateOpeningsBalance, b.FirstDateBanking, b.FirstDateInvoicing, b.FirstDateARAP,
	DATEDIFF (d, acs.FirstCommStartDate, b.FirstDateOpeningsbalance) AS DaysToStartOpeningsBalance,
	DATEDIFF (d, acs.FirstCommStartDate, b.FirstDateFinancial) AS DaysToStartFinancial,
	DATEDIFF (d, acs.FirstCommStartDate, b.FirstDateBanking) AS DaysToStartBanking,
	(CASE WHEN (DATEDIFF (d, acs.FirstCommStartDate, b.FirstDateBanking)) IS NULL THEN 'No banking' ELSE 'Started banking' END) AS StartedBanking,
	DATEDIFF (d, acs.FirstCommStartDate, b.FirstDateInvoicing) AS DaysToStartInvocing,
	(CASE WHEN (DATEDIFF (d, acs.FirstCommStartDate, b.FirstDateInvoicing)) IS NULL THEN 'No invoicing' ELSE 'Started invoicng' END) AS StartedInvoicing,
	DATEDIFF (d, acs.FirstCommStartDate, b.FirstDateARAP) AS DaysToStartARAP,
	DATEDIFF (d, acs.FirstCommStartDate, b.FirstDateShopOrder) AS DaysToStartShopOrder,
	DATEDIFF (d, acs.FirstCommStartDate, b.FirstDateFinsihShopOrder) AS DaysToStartFinishShopOrder

FROM CustomerIntelligence.domain.AccountsContract_Summary acs
LEFT OUTER JOIN CustomerIntelligence.domain.PackageClassification pc ON acs.Environment = pc.Environment AND acs.LatestCommPackage = pc.PackageCode
LEFT OUTER JOIN (
		SELECT  ad.Environment, ad.AccountCode, 
			MIN (CASE WHEN ActivityID = 1 THEN Date ELSE Null END) FirstDateActivity,
			MIN (CASE WHEN ActivityID = 5028 THEN Date ELSE Null END) FirstDateFinancial,
			MIN (CASE WHEN ActivityID IN (5099) THEN Date ELSE Null END) FirstDateOpeningsbalance,
			MIN (CASE WHEN ActivityID IN (5007, 5014, 5028, 5109) THEN Date ELSE Null END) FirstDateBanking,
			MIN (CASE WHEN ActivityID IN (5032, 5112, 5033) THEN Date ELSE Null END) FirstDateInvoicing,
			MIN (CASE WHEN ActivityID IN (5106, 5107, 5108) THEN Date ELSE Null END) FirstDateARAP,
			MIN (CASE WHEN ActivityID IN (5059) THEN Date ELSE Null END) FirstDateShopOrder,
			MIN (CASE WHEN ActivityID IN (5060) THEN Date ELSE Null END) FirstDateFinsihShopOrder
		FROM CustomerIntelligence.domain.ActivityDaily ad
		LEFT OUTER JOIN CustomerIntelligence.domain.AccountsContract_Summary acs ON acs.Environment = ad.Environment AND acs.AccountCode = ad.AccountCode
		WHERE 1= 1
		--AND ad.AccountCode = 10000316
		AND ad.ActivityID IN (1, 5028,5099,5007,5014,5028,5109,5032,5112,5033,5106,5107,5108,5059,5060)
		AND ad.Date >= acs.FirstCommStartDate
		GROUP BY ad.Environment, ad.AccountCode) b 	ON acs.Environment = b.Environment AND acs.AccountCode = b.AccountCode 
LEFT OUTER JOIN (
		SELECT  ad.Environment, ad.AccountCode, 
			MIN (CASE WHEN ActivityID = 1 THEN Date ELSE Null END) FirstDateTrialActivity
		FROM CustomerIntelligence.domain.ActivityDaily ad
		LEFT OUTER JOIN CustomerIntelligence.domain.AccountsContract_Summary acs ON acs.Environment = ad.Environment AND acs.AccountCode = ad.AccountCode
		WHERE 1= 1
		--AND ad.AccountCode = 10000316
		AND ad.ActivityID IN (1)
		AND ad.Quantity > 50  -- set at 50 for now
		AND ad.Date <= acs.FirstCommStartDate
		GROUP BY ad.Environment, ad.AccountCode) c	ON acs.Environment = c.Environment AND acs.AccountCode = c.AccountCode 
--WHERE acs.FirstCommStartDate BETWEEN '2016-01-01' AND '2016-02-29' 
     -- AND acs.LatestCommFinalDate < DATEADD (d, 90, acs.FirstCommStartDate)
	--AND acs.Environment = 'NL'
	--AND acs.AccountCode = '10000316'

)


GO
