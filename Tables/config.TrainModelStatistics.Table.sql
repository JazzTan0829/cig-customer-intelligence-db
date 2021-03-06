USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[TrainModelStatistics]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[TrainModelStatistics]
GO
/****** Object:  Table [config].[TrainModelStatistics]    Script Date: 24-sept.-18 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[TrainModelStatistics](
	[Environment] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phase] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Category] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Algorithm] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReferenceDate] [datetime] NULL,
	[TrainDate] [datetime] NULL,
	[AUC] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
