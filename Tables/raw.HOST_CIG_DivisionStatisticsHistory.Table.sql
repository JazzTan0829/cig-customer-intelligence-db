USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_DivisionStatisticsHistory]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_DivisionStatisticsHistory]
GO
/****** Object:  Table [raw].[HOST_CIG_DivisionStatisticsHistory]    Script Date: 24-sept.-18 14:22:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_DivisionStatisticsHistory](
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[INGBankAccounts] [int] NULL,
	[INGBankLinks] [int] NULL,
	[INGBankStatementFiles] [int] NULL,
	[INGBankPaymentFiles] [int] NULL,
	[INGBankDirectDebitFiles] [int] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[PageViews] [int] NULL,
	[PageViewUsers] [int] NULL,
	[SizeKB] [bigint] NULL,
	[AttachmentSizeKB] [bigint] NULL,
	[FullTextWordsSizeKB] [bigint] NULL,
	[BackupSizeKB] [bigint] NULL,
	[ApplicationLogSizeKB] [bigint] NULL,
	[GLTransactionsSizeKB] [bigint] NULL,
	[GLTransactionsCount] [int] NULL,
	[InconsistentAR] [int] NULL,
	[InconsistentAP] [int] NULL,
	[InconsistentPTMatching] [int] NULL,
	[InconsistentGLMatching] [int] NULL,
	[InconsistentBalanceEntry] [int] NULL,
	[InconsistentBalancePeriod] [int] NULL,
	[InconsistentBalanceDate] [int] NULL,
	[InconsistentReportingBalance] [int] NULL,
	[RabobankAccounts] [int] NULL,
	[RabobankLinks] [int] NULL,
	[RabobankImportFiles] [int] NULL,
	[RabobankExportFiles] [int] NULL,
	[ABNAMROBankAccounts] [int] NULL,
	[ABNAMROBankLinks] [int] NULL,
	[ABNAMROBankStatementFiles] [int] NULL,
	[LastCollected] [datetime] NULL,
	[LastCopied] [datetime] NULL
) ON [PRIMARY]
GO
