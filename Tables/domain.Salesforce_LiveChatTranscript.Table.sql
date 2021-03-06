USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Salesforce_LiveChatTranscript]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Salesforce_LiveChatTranscript]
GO
/****** Object:  Table [domain].[Salesforce_LiveChatTranscript]    Script Date: 24-sept.-18 14:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Salesforce_LiveChatTranscript](
	[Id] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Abandoned] [int] NULL,
	[AccountId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AverageResponseTimeOperator] [int] NULL,
	[AverageResponseTimeVisitor] [int] NULL,
	[Body] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Browser] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BrowserLanguage] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CaseId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChatDuration] [int] NULL,
	[ChatKey] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EndedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IpAddress] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [bit] NULL,
	[LastModifiedById] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastModifiedDate] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[StartTime] [datetime] NULL,
	[SystemModstamp] [datetime] NULL,
	[RequestTime] [datetime] NULL,
	[LeadId] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LiveChatButtonId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LiveChatDeploymentId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LiveChatVisitorId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Location] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaxResponseTimeOperator] [int] NULL,
	[MaxResponseTimeVisitor] [int] NULL,
	[Name] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OperatorMessageCount] [int] NULL,
	[OwnerId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Platform] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReferrerUri] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ScreenResolution] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SkillId] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SupervisorTranscriptBody] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserAgent] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VisitorMessageCount] [int] NULL,
	[WaitTime] [int] NULL,
	[EtlInsertTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
