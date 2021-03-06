USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[LeadSources]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[LeadSources]
GO
/****** Object:  Table [domain].[LeadSources]    Script Date: 24-sept.-18 14:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[LeadSources](
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[Active] [tinyint] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[Notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
