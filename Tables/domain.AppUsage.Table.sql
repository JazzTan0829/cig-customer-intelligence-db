USE [CustomerIntelligence]
GO
/****** Object:  Index [CIX_AppUsage_App_Month_Year]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [CIX_AppUsage_App_Month_Year] ON [domain].[AppUsage] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[AppUsage]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[AppUsage]
GO
/****** Object:  Table [domain].[AppUsage]    Script Date: 24-sept.-18 14:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[AppUsage](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[App] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppUsageFreeReason] [int] NULL,
	[IsFreeConnection] [int] NULL,
	[Month] [int] NULL,
	[YEAR] [int] NULL,
	[AccountID] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCode] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionID] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CIX_AppUsage_App_Month_Year]    Script Date: 24-sept.-18 14:21:15 ******/
CREATE CLUSTERED INDEX [CIX_AppUsage_App_Month_Year] ON [domain].[AppUsage]
(
	[App] ASC,
	[YEAR] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
