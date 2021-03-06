USE [CustomerIntelligence]
GO
/****** Object:  Index [CIX_DW_MonthlyAppUsage_LoadDate]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [CIX_DW_MonthlyAppUsage_LoadDate] ON [raw].[DW_MonthlyAppUsage] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[DW_MonthlyAppUsage]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[DW_MonthlyAppUsage]
GO
/****** Object:  Table [raw].[DW_MonthlyAppUsage]    Script Date: 24-sept.-18 14:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[DW_MonthlyAppUsage](
	[ID] [uniqueidentifier] NOT NULL,
	[ENVIRONMENT] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[APPUSAGEFREEREASON] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[APP] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[APPNAME] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ENTRYID] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FIRSTAPPUSAGEDATE] [date] NULL,
	[ISFREECONNECTION] [int] NULL,
	[PARTNER] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PARTNERCODE] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PARTNERNAME] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USAGEMONTH] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USAGEYEAR] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USEDBYCUSTOMER] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USEDBYCUSTOMERCODE] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USEDBYCUSTOMERNAME] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USEDDIVISION] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[USEDDIVISIONNAME] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[META_SOURCE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[META_LOAD_STARTDTS] [datetime] NOT NULL,
	[META_LOAD_ENDDTS] [datetime] NULL,
	[META_PROCESSID] [int] NOT NULL,
	[META_LASTUPDATEPROCESSID] [int] NOT NULL,
	[META_ISDELETED] [bit] NOT NULL,
	[META_HASH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_DW_MonthlyAppUsage_LoadDate]    Script Date: 24-sept.-18 14:21:54 ******/
CREATE CLUSTERED INDEX [CIX_DW_MonthlyAppUsage_LoadDate] ON [raw].[DW_MonthlyAppUsage]
(
	[META_LOAD_STARTDTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
