USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_PersonID]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_PersonID] ON [domain].[Contacts] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Contacts]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Contacts]
GO
/****** Object:  Table [domain].[Contacts]    Script Date: 24-sept.-18 14:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Contacts](
	[ContactID] [uniqueidentifier] NOT NULL,
	[PersonID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[DivisionCode] [int] NOT NULL,
	[JobTitleDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsMailingExcluded] [tinyint] NOT NULL,
	[IsUXParticipant] [tinyint] NOT NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[CIGCopyTime] [datetime] NULL
) ON [Domain]
GO
/****** Object:  Index [IX_PersonID]    Script Date: 24-sept.-18 14:21:21 ******/
CREATE CLUSTERED INDEX [IX_PersonID] ON [domain].[Contacts]
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
