USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_HOST_CIG_Users_PersonID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_HOST_CIG_Users_PersonID] ON [raw].[HOST_CIG_Users]
GO
/****** Object:  Index [IX_UserID_CIGCopyTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_UserID_CIGCopyTime] ON [raw].[HOST_CIG_Users] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_Users]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_Users]
GO
/****** Object:  Table [raw].[HOST_CIG_Users]    Script Date: 24-sept.-18 14:22:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_Users](
	[ID] [uniqueidentifier] NOT NULL,
	[HID] [int] NOT NULL,
	[UserName] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FullName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Person] [uniqueidentifier] NOT NULL,
	[Customer] [uniqueidentifier] NOT NULL,
	[Blocked] [tinyint] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[AuthenticationType] [int] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[LockoutTime] [datetime] NULL,
	[LockoutAttempts] [int] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ValidationDate] [datetime] NULL,
	[ValidationID] [uniqueidentifier] NULL,
	[LastLogin] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[Digipass] [uniqueidentifier] NULL,
	[GoogleClientID] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TotpRegistrationUtcDate] [datetime] NULL,
	[TotpSkippedUtc] [datetime] NULL,
	[TotpForcedByExactUtc] [datetime] NULL,
	[MarketingOptInDate] [datetime] NULL,
	[MarketingOptOutDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID_CIGCopyTime]    Script Date: 24-sept.-18 14:22:19 ******/
CREATE CLUSTERED INDEX [IX_UserID_CIGCopyTime] ON [raw].[HOST_CIG_Users]
(
	[ID] ASC,
	[CIGCopyTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HOST_CIG_Users_PersonID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_HOST_CIG_Users_PersonID] ON [raw].[HOST_CIG_Users]
(
	[Person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
