USE [CustomerIntelligence]
GO
/****** Object:  Index [NonClusteredIndex-20180424-133105]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [NonClusteredIndex-20180424-133105] ON [domain].[DivisionsLog]
GO
/****** Object:  Index [NonClusteredIndex-20180424-133027]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [NonClusteredIndex-20180424-133027] ON [domain].[DivisionsLog]
GO
/****** Object:  Index [ClusteredIndex-20180424-132915]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [ClusteredIndex-20180424-132915] ON [domain].[DivisionsLog] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[DivisionsLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[DivisionsLog]
GO
/****** Object:  Table [domain].[DivisionsLog]    Script Date: 24-sept.-18 14:21:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[DivisionsLog](
	[DivisionCode] [int] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [datetime] NULL,
	[Archived] [datetime] NULL,
	[Blocked] [datetime] NULL,
	[Blocked&Deleted] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[YearMonthDeleted] [int] NULL,
	[YearMonthBlocked] [int] NULL,
	[YearMonthArchived] [int] NULL,
	[YearMonthBlocked&Deleted] [int] NULL,
	[YearMonthStarted] [int] NULL,
	[ItemDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ended] [datetime] NULL,
	[YearMonthEnded] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ClusteredIndex-20180424-132915]    Script Date: 24-sept.-18 14:21:25 ******/
CREATE CLUSTERED INDEX [ClusteredIndex-20180424-132915] ON [domain].[DivisionsLog]
(
	[Environment] ASC,
	[DivisionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20180424-133027]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180424-133027] ON [domain].[DivisionsLog]
(
	[ItemDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20180424-133105]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180424-133105] ON [domain].[DivisionsLog]
(
	[YearMonthStarted] ASC,
	[YearMonthDeleted] ASC,
	[YearMonthBlocked] ASC,
	[YearMonthArchived] ASC,
	[YearMonthBlocked&Deleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
