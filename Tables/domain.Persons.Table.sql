USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_PersonID]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_PersonID] ON [domain].[Persons] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Persons]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Persons]
GO
/****** Object:  Table [domain].[Persons]    Script Date: 24-sept.-18 14:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Persons](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PersonID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NameComposition] [smallint] NOT NULL,
	[LastName] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MiddleName] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Initials] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [nchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Language] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobTitleDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[AnonymisationSource] [tinyint] NULL,
	[IsAnonymized] [tinyint] NULL
) ON [Domain]
GO
/****** Object:  Index [IX_PersonID]    Script Date: 24-sept.-18 14:21:33 ******/
CREATE CLUSTERED INDEX [IX_PersonID] ON [domain].[Persons]
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
