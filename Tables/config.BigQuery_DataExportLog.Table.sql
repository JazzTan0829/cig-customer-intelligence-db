USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[BigQuery_DataExportLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[BigQuery_DataExportLog]
GO
/****** Object:  Table [config].[BigQuery_DataExportLog]    Script Date: 24-sept.-18 14:20:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[BigQuery_DataExportLog](
	[DataSetId] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TableName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ExportDate] [date] NOT NULL,
	[InsertTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
