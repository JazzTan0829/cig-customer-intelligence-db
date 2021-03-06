USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_CalendarDate]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_CalendarDate] ON [config].[Calendar] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [config].[Calendar]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[Calendar]
GO
/****** Object:  Table [config].[Calendar]    Script Date: 24-sept.-18 14:20:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[Calendar](
	[CalendarDate] [datetime] NULL,
	[Year] [int] NULL,
	[Quarter] [int] NULL,
	[Month] [int] NULL,
	[YearMonth] [int] NULL,
	[MonthName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Week] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_CalendarDate]    Script Date: 24-sept.-18 14:20:59 ******/
CREATE CLUSTERED INDEX [IX_CalendarDate] ON [config].[Calendar]
(
	[CalendarDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
