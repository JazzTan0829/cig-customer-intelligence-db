USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_DivisionStatistics_DailyChanges]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_DivisionStatistics_DailyChanges]
GO
/****** Object:  StoredProcedure [domain].[Load_DivisionStatistics_DailyChanges]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 08-02-2017
-- Description:	This job adds the new daily changes (value of deltas) for each new day to DivisionStatistics_DailyChanges
-- ============================================================================================================================================================

CREATE PROCEDURE [domain].[Load_DivisionStatistics_DailyChanges]

AS
DECLARE @i INT = 1
DECLARE @iTotal INT = (SELECT count(*) FROM config.DivisionStatistics_DailyChange_LastProcessed)


WHILE @i<=@iTotal 
BEGIN
		DECLARE @DateForNextRun Date = (Select DateForNextRun FROM config.DivisionStatistics_DailyChange_LastProcessed WHERE @i=Sequence)
		DECLARE @DateLastProcessed Date = (Select DateLastProcessed FROM config.DivisionStatistics_DailyChange_LastProcessed WHERE @i=Sequence)
		DECLARE @Environment varchar(3) = (Select Environment FROM config.DivisionStatistics_DailyChange_LastProcessed WHERE @i=Sequence)

		WHILE 
					@DateForNextRun <= (SELECT MAX(Date) FROM domain.DivisionStatistics_Daily WHERE Environment = @Environment)		-- Only runs up to the latest date we have DivisionStatistics_Daily records for for each environment 
		BEGIN 

				INSERT INTO CustomerIntelligence.domain.DivisionStatistics_DailyChanges
				(
					[Environment]
					,[DivisionCode]
					,[Date]
					
					,[GLTransactionsCount]
					,[VATTransactions]
					,[InvoiceLinesCount]
					,[SourceVATReturn]

					,[OpportunityCount]
					,[AccountCount]
					,[CustomerCount]
					,[SupplierCount]
					
					,[GLAccountCount]
					,[DocumentCount]
					,[ItemCount]
					
					,[CashEntryCount]
					,[CashTransactions]

					,[AutomaticBankLink]
					,[RabobankAccounts]
					,[ABNAMROBankAccounts]
					,[INGBankAccounts]

					,[BankEntryCount]
					,[BankTransactions]
					,[BankTransactionsImport]
					,[BankTransactionsManual]

					,[SalesEntryCount]
					,[SalesTransactions]

					,[PurchaseEntryCount]
					,[PurchaseTransactions]

					,[GeneralJournalEntryCount]
					,[GeneralJournalTransactions]
					
					,[ProjectTotalEmployees]
					,[ProjectTotalTimeEntries]
					,[ProjectTotalCostEntries]
					
					,[ProjectTypeFixedPrice] 
					,[ProjectTypeTimeAndMaterial] 
					,[ProjectTypeNonBillable] 
					,[ProjectTypePrepaidRetainer] 
					,[ProjectTypePrepaidHTB]

					,[SalesOrderEntryCount]
					
					,[StockCountEntryCount]
					,[StockCountTransactions]
					,[SalesInvoiceCount]
					
					,[PurchaseInvoiceCount]
				--2017-09-20
				, StarterUsersAccessToCompanyCount
				, UsersWithChangedCompanyRightsCount
				, UsersSetAsInvolvedCount
				, CustomersWithInvolvedUsersCount
				, LeadSourceCount
				, ElectronicPurchaseEntryCount
				, ElectronicSalesEntryCount
				)

				SELECT
					DSD.Environment
					, DSD.DivisionCode
					, DSD.[Date]
					
					, ISNULL(DSD.GLTransactionsCount, 0)  - ISNULL((PreviousDSD.GLTransactionsCount), 0) AS GLTransactionsCount
					, ISNULL(DSD.VATTransactions, 0) - ISNULL((PreviousDSD.VATTransactions), 0) AS VATTransactions
					, ISNULL(DSD.InvoiceLinesCount, 0) - ISNULL((PreviousDSD.InvoiceLinesCount), 0) AS InvoiceLinesCount
					, ISNULL(DSD.SourceVATReturn, 0) - ISNULL((PreviousDSD.SourceVATReturn), 0) AS SourceVATReturn
					
					
					, ISNULL(DSD.OpportunityCount, 0) - ISNULL((PreviousDSD.OpportunityCount), 0) AS OpportunityCount
					, ISNULL(DSD.AccountCount, 0) - ISNULL((PreviousDSD.AccountCount), 0) AS AccountCount
					, ISNULL(DSD.CustomerCount, 0) - ISNULL((PreviousDSD.CustomerCount), 0) AS CustomerCount
					, ISNULL(DSD.SupplierCount, 0) - ISNULL((PreviousDSD.SupplierCount), 0) AS SupplierCount
					
					, ISNULL(DSD.GLAccountCount, 0) - ISNULL((PreviousDSD.GLAccountCount), 0) AS GLAccountCount
					, ISNULL(DSD.DocumentCount, 0) - ISNULL((PreviousDSD.DocumentCount), 0) AS DocumentCount
					, ISNULL(DSD.ItemCount, 0) - ISNULL((PreviousDSD.ItemCount), 0) AS ItemCount
					
					, ISNULL(DSD.CashEntryCount, 0) - ISNULL((PreviousDSD.CashEntryCount), 0) AS CashEntryCount
					, ISNULL(DSD.CashTransactions, 0) - ISNULL((PreviousDSD.CashTransactions), 0) AS CashTransactions	
					

					, ISNULL(DSD.AutomaticBankLink, 0) - ISNULL((PreviousDSD.AutomaticBankLink), 0) AS AutomaticBankLink
					, ISNULL(DSD.RabobankAccounts, 0) - ISNULL((PreviousDSD.RabobankAccounts), 0) AS RabobankAccounts
					, ISNULL(DSD.ABNAMROBankAccounts, 0) - ISNULL((PreviousDSD.ABNAMROBankAccounts), 0) AS ABNAMROBankAccounts
					, ISNULL(DSD.INGBankAccounts, 0) - ISNULL((PreviousDSD.INGBankAccounts), 0) AS INGBankAccounts
	
					
					, ISNULL(DSD.BankEntryCount, 0) - ISNULL((PreviousDSD.BankEntryCount), 0) AS BankEntryCount
					, ISNULL(DSD.BankTransactions, 0) - ISNULL((PreviousDSD.BankTransactions), 0) AS BankTransactions
					, ISNULL(DSD.BankTransactionsImport, 0) - ISNULL((PreviousDSD.BankTransactionsImport), 0) AS BankTransactionsImport
					, ISNULL(DSD.BankTransactionsManual, 0) - ISNULL((PreviousDSD.BankTransactionsManual), 0) AS BankTransactionsManual
					
					, ISNULL(DSD.SalesEntryCount, 0) - ISNULL((PreviousDSD.SalesEntryCount), 0) AS SalesEntryCount
					, ISNULL(DSD.SalesTransactions, 0) - ISNULL((PreviousDSD.SalesTransactions), 0) AS SalesTransactions
					
					, ISNULL(DSD.PurchaseEntryCount, 0) - ISNULL((PreviousDSD.PurchaseEntryCount), 0) AS PurchaseEntryCount
					, ISNULL(DSD.PurchaseTransactions, 0) - ISNULL((PreviousDSD.PurchaseTransactions), 0) AS PurchaseTransactions
					
					, ISNULL(DSD.GeneralJournalEntryCount, 0) - ISNULL((PreviousDSD.GeneralJournalEntryCount), 0) AS GeneralJournalEntryCount
					, ISNULL(DSD.GeneralJournalTransactions, 0) - ISNULL((PreviousDSD.GeneralJournalTransactions), 0) AS GeneralJournalTransactions
					
					, ISNULL(DSD.ProjectTotalEmployees, 0) - ISNULL((PreviousDSD.ProjectTotalEmployees), 0) AS ProjectTotalEmployees
					, ISNULL(DSD.ProjectTotalTimeEntries, 0) - ISNULL((PreviousDSD.ProjectTotalTimeEntries), 0) AS ProjectTotalTimeEntries
					, ISNULL(DSD.ProjectTotalCostEntries, 0) - ISNULL((PreviousDSD.ProjectTotalCostEntries), 0) AS ProjectTotalCostEntries
					
					, ISNULL(DSD.ProjectTypeFixedPrice, 0) - ISNULL((PreviousDSD.ProjectTypeFixedPrice), 0) AS ProjectTypeFixedPrice
					, ISNULL(DSD.ProjectTypeTimeAndMaterial, 0) - ISNULL((PreviousDSD.ProjectTypeTimeAndMaterial), 0) AS ProjectTypeTimeAndMaterial
					, ISNULL(DSD.ProjectTypeNonBillable, 0) - ISNULL((PreviousDSD.ProjectTypeNonBillable), 0) AS ProjectTypeNonBillable
					, ISNULL(DSD.ProjectTypePrepaidRetainer, 0) - ISNULL((PreviousDSD.ProjectTypePrepaidRetainer), 0) AS ProjectTypePrepaidRetainer
					, ISNULL(DSD.ProjectTypePrepaidHTB, 0) - ISNULL((PreviousDSD.ProjectTypePrepaidHTB), 0) AS ProjectTypePrepaidHTB


					, ISNULL(DSD.SalesOrderEntryCount, 0) - ISNULL((PreviousDSD.SalesOrderEntryCount), 0) AS SalesOrderEntryCount
					
					, ISNULL(DSD.StockCountEntryCount, 0) - ISNULL((PreviousDSD.StockCountEntryCount), 0) AS StockCountEntryCount
					, ISNULL(DSD.StockCountTransactions, 0) - ISNULL((PreviousDSD.StockCountTransactions), 0) AS StockCountTransactions
					, ISNULL(DSD.SalesInvoiceCount, 0) - ISNULL((PreviousDSD.SalesInvoiceCount), 0) AS SalesInvoiceCount
					
					, ISNULL(DSD.PurchaseInvoiceCount, 0) - ISNULL((PreviousDSD.PurchaseInvoiceCount), 0) AS PurchaseInvoiceCount

					--2017-09-20
					, ISNULL(DSD.StarterUsersAccessToCompanyCount, 0) - ISNULL((PreviousDSD.StarterUsersAccessToCompanyCount), 0) AS StarterUsersAccessToCompanyCount
					, ISNULL(DSD.UsersWithChangedCompanyRightsCount, 0) - ISNULL((PreviousDSD.UsersWithChangedCompanyRightsCount), 0) AS UsersWithChangedCompanyRightsCount
					, ISNULL(DSD.UsersSetAsInvolvedCount, 0) - ISNULL((PreviousDSD.UsersSetAsInvolvedCount), 0) AS UsersSetAsInvolvedCount
					, ISNULL(DSD.CustomersWithInvolvedUsersCount, 0) - ISNULL((PreviousDSD.CustomersWithInvolvedUsersCount), 0) AS CustomersWithInvolvedUsersCount
					, ISNULL(DSD.LeadSourceCount, 0) - ISNULL((PreviousDSD.LeadSourceCount), 0) AS LeadSourceCount
					, ISNULL(DSD.ElectronicPurchaseEntryCount, 0) - ISNULL((PreviousDSD.ElectronicPurchaseEntryCount), 0) AS ElectronicPurchaseEntryCount
					, ISNULL(DSD.ElectronicSalesEntryCount, 0) - ISNULL((PreviousDSD.ElectronicSalesEntryCount), 0) AS ElectronicSalesEntryCount
	
				FROM domain.DivisionStatistics_Daily DSD
				LEFT JOIN
					(
						SELECT
							Environment
							, DivisionCode
							, [Date]
							
							, GLTransactionsCount
							, VATTransactions
							, InvoiceLinesCount
							, SourceVATReturn

							, OpportunityCount
							, QuoteCount
							, AccountCount			
							, CustomerCount
							, SupplierCount
							
							, GLAccountCount
							, DocumentCount
							, ItemCount
							
							, CashEntryCount
							, CashTransactions
							
							, AutomaticBankLink
							, RabobankAccounts
							, ABNAMROBankAccounts
							, INGBankAccounts

							, BankEntryCount
							, BankTransactions
							, BankTransactionsImport
							, BankTransactionsManual
							
							, SalesEntryCount
							, SalesTransactions
							
							, PurchaseEntryCount
							, PurchaseTransactions
							
							, GeneralJournalEntryCount
							, GeneralJournalTransactions
							
							, ProjectTotalEmployees
							, ProjectTotalTimeEntries
							, ProjectTotalCostEntries
							
							, ProjectTypeFixedPrice
							, ProjectTypeTimeAndMaterial
							, ProjectTypeNonBillable
							, ProjectTypePrepaidRetainer 
							, ProjectTypePrepaidHTB

							, SalesOrderEntryCount
							
							, StockCountEntryCount
							, StockCountTransactions
							, SalesInvoiceCount
							
							, PurchaseInvoiceCount

							--2017-09-20
							, StarterUsersAccessToCompanyCount
							, UsersWithChangedCompanyRightsCount
							, UsersSetAsInvolvedCount
							, CustomersWithInvolvedUsersCount
							, LeadSourceCount
							, ElectronicPurchaseEntryCount
							, ElectronicSalesEntryCount
							
							, ROW_NUMBER() OVER(PARTITION BY Environment, DivisionCode ORDER BY [Date] DESC) AS RowNum	-- Makes the latest divisionstatistics record prior to the date being processed RowNum 1 for the join statement below
						FROM domain.DivisionStatistics_Daily
						WHERE 
							Environment = @Environment			-- Selects only the environment that matches the 
							AND [Date] < @DateForNextRun		-- Selects only divisionstatistics records earlier than the date being processed
					) PreviousDSD
					ON DSD.Environment = PreviousDSD.Environment
					AND DSD.DivisionCode = PreviousDSD.DivisionCode
					AND RowNum = 1

				WHERE
					DSD.Environment = @Environment
					AND DSD.[Date] = @DateForNextRun		-- Selects only divisionstatistics_daily records where the date matches the date being selected by the cursor

				SET @DateForNextRun = DATEADD(DAY, 1, @DateForNextRun)	-- Adds one day to the @DateForNextRun variable

				UPDATE config.DivisionStatistics_DailyChange_LastProcessed	 -- Updates the two date columns in the config table - Each date moves forward by one
				SET 
					DateLastProcessed = (Select DateForNextRun FROM [config].[DivisionStatistics_DailyChange_LastProcessed] WHERE Environment = @Environment)
					, DateForNextRun = DATEADD(DAY, 1, (Select DateForNextRun FROM [config].[DivisionStatistics_DailyChange_LastProcessed] WHERE Environment = @Environment))
				WHERE Environment = @Environment

			END

			SET @i+=1
		

--Deletes the records that are coming from the DivisionStatistics_Daily where are NULL records. 
DELETE [CustomerIntelligence].[domain].[DivisionStatistics_DailyChanges]
FROM [CustomerIntelligence].[domain].[DivisionStatistics_DailyChanges] DVC
FULL OUTER JOIN [CustomerIntelligence].[domain].[DivisionStatistics_Daily] DVD
ON 
	DVC.DivisionCode=DVD.DivisionCode 
	AND DVC.Environment=DVD.Environment 
	AND DVC.Date=DVD.Date
WHERE 
	DVD.Date IS NULL 
	AND DVC.DivisionCode IS NOT NULL
END

GO
