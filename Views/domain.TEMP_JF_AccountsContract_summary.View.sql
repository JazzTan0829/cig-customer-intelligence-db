USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[TEMP_JF_AccountsContract_summary]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[TEMP_JF_AccountsContract_summary]
GO
/****** Object:  View [domain].[TEMP_JF_AccountsContract_summary]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [domain].[TEMP_JF_AccountsContract_summary] AS
Select
	ACS.AccountID, 
	ACS.Environment, 
	ACS.AccountCode, 
	HadTrial, 
	HadCommContract, 
	FirstCommStartDate, 
	FirstCommPackage, 
	FirstCommFinalDate, 
	LatestCommPackage, 
	LatestCommStartDate, 
	LatestCommFinalDate, 
	LatestMRR, 
	LatestNumberOfAvailableAdmins,
	LatestNumberOfUsers,
	CompSizeCode,
	SectorCode,
	SubSectorCode,
	BusTypeCode,
	LeadSourceCode,
	AccountantCode

From domain.AccountsContract_Summary ACS
JOIn domain.Accounts A
ON ACS.AccountID=A.AccountID
WHERE A.AccountClassificationCode IN ('EOL', 'ACC', 'AC1', 'AC7', 'JBO')
AND Churned='0'
AND HadCommContract='1'
GO
