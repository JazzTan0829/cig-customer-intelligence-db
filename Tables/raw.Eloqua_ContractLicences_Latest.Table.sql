USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Eloqua_ContractLicences_Latest]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Eloqua_ContractLicences_Latest]
GO
/****** Object:  Table [raw].[Eloqua_ContractLicences_Latest]    Script Date: 24-sept.-18 14:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Eloqua_ContractLicences_Latest](
	[EOLContractID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLAccountID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLContactID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailAddress] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractStartDate] [datetime] NULL,
	[ContractFinalDate] [datetime] NULL,
	[ContractStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractCancellationDate] [datetime] NULL,
	[ContractCancellationReason] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Package] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModulesAll] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModulesCommercial] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModulesTrial] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModulesPilot] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModulesInactive] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractValue] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLAccountCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TotalContractValue] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreationEvent] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemPayroll] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DatePayrollUsage] [datetime] NULL,
	[ItemScaning] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateScaningUsage] [datetime] NULL,
	[DataCleansing] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExternalId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL
) ON [PRIMARY]
GO
