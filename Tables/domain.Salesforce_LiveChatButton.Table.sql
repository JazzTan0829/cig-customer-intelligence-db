USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Salesforce_LiveChatButton]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Salesforce_LiveChatButton]
GO
/****** Object:  Table [domain].[Salesforce_LiveChatButton]    Script Date: 24-sept.-18 14:21:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Salesforce_LiveChatButton](
	[Id] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AutoGreeting] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChasitorIdleTimeout] [int] NULL,
	[ChasitorIdleTimeoutWarning] [int] NULL,
	[ChatPageId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[CustomAgentName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DeveloperName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HasQueue] [bit] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[Language] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[MasterLabel] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OptionsHasChasitorIdleTimeout] [bit] NULL,
	[OptionsHasInviteAfterAccept] [bit] NULL,
	[OptionsHasInviteAfterReject] [bit] NULL,
	[OptionsHasRerouteDeclinedRequest] [bit] NULL,
	[OptionsIsAutoAccept] [bit] NULL,
	[OptionsIsInviteAutoRemove] [bit] NULL,
	[OverallQueueLength] [int] NULL,
	[PerAgentQueueLength] [int] NULL,
	[RoutingType] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SkillId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SystemModstamp] [datetime] NULL,
	[Type] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WindowLanguage] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EtlInsertTime] [datetime] NULL
) ON [PRIMARY]
GO
