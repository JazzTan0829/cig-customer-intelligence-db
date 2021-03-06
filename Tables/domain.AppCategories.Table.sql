USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_AppCategories_SubCategory]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_AppCategories_SubCategory] ON [domain].[AppCategories]
GO
/****** Object:  Index [IX_AppCategories_ClientID]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_AppCategories_ClientID] ON [domain].[AppCategories] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[AppCategories]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[AppCategories]
GO
/****** Object:  Table [domain].[AppCategories]    Script Date: 24-sept.-18 14:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[AppCategories](
	[Environment] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClientID] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Customer] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Application name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Category] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sub Category] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AppCategories_ClientID]    Script Date: 24-sept.-18 14:21:15 ******/
CREATE CLUSTERED INDEX [IX_AppCategories_ClientID] ON [domain].[AppCategories]
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AppCategories_SubCategory]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_AppCategories_SubCategory] ON [domain].[AppCategories]
(
	[Sub Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
