USE [CustomerIntelligence]
GO
/****** Object:  Index [CJ]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [CJ] ON [domain].[CJ]
GO
/****** Object:  Table [domain].[CJ]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[CJ]
GO
/****** Object:  Table [domain].[CJ]    Script Date: 24-sept.-18 14:21:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[CJ](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Journey] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductJourney] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CJ]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [CJ] ON [domain].[CJ]
(
	[Environment] ASC,
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
