USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_RecordType_Latest]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_RecordType_Latest]
GO
/****** Object:  Table [raw].[Salesforce_RecordType_Latest]    Script Date: 24-sept.-18 14:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_RecordType_Latest](
	[Id] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NULL,
	[BusinessProcessId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedById] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[DeveloperName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedById] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[NamespacePrefix] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SobjectType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SystemModstamp] [datetime] NULL,
	[EtlInsertTime] [datetime] NULL
) ON [PRIMARY]
GO
