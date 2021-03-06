USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[PredictionModelCoefficients]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[PredictionModelCoefficients]
GO
/****** Object:  Table [config].[PredictionModelCoefficients]    Script Date: 24-sept.-18 14:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[PredictionModelCoefficients](
	[Variables] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coefficients] [float] NULL,
	[Environment] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReferenceDate] [datetime] NULL,
	[TrainDate] [datetime] NULL,
	[AUC] [float] NULL
) ON [PRIMARY]
GO
