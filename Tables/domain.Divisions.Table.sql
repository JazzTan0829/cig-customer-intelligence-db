USE [CustomerIntelligence]
GO
/****** Object:  Index [NonClusteredIndex-20170606-115815]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [NonClusteredIndex-20170606-115815] ON [domain].[Divisions]
GO
/****** Object:  Index [IX_Environment_BlockingStatusCode_Deleted]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_Environment_BlockingStatusCode_Deleted] ON [domain].[Divisions]
GO
/****** Object:  Index [IX_Environment_DivisionCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_Environment_DivisionCode] ON [domain].[Divisions] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[Divisions]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Divisions]
GO
/****** Object:  Table [domain].[Divisions]    Script Date: 24-sept.-18 14:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Divisions](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DivisionCode] [int] NOT NULL,
	[DivisionDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [uniqueidentifier] NULL,
	[Country] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Main] [bit] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CustomerPortal] [bit] NOT NULL,
	[BlockingStatusCode] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
	[LinkedDivision] [int] NULL,
	[LegislationCode] [bigint] NULL,
	[TemplateCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DatevAccountantNumber] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DatevClientNumber] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShareCapital] [float] NULL,
	[Origin] [smallint] NOT NULL,
	[Website] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SectorID] [uniqueidentifier] NULL,
	[SubSectorID] [uniqueidentifier] NULL,
	[CompanySizeID] [uniqueidentifier] NULL,
	[ChamberOfCommerce] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Postcode] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DunsNumber] [nvarchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessTypeID] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[Deleter] [uniqueidentifier] NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Environment_DivisionCode]    Script Date: 24-sept.-18 14:21:25 ******/
CREATE CLUSTERED INDEX [IX_Environment_DivisionCode] ON [domain].[Divisions]
(
	[Environment] ASC,
	[DivisionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Environment_BlockingStatusCode_Deleted]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [IX_Environment_BlockingStatusCode_Deleted] ON [domain].[Divisions]
(
	[Environment] ASC,
	[BlockingStatusCode] ASC,
	[Deleted] ASC
)
INCLUDE ( 	[DivisionCode],
	[AccountID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20170606-115815]    Script Date: 24-sept.-18 14:22:35 ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20170606-115815] ON [domain].[Divisions]
(
	[AccountID] ASC,
	[BlockingStatusCode] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
