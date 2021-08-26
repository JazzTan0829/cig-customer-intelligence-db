USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[KeyEvents_All_LastUpdated]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[KeyEvents_All_LastUpdated]
GO
/****** Object:  Table [config].[KeyEvents_All_LastUpdated]    Script Date: 24-sept.-18 14:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[KeyEvents_All_LastUpdated](
	[Key Event] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastUpdated] [datetime] NULL
) ON [PRIMARY]
GO
