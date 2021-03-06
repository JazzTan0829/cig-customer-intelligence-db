USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_AccountID] ON [raw].[PaymentTerms] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[PaymentTerms]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[PaymentTerms]
GO
/****** Object:  Table [raw].[PaymentTerms]    Script Date: 24-sept.-18 14:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[PaymentTerms](
	[PaymentTermsID] [uniqueidentifier] NOT NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [uniqueidentifier] NULL,
	[AccountContact] [uniqueidentifier] NULL,
	[DivisionCode] [int] NOT NULL,
	[EntryID] [uniqueidentifier] NULL,
	[Journal] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LineType] [smallint] NOT NULL,
	[Currency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AmountFC] [float] NOT NULL,
	[RateFC] [float] NULL,
	[AmountDC] [float] NOT NULL,
	[EntryDate] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[EndYear] [smallint] NULL,
	[EndPeriod] [smallint] NULL,
	[EntryNumber] [int] NULL,
	[InvoiceNumber] [int] NULL,
	[Status] [smallint] NULL,
	[MatchID] [uniqueidentifier] NULL,
	[WriteOffCode] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source] [int] NOT NULL,
	[PaymentCondition] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentDiscountType] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentDiscount] [float] NULL,
	[PaymentReference] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentMethod] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentDays] [int] NULL,
	[PaymentStatus] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransactionID] [uniqueidentifier] NULL,
	[TransactionType] [int] NULL,
	[TransactionReportingYear] [smallint] NULL,
	[TransactionReportingPeriod] [smallint] NULL,
	[TransactionReversal] [bit] NOT NULL,
	[TransactionStatus] [smallint] NULL,
	[TransactionDueDate] [datetime] NULL,
	[TransactionAmountFC] [float] NOT NULL,
	[TransactionAmountDC] [float] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 24-sept.-18 14:22:23 ******/
CREATE CLUSTERED INDEX [IX_AccountID] ON [raw].[PaymentTerms]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
