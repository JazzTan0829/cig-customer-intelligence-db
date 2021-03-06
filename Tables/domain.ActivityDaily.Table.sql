USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_ActivityDaily_ActivityId_Environment_Date]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_ActivityDaily_ActivityId_Environment_Date] ON [domain].[ActivityDaily]
GO
/****** Object:  Index [IX_ActivityDaily_AccountId_Date]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_ActivityDaily_AccountId_Date] ON [domain].[ActivityDaily]
GO
/****** Object:  Index [AccountCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [AccountCode] ON [domain].[ActivityDaily] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[ActivityDaily]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ActivityDaily]
GO
/****** Object:  Table [domain].[ActivityDaily]    Script Date: 24-sept.-18 14:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ActivityDaily](
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Date] [date] NOT NULL,
	[AccountCode] [nchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionCode] [nvarchar](36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActivityID] [int] NULL,
	[Quantity] [int] NULL,
	[AverageDuration] [float] NULL,
	[AccountID] [uniqueidentifier] NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AccountCode]    Script Date: 24-sept.-18 14:21:13 ******/
CREATE CLUSTERED INDEX [AccountCode] ON [domain].[ActivityDaily]
(
	[Environment] ASC,
	[Date] ASC,
	[AccountCode] ASC,
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
/****** Object:  Index [IX_ActivityDaily_AccountId_Date]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_ActivityDaily_AccountId_Date] ON [domain].[ActivityDaily]
(
	[AccountID] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ActivityDaily_ActivityId_Environment_Date]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_ActivityDaily_ActivityId_Environment_Date] ON [domain].[ActivityDaily]
(
	[Environment] ASC,
	[ActivityID] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
