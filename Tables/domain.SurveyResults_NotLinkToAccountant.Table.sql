USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[SurveyResults_NotLinkToAccountant]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[SurveyResults_NotLinkToAccountant]
GO
/****** Object:  Table [domain].[SurveyResults_NotLinkToAccountant]    Script Date: 24-sept.-18 14:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[SurveyResults_NotLinkToAccountant](
	[SubmittedDate] [datetime] NULL,
	[ObjectiveAnswer] [int] NULL,
	[ObjectiveAnswerDescription] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubjectiveAnswer] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [uniqueidentifier] NULL,
	[UserID] [uniqueidentifier] NULL,
	[DivisionCode] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
