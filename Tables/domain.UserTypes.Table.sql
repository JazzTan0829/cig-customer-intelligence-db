USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Environment_UserTypeID]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_Environment_UserTypeID] ON [domain].[UserTypes] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[UserTypes]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[UserTypes]
GO
/****** Object:  Table [domain].[UserTypes]    Script Date: 24-sept.-18 14:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[UserTypes](
	[UserTypeID] [uniqueidentifier] NOT NULL,
	[UserTypeCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserTypeDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserTypeDescriptionTermId] [int] NULL,
	[Item] [uniqueidentifier] NOT NULL,
	[StartPage] [smallint] NULL,
	[PortalMenu] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[GettingStartedPage] [smallint] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CIGCopyTime] [datetime] NULL
) ON [Domain]
GO
/****** Object:  Index [IX_Environment_UserTypeID]    Script Date: 24-sept.-18 14:21:45 ******/
CREATE CLUSTERED INDEX [IX_Environment_UserTypeID] ON [domain].[UserTypes]
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
