USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_Accounts_AccountCode]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Accounts_AccountCode] ON [domain].[Accounts]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_AccountID] ON [domain].[Accounts]
GO
/****** Object:  Index [AccountClassificationCode]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [AccountClassificationCode] ON [domain].[Accounts]
GO
/****** Object:  Index [EnvAccountCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [EnvAccountCode] ON [domain].[Accounts] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Accounts]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Accounts]
GO
/****** Object:  Table [domain].[Accounts]    Script Date: 24-sept.-18 14:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Accounts](
	[AccountID] [uniqueidentifier] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsAccountant] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountantOrLinked] [tinyint] NOT NULL,
	[EntrepreneurAccountantLinked] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountantCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChamberOfCommerce] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VATNumber] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Postcode] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SectorCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubSectorCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompSizeCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusTypeCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountClassificationCode] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountManagerCode] [int] NULL,
	[AccountManagerAccountantCode] [int] NULL,
	[ResellerCode] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LeadSourceCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Blocked] [tinyint] NULL,
	[NumberOfBlankKeyFields] [int] NULL,
	[CustomerProfileURL] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOLCardURL] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DunsNumber] [nvarchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NULL,
	[sysmodified] [datetime] NULL,
	[SBICode] [uniqueidentifier] NULL,
	[DatabaseID] [uniqueidentifier] NULL,
	[MainContact] [uniqueidentifier] NULL,
	[MainDivision] [int] NULL,
	[IsAnonymized] [int] NULL,
	[LeadPurpose] [uniqueidentifier] NULL,
	[AnonymisationSource] [tinyint] NULL
) ON [Domain] TEXTIMAGE_ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EnvAccountCode]    Script Date: 24-sept.-18 14:21:11 ******/
CREATE CLUSTERED INDEX [EnvAccountCode] ON [domain].[Accounts]
(
	[Environment] ASC,
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AccountClassificationCode]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [AccountClassificationCode] ON [domain].[Accounts]
(
	[AccountClassificationCode] ASC
)
INCLUDE ( 	[Environment],
	[AccountCode],
	[IsAccountant],
	[AccountantOrLinked]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountID]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_AccountID] ON [domain].[Accounts]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Accounts_AccountCode]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Accounts_AccountCode] ON [domain].[Accounts]
(
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
