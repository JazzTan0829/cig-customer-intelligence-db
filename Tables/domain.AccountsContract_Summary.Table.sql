USE [CustomerIntelligence]
GO
/****** Object:  Index [AccountCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [AccountCode] ON [domain].[AccountsContract_Summary] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[AccountsContract_Summary]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[AccountsContract_Summary]
GO
/****** Object:  Table [domain].[AccountsContract_Summary]    Script Date: 24-sept.-18 14:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[AccountsContract_Summary](
	[AccountID] [uniqueidentifier] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[HadTrial] [int] NULL,
	[FirstTrialStartDate] [date] NULL,
	[FirstTrialPackage] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstTrialFinalDate] [date] NULL,
	[LatestTrialPackage] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LatestTrialStartDate] [date] NULL,
	[LatestTrialFinalDate] [date] NULL,
	[HadCommContract] [int] NULL,
	[FirstCommStartDate] [date] NULL,
	[FirstCommPackage] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstCommFinalDate] [date] NULL,
	[LatestCommPackage] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LatestCommStartDate] [date] NULL,
	[LatestCommFinalDate] [date] NULL,
	[CommLifetimeMonths] [int] NULL,
	[LatestMRR] [int] NULL,
	[LatestNumberOfAvailableAdmins] [int] NULL,
	[LatestNumberOfArchivedAdmins] [int] NULL,
	[LatestNumberOfUsers] [int] NULL,
	[LatestNumberPayingUsers] [int] NULL,
	[LatestNumberFreeUsers] [int] NULL,
	[AccountantLinked] [int] NULL,
	[DateFirstLinkedToAccountant] [date] NULL,
	[RequestedFullCancellation] [int] NULL,
	[FullCancellationRequestDate] [date] NULL,
	[Churned] [int] NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AccountCode]    Script Date: 24-sept.-18 14:21:12 ******/
CREATE CLUSTERED INDEX [AccountCode] ON [domain].[AccountsContract_Summary]
(
	[Environment] ASC,
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
