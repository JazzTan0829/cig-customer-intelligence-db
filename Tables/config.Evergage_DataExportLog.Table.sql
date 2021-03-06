USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[Evergage_DataExportLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[Evergage_DataExportLog]
GO
/****** Object:  Table [config].[Evergage_DataExportLog]    Script Date: 24-sept.-18 14:21:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[Evergage_DataExportLog](
	[JobName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastExecutionDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
