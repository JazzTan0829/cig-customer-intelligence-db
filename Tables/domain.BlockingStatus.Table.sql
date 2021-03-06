USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_BlockingStatus]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_BlockingStatus] ON [domain].[BlockingStatus] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[BlockingStatus]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[BlockingStatus]
GO
/****** Object:  Table [domain].[BlockingStatus]    Script Date: 24-sept.-18 14:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[BlockingStatus](
	[BlockingStatusCode] [int] NOT NULL,
	[BlockingStatusDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DescriptionTermID] [int] NULL,
	[DescriptionSuffix] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DescriptionSuffixTermID] [int] NULL,
	[CIGCopyTime] [datetime] NULL
) ON [Domain]
GO
/****** Object:  Index [IX_BlockingStatus]    Script Date: 24-sept.-18 14:21:17 ******/
CREATE CLUSTERED INDEX [IX_BlockingStatus] ON [domain].[BlockingStatus]
(
	[BlockingStatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
