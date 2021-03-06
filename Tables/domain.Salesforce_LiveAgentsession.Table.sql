USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Salesforce_LiveAgentsession]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Salesforce_LiveAgentsession]
GO
/****** Object:  Table [domain].[Salesforce_LiveAgentsession]    Script Date: 24-sept.-18 14:21:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Salesforce_LiveAgentsession](
	[Id] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AgentId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChatReqAssigned] [int] NULL,
	[ChatReqDeclined] [int] NULL,
	[ChatReqEngaged] [int] NULL,
	[CreatedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[LastModifiedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[LoginTime] [datetime] NULL,
	[LogoutTime] [datetime] NULL,
	[Name] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NumFlagLoweredAgent] [int] NULL,
	[NumFlagLoweredSupervisor] [int] NULL,
	[NumFlagRaised] [int] NULL,
	[OwnerId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SystemModstamp] [datetime] NULL,
	[TimeAtCapacity] [int] NULL,
	[TimeIdle] [int] NULL,
	[TimeInAwayStatus] [int] NULL,
	[TimeInChats] [int] NULL,
	[TimeInOnlineStatus] [int] NULL,
	[EtlInsertTime] [datetime] NULL,
	[ChatReqTimedOut] [int] NULL
) ON [PRIMARY]
GO
