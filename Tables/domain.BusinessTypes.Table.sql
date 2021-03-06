USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_BusinessTypeCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [IX_BusinessTypeCode] ON [domain].[BusinessTypes] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[BusinessTypes]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[BusinessTypes]
GO
/****** Object:  Table [domain].[BusinessTypes]    Script Date: 24-sept.-18 14:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[BusinessTypes](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermID] [int] NULL,
	[Country] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortDescriptionTermID] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BusinessTypeCode]    Script Date: 24-sept.-18 14:21:17 ******/
CREATE CLUSTERED INDEX [IX_BusinessTypeCode] ON [domain].[BusinessTypes]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
