USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[Actions]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[Actions]
GO
/****** Object:  Table [config].[Actions]    Script Date: 24-sept.-18 14:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[Actions](
	[ActionID] [int] NOT NULL,
	[ActionType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActionSystem] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActionDescription] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActionPerformedBy] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActionCurrentlyActive] [int] NULL,
	[StoredProcedure] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateStoredProcedureLastRun] [datetime] NULL,
	[DateStoredProcedureNextRun] [datetime] NULL,
	[FurtherInformation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DaysOfActionFrequency] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
