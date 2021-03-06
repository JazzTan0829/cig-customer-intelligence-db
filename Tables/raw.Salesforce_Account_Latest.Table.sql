USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_Account_Latest]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_Account_Latest]
GO
/****** Object:  Table [raw].[Salesforce_Account_Latest]    Script Date: 24-sept.-18 14:22:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_Account_Latest](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exact_ID__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[EtlInsertTime] [datetime] NULL,
	[Active__c] [bit] NULL,
	[Business_Type__c] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Company_Size__c] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contract_value__c] [float] NULL,
	[ControlledRelease__c] [bit] NULL,
	[Enddate__c] [datetime] NULL,
	[Industry] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsPartner] [bit] NULL,
	[Name] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Package__c] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sector__c] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subscription__c] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
