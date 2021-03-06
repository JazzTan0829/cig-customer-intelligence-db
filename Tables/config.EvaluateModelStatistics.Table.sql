USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[EvaluateModelStatistics]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[EvaluateModelStatistics]
GO
/****** Object:  Table [config].[EvaluateModelStatistics]    Script Date: 24-sept.-18 14:21:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[EvaluateModelStatistics](
	[Environment] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phase] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Category] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrainDate] [datetime] NULL,
	[ReferenceDate] [datetime] NULL,
	[EvaluateDate] [datetime] NULL,
	[AUC] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
