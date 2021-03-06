USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_Contact_Latest]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_Contact_Latest]
GO
/****** Object:  Table [raw].[Salesforce_Contact_Latest]    Script Date: 24-sept.-18 14:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_Contact_Latest](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsEmailBounced] [bit] NULL,
	[LastActivityDate] [datetime] NULL,
	[LastCURequestDate] [datetime] NULL,
	[LastCUUpdateDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastViewedDate] [datetime] NULL,
	[Enddate__c] [datetime] NULL,
	[UserID__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOL_User__c] [bit] NULL,
	[Exact_ID__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gender__c] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Language__c] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Startdate__c] [datetime] NULL,
	[EtlInsertTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
