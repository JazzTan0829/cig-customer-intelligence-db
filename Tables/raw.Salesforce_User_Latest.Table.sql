USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_User_Latest]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_User_Latest]
GO
/****** Object:  Table [raw].[Salesforce_User_Latest]    Script Date: 24-sept.-18 14:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_User_Latest](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CommunityNickname] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserType] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProfileId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExactIDAccount__c] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[EtlInsertTime] [datetime] NOT NULL,
	[Alias] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MiddleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
