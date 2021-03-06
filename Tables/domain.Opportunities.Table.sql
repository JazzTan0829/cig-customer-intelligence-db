USE [CustomerIntelligence]
GO
/****** Object:  Index [EnviroAccountCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [EnviroAccountCode] ON [domain].[Opportunities] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Opportunities]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Opportunities]
GO
/****** Object:  Table [domain].[Opportunities]    Script Date: 24-sept.-18 14:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Opportunities](
	[ID] [uniqueidentifier] NOT NULL,
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCode] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActionDate] [datetime] NULL,
	[AmountFC] [float] NULL,
	[AmountDC] [float] NULL,
	[CloseDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[Creator] [uniqueidentifier] NULL,
	[Modified] [datetime] NULL,
	[Currency] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityStage] [uniqueidentifier] NULL,
	[OpportunityStageDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityStatus] [int] NULL,
	[Probability] [float] NULL,
	[Owner] [uniqueidentifier] NULL,
	[OwnerFullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RateFC] [float] NULL,
	[LeadSource] [uniqueidentifier] NULL,
	[LeadSourceDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalesType] [uniqueidentifier] NULL,
	[SalesTypeDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReasonCode] [uniqueidentifier] NULL,
	[ReasonCodeDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Project] [uniqueidentifier] NULL,
	[ProjectCode] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProjectDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Campaign] [uniqueidentifier] NULL,
	[CampaignDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OpportunityTypeDescription] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Channel] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChannelDescription] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EnviroAccountCode]    Script Date: 24-sept.-18 14:21:31 ******/
CREATE CLUSTERED INDEX [EnviroAccountCode] ON [domain].[Opportunities]
(
	[Environment] ASC,
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
