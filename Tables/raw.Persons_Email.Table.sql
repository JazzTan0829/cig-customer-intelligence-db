USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Persons_Email_PersonID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Persons_Email_PersonID] ON [raw].[Persons_Email] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[Persons_Email]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Persons_Email]
GO
/****** Object:  Table [raw].[Persons_Email]    Script Date: 24-sept.-18 14:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Persons_Email](
	[PersonID] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Persons_Email_PersonID]    Script Date: 24-sept.-18 14:22:23 ******/
CREATE CLUSTERED INDEX [IX_Persons_Email_PersonID] ON [raw].[Persons_Email]
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
