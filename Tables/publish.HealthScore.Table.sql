USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Enviro_AccountCode_PredictDate]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_Enviro_AccountCode_PredictDate] ON [publish].[HealthScore] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [publish].[HealthScore]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [publish].[HealthScore]
GO
/****** Object:  Table [publish].[HealthScore]    Script Date: 24-sept.-18 14:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [publish].[HealthScore](
	[Environment] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCode] [int] NULL,
	[PackageCode] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HealthScore] [float] NULL,
	[ReferenceDate] [datetime] NULL,
	[PredictDate] [datetime] NULL,
	[Phase] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Enviro_AccountCode_PredictDate]    Script Date: 24-sept.-18 14:21:47 ******/
CREATE CLUSTERED INDEX [IX_Enviro_AccountCode_PredictDate] ON [publish].[HealthScore]
(
	[Environment] ASC,
	[AccountCode] ASC,
	[PredictDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
