USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_ID_CIGCopyTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_ID_CIGCopyTime] ON [raw].[HOST_CIG_Projects] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_Projects]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_Projects]
GO
/****** Object:  Table [raw].[HOST_CIG_Projects]    Script Date: 24-sept.-18 14:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_Projects](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Manager] [uniqueidentifier] NULL,
	[Division] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ProposalDocument] [uniqueidentifier] NULL,
	[ActionCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[DescriptionTermID] [int] NULL,
	[Account] [uniqueidentifier] NULL,
	[Notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [int] NOT NULL,
	[SalesTimeQuantity] [float] NULL,
	[SalesAmountDC] [float] NULL,
	[FixedPriceItem] [uniqueidentifier] NULL,
	[TimeQuantityToAlert] [float] NULL,
	[Classification] [uniqueidentifier] NULL,
	[CustomerPOnumber] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CostsAmountFC] [float] NULL,
	[PrepaidType] [smallint] NULL,
	[PurchaseMarkupPercentage] [float] NULL,
	[PrepaidItem] [uniqueidentifier] NULL,
	[UseBillingMilestones] [tinyint] NOT NULL,
	[BudgetSalesAmountDC] [float] NULL,
	[BudgetCostsAmountDC] [float] NULL,
	[AllowAdditionalInvoicing] [tinyint] NOT NULL,
	[BlockEntry] [tinyint] NOT NULL,
	[BlockRebilling] [tinyint] NOT NULL,
	[AccountContact] [uniqueidentifier] NULL,
	[BudgetType] [smallint] NULL,
	[InvoiceAsQuoted] [tinyint] NOT NULL,
	[SourceQuotation] [uniqueidentifier] NULL,
	[FinancialYear] [smallint] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ID_CIGCopyTime]    Script Date: 24-sept.-18 14:22:15 ******/
CREATE CLUSTERED INDEX [IX_ID_CIGCopyTime] ON [raw].[HOST_CIG_Projects]
(
	[ID] ASC,
	[CIGCopyTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
