USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Salesforce_LiveChatButtonSkill]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Salesforce_LiveChatButtonSkill]
GO
/****** Object:  Table [domain].[Salesforce_LiveChatButtonSkill]    Script Date: 24-sept.-18 14:21:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Salesforce_LiveChatButtonSkill](
	[Id] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ButtonId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[LastModifiedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[SkillId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SystemModstamp] [datetime] NULL,
	[EtlInsertTime] [datetime] NULL
) ON [PRIMARY]
GO
