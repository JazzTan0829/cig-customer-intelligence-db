USE [CustomerIntelligence]
GO
/****** Object:  Table [publish].[Salesforce_NextBestAction_BuildTable]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [publish].[Salesforce_NextBestAction_BuildTable]
GO
/****** Object:  Table [publish].[Salesforce_NextBestAction_BuildTable]    Script Date: 24-sept.-18 14:21:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [publish].[Salesforce_NextBestAction_BuildTable](
	[AccountID] [uniqueidentifier] NOT NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountantLinkRelevant] [int] NULL,
	[AccountantLinked] [int] NULL,
	[LatestCommPackage] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankLinkFunctionality] [int] NULL,
	[BankLinkCapableAccounts] [int] NULL,
	[AutomaticBankLink] [int] NULL,
	[SalesInvoiceFunctionality] [int] NULL,
	[SalesInvoiceCount] [int] NULL,
	[LatestDateTimeCommunityAccessed] [datetime] NULL,
	[LatestDateMobileDivisionAccessed] [date] NULL,
	[InsertedDateTime] [datetime] NULL
) ON [PRIMARY]
GO
