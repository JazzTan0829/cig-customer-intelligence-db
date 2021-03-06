USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_SourceVATReturn]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_SourceVATReturn] ON [domain].[DivisionStatistics_DailyChanges]
GO
/****** Object:  Index [IX_Environment_DivisionCode_Date]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_Environment_DivisionCode_Date] ON [domain].[DivisionStatistics_DailyChanges] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[DivisionStatistics_DailyChanges]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[DivisionStatistics_DailyChanges]
GO
/****** Object:  Table [domain].[DivisionStatistics_DailyChanges]    Script Date: 24-sept.-18 14:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[DivisionStatistics_DailyChanges](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DivisionCode] [int] NOT NULL,
	[Date] [date] NULL,
	[GLTransactionsCount] [int] NULL,
	[VATTransactions] [int] NULL,
	[InvoiceLinesCount] [int] NULL,
	[SourceVATReturn] [int] NULL,
	[OpportunityCount] [int] NULL,
	[AccountCount] [int] NULL,
	[CustomerCount] [int] NULL,
	[SupplierCount] [int] NULL,
	[GLAccountCount] [int] NULL,
	[DocumentCount] [int] NULL,
	[ItemCount] [int] NULL,
	[CashEntryCount] [int] NULL,
	[CashTransactions] [int] NULL,
	[AutomaticBankLink] [int] NULL,
	[RabobankAccounts] [int] NULL,
	[ABNAMROBankAccounts] [int] NULL,
	[INGBankAccounts] [int] NULL,
	[BankEntryCount] [int] NULL,
	[BankTransactions] [int] NULL,
	[BankTransactionsImport] [int] NULL,
	[BankTransactionsManual] [int] NULL,
	[SalesEntryCount] [int] NULL,
	[SalesTransactions] [int] NULL,
	[PurchaseEntryCount] [int] NULL,
	[PurchaseTransactions] [int] NULL,
	[GeneralJournalEntryCount] [int] NULL,
	[GeneralJournalTransactions] [int] NULL,
	[ProjectTotalEmployees] [bigint] NULL,
	[ProjectTotalTimeEntries] [bigint] NULL,
	[ProjectTotalCostEntries] [bigint] NULL,
	[ProjectTypeFixedPrice] [bigint] NULL,
	[ProjectTypeTimeAndMaterial] [bigint] NULL,
	[ProjectTypeNonBillable] [bigint] NULL,
	[ProjectTypePrepaidRetainer] [int] NULL,
	[ProjectTypePrepaidHTB] [int] NULL,
	[SalesOrderEntryCount] [int] NULL,
	[StockCountEntryCount] [int] NULL,
	[StockCountTransactions] [int] NULL,
	[SalesInvoiceCount] [int] NULL,
	[PurchaseInvoiceCount] [int] NULL,
	[StarterUsersAccessToCompanyCount] [int] NULL,
	[UsersWithChangedCompanyRightsCount] [int] NULL,
	[UsersSetAsInvolvedCount] [int] NULL,
	[CustomersWithInvolvedUsersCount] [int] NULL,
	[LeadSourceCount] [int] NULL,
	[ElectronicPurchaseEntryCount] [bigint] NULL,
	[ElectronicSalesEntryCount] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Environment_DivisionCode_Date]    Script Date: 24-sept.-18 14:21:26 ******/
CREATE CLUSTERED INDEX [IX_Environment_DivisionCode_Date] ON [domain].[DivisionStatistics_DailyChanges]
(
	[Environment] ASC,
	[DivisionCode] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SourceVATReturn]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_SourceVATReturn] ON [domain].[DivisionStatistics_DailyChanges]
(
	[SourceVATReturn] ASC
)
INCLUDE ( 	[Environment],
	[DivisionCode],
	[Date]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
