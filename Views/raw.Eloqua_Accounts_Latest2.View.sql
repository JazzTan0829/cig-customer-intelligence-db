USE [CustomerIntelligence]
GO
/****** Object:  View [raw].[Eloqua_Accounts_Latest2]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [raw].[Eloqua_Accounts_Latest2]
GO
/****** Object:  View [raw].[Eloqua_Accounts_Latest2]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [raw].[Eloqua_Accounts_Latest2]
AS
	WITH Eloqua_Accounts_Latest
	(CompanyName, Country, Address, City, StateOrProvince, ZipOrPostalCode, BusinessPhone, EloquaCompanyID, DateCreated, DateModified, CompanyCategory, SFDCAccountID, LastModifiedByCRMSystem, Address2, Address3, PURLName_DefaultHypersite, Fax, Website, EOLAccountCode, EOLAccountID, AccountantCode, AccountantID, AccountName, BusinessPhoneExtension, ChamberOfCommerce, DUNSNumber, Classification, AccountEmail, AccountStartDate, AccountEndDate, AccountStatus, CompanySize, CompanySizeFrom, CompanySizeTo, AccountManagerEmail, AccountManagerName, AccountantName, IsAccountant, IsPilot, IsReseller, BusinessType, NumberOfClients, ResellerName, Sector, Subsector, Annualrevenue, ResellerCode, UTMCampaignSpecifics, UTMCampaignCode, UTMCampaignContent, UTMCampaignMedium, UTMCampaignSource, UTMCampaignTerm, EOLContactID, EmailAddress, LastModifiedByEOLSystem, ContractCategory, ContractsAttached, CIGCampaignID, CIGCampaignIDDate, ConsultancyItem, DataCleansing, CMD_IMSF, CMD_Vertical, CMD_OpportunityCreationDate, RN)
	AS
	(
		SELECT CompanyName, Country, Address, City, StateOrProvince, ZipOrPostalCode, BusinessPhone, EloquaCompanyID, DateCreated, DateModified, CompanyCategory, SFDCAccountID, LastModifiedByCRMSystem, Address2, Address3, PURLName_DefaultHypersite, Fax, Website, EOLAccountCode, EOLAccountID, AccountantCode, AccountantID, AccountName, BusinessPhoneExtension, ChamberOfCommerce, DUNSNumber, Classification, AccountEmail, AccountStartDate, AccountEndDate, AccountStatus, CompanySize, CompanySizeFrom, CompanySizeTo, AccountManagerEmail, AccountManagerName, AccountantName, IsAccountant, IsPilot, IsReseller, BusinessType, NumberOfClients, ResellerName, Sector, Subsector, Annualrevenue, ResellerCode, UTMCampaignSpecifics, UTMCampaignCode, UTMCampaignContent, UTMCampaignMedium, UTMCampaignSource, UTMCampaignTerm, EOLContactID, EmailAddress, LastModifiedByEOLSystem, ContractCategory, ContractsAttached, CIGCampaignID, CIGCampaignIDDate, ConsultancyItem, DataCleansing, CMD_IMSF, CMD_Vertical, CMD_OpportunityCreationDate,
			ROW_NUMBER() OVER (PARTITION BY EOLAccountID ORDER BY DateModified DESC) AS RN
		FROM [raw].[Eloqua_Accounts]
	)

	SELECT CompanyName, Country, Address, City, StateOrProvince, ZipOrPostalCode, BusinessPhone, EloquaCompanyID, DateCreated, DateModified, CompanyCategory, SFDCAccountID, LastModifiedByCRMSystem, Address2, Address3, PURLName_DefaultHypersite, Fax, Website, EOLAccountCode, EOLAccountID, AccountantCode, AccountantID, AccountName, BusinessPhoneExtension, ChamberOfCommerce, DUNSNumber, Classification, AccountEmail, AccountStartDate, AccountEndDate, AccountStatus, CompanySize, CompanySizeFrom, CompanySizeTo, AccountManagerEmail, AccountManagerName, AccountantName, IsAccountant, IsPilot, IsReseller, BusinessType, NumberOfClients, ResellerName, Sector, Subsector, Annualrevenue, ResellerCode, UTMCampaignSpecifics, UTMCampaignCode, UTMCampaignContent, UTMCampaignMedium, UTMCampaignSource, UTMCampaignTerm, EOLContactID, EmailAddress, LastModifiedByEOLSystem, ContractCategory, ContractsAttached, CIGCampaignID, CIGCampaignIDDate, ConsultancyItem, DataCleansing, CMD_IMSF, CMD_Vertical, CMD_OpportunityCreationDate
	FROM Eloqua_Accounts_Latest
	WHERE RN = 1

GO
