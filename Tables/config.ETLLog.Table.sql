USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_ETLLog_Level_Date_INCLUDE_ComponentName]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_ETLLog_Level_Date_INCLUDE_ComponentName] ON [config].[ETLLog]
GO
/****** Object:  Index [ix_etllog_date]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [ix_etllog_date] ON [config].[ETLLog]
GO
/****** Object:  Table [config].[ETLLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[ETLLog]
GO
/****** Object:  Table [config].[ETLLog]    Script Date: 24-sept.-18 14:21:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[ETLLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ComponentName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ComponentGuid] [uniqueidentifier] NULL,
	[Thread] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Level] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Logger] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Message] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Exception] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobGroupName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CorrelationId] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [ix_etllog_date]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [ix_etllog_date] ON [config].[ETLLog]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ETLLog_Level_Date_INCLUDE_ComponentName]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_ETLLog_Level_Date_INCLUDE_ComponentName] ON [config].[ETLLog]
(
	[Level] ASC,
	[Date] ASC
)
INCLUDE ( 	[ComponentName]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
