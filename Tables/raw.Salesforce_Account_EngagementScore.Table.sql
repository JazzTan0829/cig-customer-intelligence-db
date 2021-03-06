USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_Account_EngagementScore]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_Account_EngagementScore]
GO
/****** Object:  Table [raw].[Salesforce_Account_EngagementScore]    Script Date: 24-sept.-18 14:22:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_Account_EngagementScore](
	[Id] [varchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Customer_Score__c] [int] NULL,
	[RowNumber] [int] NULL,
	[ETLSyncTime] [datetime] NULL
) ON [PRIMARY]
GO
