USE [CustomerIntelligence]
GO
/****** Object:  Index [CIX_Eloqua_DataExportLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [CIX_Eloqua_DataExportLog] ON [config].[Eloqua_DataExportLog] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [config].[Eloqua_DataExportLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[Eloqua_DataExportLog]
GO
/****** Object:  Table [config].[Eloqua_DataExportLog]    Script Date: 24-sept.-18 14:21:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[Eloqua_DataExportLog](
	[ObjectName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[InsertTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_Eloqua_DataExportLog]    Script Date: 24-sept.-18 14:21:02 ******/
CREATE CLUSTERED INDEX [CIX_Eloqua_DataExportLog] ON [config].[Eloqua_DataExportLog]
(
	[LastModifiedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
