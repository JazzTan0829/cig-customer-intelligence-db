USE [CustomerIntelligence]
GO
/****** Object:  Index [EnviroAccountCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [EnviroAccountCode] ON [domain].[Consultancy] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Consultancy]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Consultancy]
GO
/****** Object:  Table [domain].[Consultancy]    Script Date: 24-sept.-18 14:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Consultancy](
	[ID] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TypeHID] [int] NOT NULL,
	[TypeDescription] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Created] [date] NULL,
	[AccountCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Approved] [date] NULL,
	[Realised] [date] NULL,
	[Status] [smallint] NULL,
	[ItemCode_1] [nvarchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreeTextField_01] [nvarchar](160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [Domain] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EnviroAccountCode]    Script Date: 24-sept.-18 14:21:20 ******/
CREATE CLUSTERED INDEX [EnviroAccountCode] ON [domain].[Consultancy]
(
	[Environment] ASC,
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
