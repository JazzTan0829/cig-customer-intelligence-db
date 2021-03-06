USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[SurveyResults]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[SurveyResults]
GO
/****** Object:  Table [domain].[SurveyResults]    Script Date: 24-sept.-18 14:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[SurveyResults](
	[SurveyResultID] [uniqueidentifier] NOT NULL,
	[QuestionCode] [smallint] NOT NULL,
	[ObjectiveAnswer] [smallint] NULL,
	[SubjectiveAnswer] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[DivisionCode] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
