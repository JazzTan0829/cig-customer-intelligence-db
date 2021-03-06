USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_raw.Persons_GDPR]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_raw.Persons_GDPR] ON [raw].[HOST_CIG_Persons]
GO
/****** Object:  Index [IX_PersonID_CIGCopyTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_PersonID_CIGCopyTime] ON [raw].[HOST_CIG_Persons] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_Persons]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_Persons]
GO
/****** Object:  Table [raw].[HOST_CIG_Persons]    Script Date: 24-sept.-18 14:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_Persons](
	[ID] [uniqueidentifier] NOT NULL,
	[HID] [int] NOT NULL,
	[FullName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NameComposition] [smallint] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[Customer] [uniqueidentifier] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[AddressLine3] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreator] [uniqueidentifier] NULL,
	[LastName] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MiddleName] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Initials] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [nchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Language] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobTitleDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsAnonymized] [tinyint] NULL,
	[AnonymisationSource] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersonID_CIGCopyTime]    Script Date: 24-sept.-18 14:22:15 ******/
CREATE CLUSTERED INDEX [IX_PersonID_CIGCopyTime] ON [raw].[HOST_CIG_Persons]
(
	[ID] ASC,
	[CIGCopyTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_raw.Persons_GDPR]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_raw.Persons_GDPR] ON [raw].[HOST_CIG_Persons]
(
	[IsAnonymized] DESC
)
INCLUDE ( 	[ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
