USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_Summary]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_CustomerProfile_Summary]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_Summary]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_CustomerProfile_Summary]
AS


SELECT 
	CONCAT(ACS.Environment, ACS.AccountCode) AS EnviroAccountCode
	, CONCAT(RTRIM(ACS.Environment), ACS.AccountCode) AS EnviroAccountFilter
	,ACS.Environment
	, ACS.AccountCode
	, Accounts.Name AS "Customer Name"
	, IsAccountant AS "Customer Type"
	, AccountantOrLinked
	, CASE WHEN Accounts.AccountantCode IS NOT NULL THEN Accounts.AccountantCode ELSE ' ' END AS AccountantCode
	, CASE WHEN Accounts.AccountantCode IS NOT NULL THEN AccountantName ELSE ' ' END AS AccountantName
	, SectorDescription
	, SubSectorDescription
	, FirstCommStartDate --AS "Customer Since"
	, CASE WHEN HadCommContract = 1 THEN FirstCommStartDate ELSE NULL END AS "Customer Since"
	, CASE WHEN HadTrial = 1 THEN 'Yes' ELSE 'No' END AS HadTrial
	, FirstTrialStartDate
	, CASE WHEN HadCommContract = 1 THEN LatestMRR ELSE 0 END AS 'Latest MRR'
	, LatestNumberOfUsers AS 'Available Users'
	, LatestNumberOfAvailableAdmins AS 'Available Administrations' 
	--, LeadSourceDescription
	, CASE WHEN RequestedFullCancellation = 0 THEN 'No' ELSE 'Yes' END AS [Requested Contract Cancellation]
	, FullCancellationRequestDate AS [Cancellation Date]
	--, FirstTrialPackage AS TrialPackage
	--, PCTrial.Product AS TrialProduct
	--, PCTrial.Edition AS TrialEdition
	--, FirstCommPackage AS FirstCommercialPackage
	--, PCFirstComm.Product AS FirstCommercialProduct --AS "First Commercial Product"
	--, PCFirstComm.Edition AS FirstCommercialEdition
	--, PCLatestComm.PackageCode AS LatestCommercialPackage
	--, PCLatestComm.Product AS LatestCommercialProduct
	--, PCLatestComm.Edition AS LatestCommercialEdition
	
	, CASE 
		WHEN HadCommContract = 1 THEN LatestCommPackage 
		WHEN HadCommContract = 0 THEN LatestTrialPackage
		END AS LatestPackage
	, CASE 
		WHEN HadCommContract = 1 THEN PCLatestComm.Product
		WHEN HadCommContract = 0 THEN PCTrial.Product
		END AS LatestProduct
	, CASE 
		WHEN HadCommContract = 1 THEN PCLatestComm.Edition
		WHEN HadCommContract = 0 THEN PCTrial.Edition
		END AS LatestEdition

	/*
	, CASE
		WHEN HadCommContract = 0 AND LatestTrialFinalDate < GETDATE() THEN 'None'
		WHEN HadCommContract = 1 AND LatestCommFinalDate < GETDATE() THEN 'None'  
		WHEN HadCommContract = 0 AND LatestTrialFinalDate >= GETDATE() THEN 'Trial'
		WHEN HadCommContract = 1 AND LatestCommFinalDate >= GETDATE() THEN 'Commercial'
		END AS [Contract Type]
	*/
	/*
	, CASE 
		WHEN HadCommContract = 0 AND LatestTrialFinalDate >= GETDATE() THEN 'Status: Trial'
		WHEN HadCommContract = 0 AND LatestTrialFinalDate < GETDATE() THEN 'Status: Failed to take contract'
		WHEN HadCommContract = 1 AND Churned = 1 THEN 'Status: Churned'
		WHEN HadCommContract = 1 AND LatestCommFinalDate >= GETDATE() AND DATEDIFF(DAY, FirstCommStartDate, GETDATE()) <= 90 THEN 'Status: Onboarding'
		ELSE 'Status: Established'
		END AS [Status]
	*/
	, CASE 
		WHEN ACS.Churned = 1 THEN 'Churned' 
		WHEN (ACS.Churned = 0 AND RequestedFullCancellation = 1) THEN 'Requested Cancellation'
		WHEN (ACS.Churned = 0 AND RequestedFullCancellation IS NULL) THEN 'Active'
		END AS ContractStatus
	, ACS.Churned

	, CONCAT
		(
			CASE 
				WHEN ACS.Environment = 'NL' THEN 'https://start.exactonline.nl/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'BE' THEN 'https://start.exactonline.be/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'FR' THEN 'https://start.exactonline.fr/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'UK' THEN 'https://start.exactonline.co.uk/docs/LicCustomerCard.aspx?AccountID=%7b'
				WHEN ACS.Environment = 'US' THEN 'https://start.exactonline.com/docs/LicCustomerCard.aspx?Action=0&AccountID=%7b'
				WHEN ACS.Environment = 'ES' THEN 'https://start.exactonline.es/docs/LicCustomerCard.aspx?AccountID=%7b'
				--WHEN ACS.Environment = 'DE' THEN 'https://start.exactonline.de/docs/LicCustomerCard.aspx?AccountID=%7b'
				ELSE NULL END
		, LOWER(ACS.AccountID)
		, CASE 
			WHEN ACS.Environment = 'US' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			WHEN ACS.Environment = 'DE' THEN NULL
			WHEN ACS.Environment = 'UK' THEN '%7d&_Division_=1'
			WHEN ACS.Environment = 'BE' THEN '%7d&ControlAccountVatNumber=False&ControlAccountCocNumber=False&DoPurchaseAccountData=False&_Division_=1'
			ELSE '%7d'
			END) AS EOLCard

FROM
	CustomerIntelligence.domain.AccountsContract_Summary ACS

-- Join Accounts table
JOIN CustomerIntelligence.domain.Accounts
	ON ACS.Environment = Accounts.Environment
	AND ACS.AccountCode = Accounts.AccountCode

-- Join Trial PackageClassification
LEFT JOIN CustomerIntelligence.domain.PackageClassification PCTrial
	ON ACS.Environment = PCTrial.Environment
	AND ACS.LatestTrialPackage = PCTrial.PackageCode


-- Join First PackageClassification
LEFT JOIN CustomerIntelligence.domain.PackageClassification PCFirstComm
	ON ACS.Environment = PCFirstComm.Environment
	AND ACS.FirstCommPackage = PCFirstComm.PackageCode


-- Join Latest PackageClassification
LEFT JOIN CustomerIntelligence.domain.PackageClassification PCLatestComm
	ON ACS.Environment = PCLatestComm.Environment
	AND ACS.LatestCommPackage = PCLatestComm.PackageCode


-- Join Accountants
LEFT JOIN CustomerIntelligence.domain.Accountants
	ON Accounts.AccountantCode = Accountants.AccountantCode
	AND Accounts.Environment = Accountants.Environment


-- Join Lead Source
--LEFT JOIN CustomerIntelligence.domain.LeadSources
--	ON Accounts.LeadSourceCode = LeadSources.LeadSourceCode
--	AND Accounts.Environment = LeadSources.Environment

-- Join Sectors
LEFT JOIN CustomerIntelligence.domain.Sectors
	ON Accounts.SectorCode = Sectors.SectorCode
	AND Accounts.Environment = Sectors.Environment


-- Join Sub-Sectors
LEFT JOIN CustomerIntelligence.domain.SubSectors
	ON Accounts.SubSectorCode = SubSectors.SubSectorCode
	AND Accounts.Environment = SubSectors.Environment
GO
