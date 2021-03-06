USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[TEMP_JF_DivisionStatistics_DailyChanges]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[TEMP_JF_DivisionStatistics_DailyChanges]
GO
/****** Object:  View [domain].[TEMP_JF_DivisionStatistics_DailyChanges]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [domain].[TEMP_JF_DivisionStatistics_DailyChanges] AS
Select 
	D.AccountID,
	DDC.[Environment], 
	A.AccountCode,
	[Date], 
	SUM([GLTransactionsCount]) AS [GLTransactionsCount], 
	SUM([VATTransactions]) AS [VATTransactions], 
	SUM([SourceVATReturn]) AS [SourceVATReturn], 
	SUM([OpportunityCount]) AS [OpportunityCount], 
	SUM([AccountCount]) AS [AccountCount] , 
	SUM([GLAccountCount]) AS [GLAccountCount] , 
	SUM([ItemCount]) AS [ItemCount], 
	SUM([CashEntryCount]) AS [CashEntryCount], 
	SUM([CashTransactions]) AS [CashTransactions], 
	SUM([AutomaticBankLink]) AS [AutomaticBankLink], 
	SUM([BankEntryCount]) AS [BankEntryCount], 
	SUM([BankTransactions]) AS [BankTransactions], 
	SUM([SalesEntryCount]) AS [SalesEntryCount], 
	SUM([SalesTransactions]) AS [SalesTransactions], 
	SUM([PurchaseEntryCount]) AS [PurchaseEntryCount], 
	SUM([PurchaseTransactions]) AS [PurchaseTransactions], 
	SUM([GeneralJournalEntryCount]) AS [GeneralJournalEntryCount], 
	SUM([GeneralJournalTransactions]) AS [GeneralJournalTransactions], 
	SUM([SalesInvoiceCount]) AS [SalesInvoiceCount], 
	SUM([PurchaseInvoiceCount]) AS [PurchaseInvoiceCount], 
	SUM([StarterUsersAccessToCompanyCount]) AS [StarterUsersAccessToCompanyCount], 
	SUM([UsersWithChangedCompanyRightsCount]) AS [UsersWithChangedCompanyRightsCount] , 
	SUM([UsersSetAsInvolvedCount]) AS [UsersSetAsInvolvedCount], 
	SUM([LeadSourceCount]) AS [LeadSourceCount]
FROM domain.DivisionStatistics_DailyChanges DDC
JOIN domain.divisions D
ON DDC.DivisionCode=D.DivisionCode AND DDC.Environment=D.Environment
JOIN domain.Accounts A
ON D.AccountID=A.AccountID
WHERE Date>Getdate()-92
GROUP BY 	
	D.AccountID,
	DDC.[Environment], 
	AccountCode,
	Date

	
GO
