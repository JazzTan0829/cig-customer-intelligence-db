USE [CustomerIntelligence]
GO
/****** Object:  Index [CIX_CIGCopyTime_ID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [CIX_CIGCopyTime_ID] ON [raw].[HOST_CIG_PaymentTerms] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_PaymentTerms]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_PaymentTerms]
GO
/****** Object:  Table [raw].[HOST_CIG_PaymentTerms]    Script Date: 24-sept.-18 14:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_PaymentTerms](
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[AmountDC] [float] NOT NULL,
	[Source] [int] NOT NULL,
	[LineType] [smallint] NOT NULL,
	[AmountFC] [float] NOT NULL,
	[TransactionReversal] [bit] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[TransactionAmountFC] [float] NOT NULL,
	[TransactionAmountDC] [float] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[TransactionStatus] [smallint] NULL,
	[TransactionDueDate] [datetime] NULL,
	[RateFC] [float] NULL,
	[Account] [uniqueidentifier] NULL,
	[AccountContact] [uniqueidentifier] NULL,
	[Currency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[EntryID] [uniqueidentifier] NULL,
	[Journal] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_CIGCopyTime_ID]    Script Date: 24-sept.-18 14:22:14 ******/
CREATE CLUSTERED INDEX [CIX_CIGCopyTime_ID] ON [raw].[HOST_CIG_PaymentTerms]
(
	[CIGCopyTime] DESC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
