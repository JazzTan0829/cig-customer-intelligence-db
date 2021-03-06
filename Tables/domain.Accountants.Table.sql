USE [CustomerIntelligence]
GO
/****** Object:  Index [AccountantCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [AccountantCode] ON [domain].[Accountants] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Accountants]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Accountants]
GO
/****** Object:  Table [domain].[Accountants]    Script Date: 24-sept.-18 14:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Accountants](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountantCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountantName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AccountantCode]    Script Date: 24-sept.-18 14:21:10 ******/
CREATE CLUSTERED INDEX [AccountantCode] ON [domain].[Accountants]
(
	[Environment] ASC,
	[AccountantCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
