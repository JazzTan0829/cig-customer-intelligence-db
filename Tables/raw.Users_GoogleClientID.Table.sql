USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Users_GoogleClientID_UserID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Users_GoogleClientID_UserID] ON [raw].[Users_GoogleClientID] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Users_GoogleClientID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Users_GoogleClientID]
GO
/****** Object:  Table [raw].[Users_GoogleClientID]    Script Date: 24-sept.-18 14:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Users_GoogleClientID](
	[UserID] [uniqueidentifier] NOT NULL,
	[GoogleClientID] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_GoogleClientID_UserID]    Script Date: 24-sept.-18 14:22:33 ******/
CREATE CLUSTERED INDEX [IX_Users_GoogleClientID_UserID] ON [raw].[Users_GoogleClientID]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
