USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_SurveyResults]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_SurveyResults]
GO
/****** Object:  Table [raw].[HOST_CIG_SurveyResults]    Script Date: 24-sept.-18 14:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_SurveyResults](
	[ID] [uniqueidentifier] NOT NULL,
	[QuestionCode] [smallint] NOT NULL,
	[ObjectiveAnswer] [smallint] NULL,
	[SubjectiveAnswer] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Customer] [uniqueidentifier] NOT NULL,
	[ForDivision] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
