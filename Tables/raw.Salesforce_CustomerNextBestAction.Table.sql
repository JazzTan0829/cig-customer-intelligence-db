USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_CustomerNextBestAction]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_CustomerNextBestAction]
GO
/****** Object:  Table [raw].[Salesforce_CustomerNextBestAction]    Script Date: 24-sept.-18 14:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_CustomerNextBestAction](
	[Id] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account__c] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Action_Title__c] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Action__c] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Case__c] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIG_ID__c] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact__c] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsTaken__c] [bit] NULL,
	[Is_Suggested__c] [bit] NULL,
	[Name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Success_Impact_estimate__c] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes__c] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EtlInsertTime] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
