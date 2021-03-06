USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[YearMonth]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[YearMonth]
GO
/****** Object:  Table [config].[YearMonth]    Script Date: 24-sept.-18 14:21:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[YearMonth](
	[Year] [int] NULL,
	[Month] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Sequence] [int] NULL
) ON [PRIMARY]
GO
