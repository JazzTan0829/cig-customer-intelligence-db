USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DivisionStatistics_Summary]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_DivisionStatistics_Summary]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DivisionStatistics_Summary]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 04/10/2016
-- Description:	This procedure drops the previous version of the DivisionStatistics_Summary table and rebuilds it. 
--				This table provides the latest summary of the statistics for each division

-- 27 Feb 2018 - Added BankAccountsCount, BankLinksCount, BankImportFilesCount, and BankExportFilesCount fields 
-- =====================================================================================================================================================================

CREATE PROCEDURE [domain].[CreateTable_DivisionStatistics_Summary]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.DivisionStatistics_Summary', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.DivisionStatistics_Summary

CREATE TABLE CustomerIntelligence.domain.DivisionStatistics_Summary
(
	[Environment] [nchar](3) NOT NULL ,					
	[DivisionCode] [int] NOT NULL ,
	
	[ConversionSource] [int] NULL,
	[StartupType] [nchar](1) NULL,
	[TemplateDivision] [int] NULL,
	[TemplateCode] [nvarchar](30) NULL,
	[TaxFrequency] [nchar](1) NULL,
	[TaxReturnMethod] [smallint] NULL,
	[TaxSystem] [nchar](1) NULL,
	[PeriodDateCheck] [nchar](1) NULL,
	[OpeningBalanceFirstDate] [datetime] NULL,	
	[LastLogin] [datetime] NULL,

	[GLTransactionsCount] [int] NULL ,
	[VATTransactions] [int] NULL,
	[FCTransactions] [int] NULL,
	[InvoiceLinesCount] [int] NULL,

	[AutomaticBankLink] [int] ,							-- This is a calculated field based on the RabobankLinks, ABNAMROBankLinks and INGBankLinks columns
	
	[BankLinksCount] [int] NULL,
	[BankAccountsCount] [int] NULL, 
	[BankImportFilesCount] [int] NULL,
	[BankExportFilesCount] [int] NULL,
	
	[RabobankAccounts] [int] NULL,
	[RabobankLinks] [int] NULL,
	[RabobankImportFiles] [int] NULL,
	[RabobankExportFiles] [int] NULL,
	[ABNAMROBankAccounts] [int] NULL,
	[ABNAMROBankLinks] [int] NULL,
	[ABNAMROBankStatementFiles] [int] NULL,
	[INGBankAccounts] [int] NULL,
	[INGBankLinks] [int] NULL,
	[INGBankStatementFiles] [int] NULL,
	[INGBankPaymentFiles] [int] NULL,
	[INGBankDirectDebitFiles] [int] NULL,

	[LeadCount] [int] NULL,
	[OpportunityCount] [int] NULL,
	[QuoteCount] [int] NULL,
	[EmployeeCount] [int] NULL,
	[AccountCount] [int] NULL,
	[CustomerCount] [int] NULL,
	[SupplierCount] [int] NULL,
	[GLAccountCount] [int] NULL,
	[AssetCount] [int] NULL,
	[AllocationRuleCount] [int] NULL,
	[DocumentCount] [int] NULL,
	[ItemCount] [int] NULL,

	[JournalCount] [int] NULL,
	[CashJournalCount] [int] NULL,
	[BankJournalCount] [int] NULL,
	[SalesJournalCount] [int] NULL,
	[PurchaseJournalCount] [int] NULL,
	[GeneralJournalCount] [int] NULL,	

	[CashEntryCount] [int] NULL,
	[CashEntryMaxLines] [int] NULL,
	[CashEntryAvgLines] [float] NULL,
	[CashTransactions] [int] NULL,

	[BankEntryCount] [int] NULL,
	[BankEntryMaxLines] [int] NULL,
	[BankEntryAvgLines] [float] NULL,
	[BankTransactions] [int] NULL,
	[BankEntryCountImport] [int] NULL,
	[BankEntryMaxLinesImport] [int] NULL,
	[BankEntryAvgLinesImport] [float] NULL,
	[BankTransactionsImport] [int] NULL,
	[BankEntryCountManual] [int] NULL,
	[BankEntryMaxLinesManual] [int] NULL,
	[BankEntryAvgLinesManual] [float] NULL,
	[BankTransactionsManual] [int] NULL,

	[SalesEntryCount] [int] NULL,
	[SalesEntryMaxLines] [int] NULL,
	[SalesEntryAvgLines] [float] NULL,
	[SalesTransactions] [int] NULL,

	[PurchaseEntryCount] [int] NULL,
	[PurchaseEntryMaxLines] [int] NULL,
	[PurchaseEntryAvgLines] [float] NULL,
	[PurchaseTransactions] [int] NULL,

	[GeneralJournalEntryCount] [int] NULL,
	[GeneralJournalEntryMaxLines] [int] NULL,
	[GeneralJournalEntryAvgLines] [float] NULL,
	[GeneralJournalTransactions] [int] NULL,

	[CostcenterTransactions] [int] NULL,
	[CostunitTransactions] [int] NULL,

	[DepreciationPlanCount] [int] NULL,

	[OpportunityStageCount] [int] NOT NULL,
	[LeadSourceCount] [int] NOT NULL,
	[SalesTypeCount] [int] NOT NULL,
	[ReasonCodeCount] [int] NOT NULL,
	[BudgetCount] [int] NULL,
	[PaymentTermCount] [int] NULL,

	[SourceNormal] [int] NULL,
	[SourceBankImport] [int] NULL,
	[SourceXMLImport] [int] NULL,
	[SourceConversion] [int] NULL,
	[SourceInvoice] [int] NULL,
	[SourceRevaluation] [int] NULL,
	[SourceFixedEntry] [int] NULL,
	[SourceVATReturn] [int] NULL,
	[SourceGLMatching] [int] NULL,
	[SourceExchangeRateDiff] [int] NULL,

	[FixedSalesEntryCount] [int] NULL,
	[FixedPurchaseEntryCount] [int] NULL,
	[FixedGeneralJournalEntryCount] [int] NULL,
	[FixedSalesInvoiceCount] [int] NULL,

	[XBRLDocumentsBD] [int] NULL,
	[XBRLDocumentsKVK] [int] NULL,

	[ProjectApproveEntries] [bigint] NULL,
	[ProjectUseProposal] [bigint] NULL,
	[ProjectMandatoryProject] [bigint] NULL,
	[ProjectConsolidateNone] [bigint] NULL,
	[ProjectConsolidateItem] [bigint] NULL,
	[ProjectConsolidateItemProject] [bigint] NULL,
	[ProjectConsolidateItemEmployee] [bigint] NULL,
	[ProjectConsolidateItemEmployeeProject] [bigint] NULL,
	[ProjectTypeFixedPrice] [bigint] NULL,
	[ProjectTypeTimeAndMaterial] [bigint] NULL,
	[ProjectTypeNonBillable] [bigint] NULL,
	[ProjectTotalEmployees] [bigint] NULL,
	[ProjectTotalTimeEntries] [bigint] NULL,
	[ProjectTotalCostEntries] [bigint] NULL,
	[ProjectTotalAbsenceEntries] [int] NULL,
	[ProjectTotalLeaveEntries] [int] NULL,
	[ProjectTotalTimeCorrectionEntries] [int] NULL,
	[ProjectTotalSinglePlanning] [int] NULL,
	[ProjectTotalRecurringPlanning] [int] NULL,
	[ProjectTotalNationalHoliday] [int] NULL,
	[ProjectInvoiceAsQuoted] [int] NULL,
	[ProjectTypePrepaidRetainer] [int] NULL,
	[ProjectTypePrepaidHTB] [int] NULL,
	[ProjectWithWBS] [int] NULL,	
	
	[CostPriceTransactionCount] [int] NULL,

	[SalesOrderEntryCount] [int] NULL,
	[SalesOrderEntryMaxLines] [int] NULL,
	[SalesOrderEntryAvgLines] [float] NULL,
	[SalesOrderLastCreationDate] [datetime] NULL,

	[DeliveryEntryCount] [int] NULL,
	[DeliveryEntryMaxLines] [int] NULL,
	[DeliveryEntryAvgLines] [float] NULL,
	[DeliveryTransactions] [int] NULL,

	[StockEntryReturnCount] [int] NULL,
	[StockEntryReturnMaxLines] [int] NULL,
	[StockEntryReturnAvgLines] [float] NULL,
	[StockEntryReturnTransactions] [int] NULL,

	[PurchaseOrderEntryCount] [int] NULL,
	[PurchaseOrderEntryMaxLines] [int] NULL,
	[PurchaseOrderEntryAvgLines] [float] NULL,
	[PurchaseOrderLastCreationDate] [datetime] NULL,

	[ReceiptEntryCount] [int] NULL,
	[ReceiptEntryMaxLines] [int] NULL,
	[ReceiptEntryAvgLines] [float] NULL,
	[ReceiptTransactions] [int] NULL,
	[ReceiptReturnCount] [int] NULL,
	[ReceiptReturnMaxLines] [int] NULL,
	[ReceiptReturnAvgLines] [float] NULL,
	[ReceiptReturnTransactions] [int] NULL,

	[StockCountEntryCount] [int] NULL,
	[StockCountEntryMaxLines] [int] NULL,
	[StockCountEntryAvgLines] [float] NULL,
	[StockCountTransactions] [int] NULL,

	[PsnSubscriptonTypeAutomaticallyRenewedCount] [bigint] NULL,
	[PsnSubscriptonTypeManuallyRenewedCount] [bigint] NULL,
	[PsnSubscriptonTypeNotRenewedCount] [bigint] NULL,
	[PsnSubscriptionAutomaticallyRenewedCount] [bigint] NULL,
	[PsnSubscriptionManuallyRenewedCount] [bigint] NULL,
	[PsnSubscriptionNotRenewedCount] [bigint] NULL,
	[PsnSubscriptionYearlyCount] [bigint] NULL,
	[PsnSubscriptionHalfYearlyCount] [bigint] NULL,
	[PsnSubscriptionQuarterlyCount] [bigint] NULL,
	[PsnSubscriptionMonthlyCount] [bigint] NULL,
	[PsnSubscriptionPrintedCount] [bigint] NULL,
	[PsnSubscriptionInvoiceCount] [bigint] NULL,
	[PsnAverageSubscriptionInvoiceAmount] [float] NULL,

	[ContractType] [nvarchar](1) NULL,

	[PayrollActiveEmployees] [bigint] NULL,
	[PayrollCLACount] [bigint] NULL,
	[PayrollDepartmentCount] [bigint] NULL,
	[PayrollJobtitleCount] [bigint] NULL,
	[PayrollDivisionType] [tinyint] NULL,
	[PayrollFrequencyYearlyExists] [tinyint] NULL,
	[PayrollFrequencyQuarterlyExists] [tinyint] NULL,
	[PayrollFrequencyMonthlyExists] [tinyint] NULL,
	[PayrollFrequency4WeeklyExists] [tinyint] NULL,
	[PayrollFrequencyWeeklyExists] [tinyint] NULL,

	[SourceElectronicInvoice] [int] NULL,
	[ElectronicSalesEntryCount] [int] NULL,
	[ElectronicPurchaseEntryCount] [int] NULL,

	[QuotationQuantitiesCount] [int] NULL,
	[QuotationMaterialsCount] [int] NULL,
	[QuotationRoutingStepsCount] [int] NULL,

	[ShopOrdersCount] [int] NULL,
	[ShopOrderMaterialsCount] [int] NULL,
	[ShopOrderRoutingStepsCount] [int] NULL,
	[ShopOrderMaterialRealizationsCount] [int] NULL,
	[ShopOrderRoutingStepRealizationsCount] [int] NULL,
	[ShopOrderMaterialIssuesCount] [int] NULL,
	[ShopOrderSubcontractIssuesCount] [int] NULL,
	[ShopOrderRoutingStepTimeEntriesCount] [int] NULL,
	[ShopOrderStockReceiptsCount] [int] NULL,
	[ShopOrderRoutingStepsMaxLines] [int] NULL,
	[ShopOrderRoutingStepsAvgLines] [float] NULL,
	[ShopOrderMaterialsMaxLines] [int] NULL,
	[ShopOrderMaterialsAvgLines] [float] NULL,
	[ShopOrderLastCreationDate] [datetime] NULL,
	[ShopOrderSubOrderLevelMax] [int] NULL,	

	[BudgetScenarioCount] [int] NULL,
	[CostcenterCount] [int] NULL,
	[CostunitCount] [int] NULL,
	[ForeignCurrency] [nchar](3) NULL,
	[CurrencyCount] [int] NULL,
	[ExchangeRateCount] [int] NULL,
	
	[SepaBankAccountCount] [int] NULL,
	
	[PageViewsLastWeek] [int] NULL,
	[PageViewsLastMonth] [int] NULL,
	
	[BackupCount] [int] NULL,
	[RestoreCount] [int] NULL,
	[BackupsInUse] [int] NULL,
	[BackupMinBatch] [int] NULL,
	[BackupMaxBatch] [int] NULL,
	[LastBackup] [datetime] NULL,
	[LastRestore] [datetime] NULL,

	[InconsistentAR] [int] NULL,
	[InconsistentAP] [int] NULL,
	[InconsistentPTMatching] [int] NULL,
	[InconsistentGLMatching] [int] NULL,
	[InconsistentBalanceEntry] [int] NULL,
	[InconsistentBalancePeriod] [int] NULL,
	[InconsistentBalanceDate] [int] NULL,
	[InconsistentReportingBalance] [int] NULL,
	[InconsistentBatchItems] [int] NULL,
	[InconsistentSerialItems] [int] NULL,
	[InconsistentSalesOrderStatus] [int] NULL,
	[InconsistentPurchaseOrderStatus] [int] NULL,

	[SizeKB] [bigint] NULL,
	[AttachmentSizeKB] [bigint] NULL,
	[FullTextWordsSizeKB] [bigint] NULL,
	[BackupSizeKB] [bigint] NULL,
	[ApplicationLogSizeKB] [bigint] NULL,
	[GLTransactionsSizeKB] [bigint] NULL,

	[IntrastatSales] [smallint] NULL,
	[IntrastatPurchase] [smallint] NULL,

	[MailboxConnectionType] [nvarchar](255) NULL,
	[MailboxProcessedEmailCount] [int] NULL,
	[MailboxProcessedEmailSize] [bigint] NULL,
	[MailboxProcessedAttachmentSize] [bigint] NULL,

	[RequestCount] [int] NULL,
	[CampaignCount] [int] NULL,
	[MarketingListCount] [int] NULL,

	[CampaignLinkedToMailChimpCount] [int] NULL,
	[MarketingListLinkedToMailChimpCount] [int] NULL,
	[AccountLinkedToLinkedInCount] [int] NULL,
	[ContactLinkedToLinkedInCount] [int] NULL,
	[AccountLinkedToTwitterCount] [int] NULL,
	[ContactLinkedToTwitterCount] [int] NULL,
	[AccountLinkedToAdministrationCount] [int] NULL,
	[AccountLinkedToMultipleAdministrationsCount] [int] NULL,
	
	[IndicatorsCount] [int] NULL,
	[StarterUsersAccessToCompanyCount] [int] NULL,
	
	[DocumentFoldersCount] [int] NULL,
	[DocumentsWithFolderCount] [int] NULL,
	
	[PurchaseSenderCount] [int] NULL,
	[SalesSenderCount] [int] NULL,
	[CrmSenderCount] [int] NULL,

	[SalesInvoiceFirstDate] [datetime] NULL,
	[SalesInvoiceCount] [int] NULL,
	[SalesInvoiceAvgLines] [float] NULL,
	[SalesInvoiceMaxLines] [int] NULL,
	[DropshipSalesOrderCount] [int] NULL,
	[DropshipSupplierSalesOrderCount] [int] NULL,
	[SalesPriceListCount] [int] NULL,
	[SalesPriceListPeriodCount] [int] NULL,
	[SalesPriceListPeriodAvgItemCount] [float] NULL,
	[SalesPriceListPeriodMaxItemCount] [int] NULL,
	[PurchaseInvoiceCount] [int] NULL,
	[PurchaseInvoiceAvgLines] [float] NULL,
	[PurchaseInvoiceMaxLines] [int] NULL,
	[PurchasePriceListCount] [int] NULL,
	[PurchasePriceListPeriodCount] [int] NULL,
	[PurchasePriceListPeriodAvgItemCount] [float] NULL,
	[PurchasePriceListPeriodMaxItemCount] [int] NULL,
	[BatchItemCount] [int] NULL,
	[SerialItemCount] [int] NULL,
	[AssemblyOrderCount] [int] NULL,
	[WarehouseTransferCount] [int] NULL,
	[WarehouseTransferAvgLines] [float] NULL,
	[WarehouseTransferMaxLines] [int] NULL,
	[LocationTransferCount] [int] NULL,
	[LocationTransferAvgLines] [float] NULL,
	[LocationTransferMaxLines] [int] NULL,
	[UseAllowNegativeStock] [tinyint] NULL,
	[UseSalesOrderApproval] [tinyint] NULL,
	[UseTranssmart] [tinyint] NULL,
	[UseMandatorySerialNumber] [tinyint] NULL,
	[UseReceiveMoreThanOrdered] [tinyint] NULL,
	[ConsultancyDate] [datetime] NULL, 
	
	[UsersWithChangedCompanyRightsCount] [int] NULL,
	[CustomersWithInvolvedUsersCount] [int] NULL,
	[UsersSetAsInvolvedCount] [int] NULL,

	[ItemLowestLevelMax] [int] NULL,

	[ScanningServiceLastUsage] [datetime] NULL,
	[EmployeesWithEmployeeRateCount] [int] NULL,

	[LastCollected] [datetime] NULL,
	[LastCopied] [datetime] NULL,

	[sysmodifier] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL ,
	[syscreated] [datetime] NOT NULL ,
	[CIGCopyTime] [datetime] NULL

)

CREATE CLUSTERED INDEX IX_Environment_DivisionCode ON CustomerIntelligence.[domain].DivisionStatistics_Summary (Environment, DivisionCode) ;

END
GO
