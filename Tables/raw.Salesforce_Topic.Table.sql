USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Salesforce_Topic]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Salesforce_Topic]
GO
/****** Object:  Table [raw].[Salesforce_Topic]    Script Date: 24-sept.-18 14:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Salesforce_Topic](
	[Id] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [nvarchar](99) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TalkingAbout] [int] NULL,
	[SystemModstamp] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedById] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EtlInsertTime] [datetime] NULL
) ON [PRIMARY]
GO
