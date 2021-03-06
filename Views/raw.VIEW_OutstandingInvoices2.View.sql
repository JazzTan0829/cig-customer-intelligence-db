USE [CustomerIntelligence]
GO
/****** Object:  View [raw].[VIEW_OutstandingInvoices2]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [raw].[VIEW_OutstandingInvoices2]
GO
/****** Object:  View [raw].[VIEW_OutstandingInvoices2]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [raw].[VIEW_OutstandingInvoices2]
AS


SELECT 
	A.Environment
	, A.AccountCode
	, A.AccountID
	, A.[Name]
	, (CASE WHEN A.Blocked = 0 THEN 'No' WHEN A.Blocked = 1 THEN 'Yes' END) AS Blocked
	, ACS.LatestCommPackage
	-- Added ************************************
	, CMS.Code AS CMStatus
	, CMS.DescriptionEN AS CMDescription
	-- Added ************************************
	, PC.Product
	, PC.Edition
	, ACS.LatestMRR
	, CASE WHEN ACS.LatestMRR > 0 THEN 'Yes' ELSE 'No' END AS 'MRR>0'
	, ACS.CommLifetimeMonths
	,(CASE  
		 WHEN RES.[Name] IS NOT NULL THEN 'Reseller'
		 WHEN A.LeadSourceCode = 'ENDORS' THEN 'Endorse'
		 WHEN RES.[Name] IS NULL THEN 'Direct'
		 ELSE 'Unknown' END) AS Channel		-- Was called DealType by Ronald
	, RES.[Name] AS ResellerName
	, ACC.AccountantName
	, ACM.AccountManagerName
	, ACS.LatestCommStartDate AS LatestContractSince
	, CONCAT(YEAR(ACS.LatestCommStartDate), RIGHT(100+MONTH(ACS.LatestCommStartDate),2)) AS ContractStartYearMonth
	, MAX(
		CONCAT
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
			WHEN ACS.Environment = 'ES' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'FR' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'BE' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			ELSE '%7d'
			END) 
		) AS EOLCard
	, ISNULL(SUM(TotalInvoices.InvoicesSent),0) AS TotalInvoicesSent
	, ISNULL(SUM(TotalInvoices.PaymentMade),0) AS TotalPayments
	, CASE WHEN(SUM(TotalInvoices.PaymentMade)) > 0 THEN 'Yes' ELSE 'No' END AS EverMadePayment
	, ISNULL(SUM(InvoicePT.AmountOutstanding),0) AS TotalAmountOpen
	, ISNULL(SUM(CASE WHEN InvoicePT.AmountOutstanding > 0 THEN InvoicePT.AmountOutstanding ELSE 0 END),0) AS TotalAROpen
	, ISNULL(SUM(InvoicePT.AgeGroup0), 0) AS 'AgeGroup0'
	, ISNULL(SUM(InvoicePT.[AgeGroup01-30]), 0) AS 'Overdue01-30Days'		
	, ISNULL(SUM(InvoicePT.[AgeGroup30-60]), 0) AS 'Overdue31-60Days'	
	, ISNULL(SUM(InvoicePT.[AgeGroup60-90]), 0) AS 'Overdue61-90Days'
	, ISNULL(SUM(InvoicePT.[AgeGroup90-120]), 0) AS 'Overdue91-120Days'			
	, ISNULL(SUM(InvoicePT.[AgeGroup>60]), 0) AS 'Overdue>60Days'
	, ISNULL(SUM(InvoicePT.[AgeGroup>120]), 0) AS 'Overdue>120Days'

	, NULL AS PageViewsInLastYear
	--, ISNULL(AD.TotalPageViews,0) AS PageViewsInLastYear
	, ISNULL(AD.PageViewsLast30Days, 0) AS PageViewsLast30Days
	, ISNULL(AD.DaysActiveInLast30, 0) AS DaysActiveInLast30
	, ISNULL(AD.PageViewsLast90Days, 0) AS PageViewsLast90Days
	, ISNULL(AD.DaysActiveInLast90, 0) AS DaysActiveInLast90
	, MAX(CASE WHEN AD.PageViewsLast90Days >= 50 THEN 'Yes' ELSE 'No' END) AS ActiveInLast90Days		-- This is a placeholder definition of active or not

FROM domain.Accounts A

-- Added ****************************************************************
LEFT JOIN raw.Accounts A2
	ON A.AccountID = A2.ID

LEFT JOIN domain.CreditManagementStatus_DescriptionEN CMS
	ON A2.CreditManagementStatus = CMS.ID

-- *********************************************************************


INNER JOIN
	domain.AccountsContract_Summary ACS
	ON A.Environment = ACS.Environment
	AND A.AccountCode = ACS.AccountCode

INNER JOIN
	domain.PackageClassification PC
	ON ACS.LatestCommPackage = PC.PackageCode
	AND ACS.Environment = PC.Environment

LEFT JOIN domain.Accounts RES
	ON a.Environment = res.Environment 
	AND a.ResellerCode = res.AccountCode

LEFT JOIN domain.Accountants ACC
	ON A.Environment = ACC.Environment
	AND A.AccountantCode = ACC.AccountantCode

LEFT JOIN domain.AccountsManager ACM
	ON A.AccountManagerCode = ACM.AccountManagerCode 

LEFT JOIN
	(
		SELECT 
			t.AccountID ,
			t.InvoiceNumber ,
			t.InvoiceDate ,
			t.DueDate ,
			ISNULL(t.AgeGroup0, 0) AS 'AgeGroup0',
			ISNULL(t.AgeGroup1, 0) AS 'AgeGroup01-30',
			ISNULL(t.AgeGroup2, 0) AS 'AgeGroup30-60',
			ISNULL(t.AgeGroup3, 0) AS 'AgeGroup60-90',
			ISNULL(t.AgeGroup4, 0) AS 'AgeGroup90-120',
			ISNULL(t.AgeGroup5, 0) AS 'AgeGroup>60',
			ISNULL(t.AgeGroup6, 0) AS 'AgeGroup>120',
			ISNULL(t.Outstanding, 0) AS AmountOutstanding,
			t.AverAge AS AverageAge,
			t.SumAge AS SumAge,
			t.CountAge AS CountAge--,
			--ROW_NUMBER() OVER(ORDER BY a.AccountCode, a.AccountID, t.InvoiceNumber) AS RowNumber
		FROM
		  (
			SELECT 
				p.AccountID,
				p.DivisionCode,
				p.InvoiceNumber,
				p.InvoiceDate,
				p.DueDate,
				SUM(-p.AmountDC) AS Outstanding, 
				-SUM(CASE WHEN p.Status = 40 THEN p.AmountDC ELSE NULL END) AS PaymentInTransit,
				-SUM(CASE WHEN p.Status < 40 THEN p.AmountDC ELSE NULL END) AS NotPaymentInTransit,
				SUM(-p.AgeGroup0AmountDC) AS AgeGroup0,
				SUM(-p.AgeGroup1AmountDC) AS AgeGroup1,
				SUM(-p.AgeGroup2AmountDC) AS AgeGroup2,
				SUM(-p.AgeGroup3AmountDC) AS AgeGroup3,
				SUM(-p.AgeGroup4AmountDC) AS AgeGroup4,
				SUM(-p.AgeGroup5AmountDC) AS AgeGroup5,
				SUM(-p.AgeGroup6AmountDC) AS AgeGroup6,
				AVG(p.Age) AS AverAge,
				SUM(p.Age) AS SumAge,
				COUNT(p.Age) AS CountAge
		   FROM
			 (
				SELECT 
					pt.AccountID,
					pt.DivisionCode,
					pt.InvoiceNumber,
					pt.AmountDC,
					pt.Status,
					pt.InvoiceDate,
					pt.DueDate,
					(CASE
						WHEN pt.DueDate >= DATEADD(d, -0, CAST(GETDATE() AS DATE)) THEN pt.AmountDC
						ELSE 0.0
					END) AS AgeGroup0AmountDC,
					(CASE
						WHEN pt.DueDate BETWEEN DATEADD(d, -30, CAST(GETDATE() AS DATE)) AND DATEADD(d, -0 -1, CAST(GETDATE() AS DATE)) THEN pt.AmountDC
						ELSE 0.0
					END) AS AgeGroup1AmountDC,
					(CASE
						WHEN pt.DueDate BETWEEN DATEADD(d, -60, CAST(GETDATE() AS DATE)) AND DATEADD(d, -30 -1, CAST(GETDATE() AS DATE)) THEN pt.AmountDC
						ELSE 0.0
					END) AS AgeGroup2AmountDC,
					(CASE
						WHEN pt.DueDate BETWEEN DATEADD(d, -90, CAST(GETDATE() AS DATE)) AND DATEADD(d, -60 -1, CAST(GETDATE() AS DATE)) THEN pt.AmountDC
						ELSE 0.0
					END) AS AgeGroup3AmountDC,
					(CASE
						WHEN pt.DueDate BETWEEN DATEADD(d, -120, CAST(GETDATE() AS DATE)) AND DATEADD(d, -90 -1, CAST(GETDATE() AS DATE)) THEN pt.AmountDC
						ELSE 0.0
					END) AS AgeGroup4AmountDC,
					 (CASE
						WHEN pt.DueDate < DATEADD(d, -60, CAST(GETDATE() AS DATE)) THEN pt.AmountDC
						ELSE 0.0
					END) AS AgeGroup5AmountDC,
					 (CASE
						WHEN pt.DueDate < DATEADD(d, -120, CAST(GETDATE() AS DATE)) THEN pt.AmountDC
						ELSE 0.0
					END) AS AgeGroup6AmountDC,
					DATEDIFF(d, pt.DueDate, CAST(GETDATE() AS DATE)) AS Age
			  FROM [raw].PaymentTerms pt
			  INNER JOIN domain.Accounts a ON (pt.AccountID = a.AccountID)
			  WHERE
				pt.DueDate IS NOT NULL
				AND pt.LineType IN (20,21)
				AND pt.MatchID IS NULL
			) p
		   GROUP BY p.AccountID,
					p.DivisionCode,
					p.InvoiceNumber,
					p.InvoiceDate,
					p.DueDate) 
			AS t
	) InvoicePT
	ON InvoicePT.AccountID = ACS.AccountID 

LEFT JOIN 
	(
		SELECT 
			AccountID
			, SUM(CASE WHEN TransactionType = 20 THEN 1 ELSE 0 END) AS InvoicesSent
			, SUM(CASE WHEN TransactionType = 40 THEN 1 ELSE 0 END) AS PaymentMade
		FROM 
			raw.PaymentTerms
		GROUP BY
			AccountID
	) AS TotalInvoices
	ON TotalInvoices.AccountID = A.AccountID	


LEFT JOIN
	(
		SELECT 
			ad.Environment
			, ad.AccountCode
			, SUM (ad.Quantity) AS TotalPageViews 
			, SUM(CASE WHEN DATEDIFF (dd, ad.Date, GETDATE()) < 31 THEN ad.Quantity ELSE 0 END) as PageViewsLast30Days
			, COUNT(DISTINCT(CASE WHEN DATEDIFF (dd, ad.Date, GETDATE()) < 31 THEN [Date] ELSE NULL END)) AS DaysActiveInLast30
			, SUM(CASE WHEN DATEDIFF (dd, ad.Date, GETDATE()) < 91 THEN ad.Quantity ELSE 0 END) as PageViewsLast90Days  
			, COUNT(DISTINCT(CASE WHEN DATEDIFF (dd, ad.Date, GETDATE()) < 91 THEN [Date] ELSE NULL END)) AS DaysActiveInLast90
			, MAX (ad.Date) as LastLoginDate
		FROM domain.ActivityDaily ad
		WHERE 
			ad.ActivityID = 1		-- Selects only the TotalPageViews activity
			AND ad.[Date] >=  DATEADD(DAY, -91, GETDATE())	-- Selects activity from last 90 days
		GROUP BY 
			ad.Environment
			, ad.AccountCode
	) AD
	ON AD.Environment = A.Environment 
	AND AD.AccountCode = A.AccountCode

WHERE
	ACS.Churned = 0				-- Selects only customers that have not churned  *NEED TO CHECK WITH DUNCAN*
	AND A.AccountClassificationCode IN ('EOL', 'ACC', 'AC7', 'JBO', 'AC1')		-- Selects only commercial account types  *ALSO NEED TO CHECK WITH DUNCAN*
	AND Product <> 'Partner'	-- Excludes Partner accounts
	AND A.AccountID IS NOT NULL
GROUP BY
	A.Environment
	, A.AccountCode
	, A.AccountID 
	, A.[Name]
	, A.Blocked
	, ACS.LatestCommPackage
		-- Added ************************************
	, CMS.Code
	, CMS.DescriptionEN
	-- Added ************************************
	, PC.Product
	, PC.Edition
	, ACS.LatestMRR
	, ACS.CommLifetimeMonths
	, A.LeadSourceCode 
	, RES.[Name]
	, ACC.AccountantName
	, ACM.AccountManagerName
	, ACS.LatestCommStartDate
	, AD.TotalPageViews
	, AD.PageViewsLast30Days
	, AD.DaysActiveInLast30
	, AD.PageViewsLast90Days
	, AD.DaysActiveInLast90


GO
