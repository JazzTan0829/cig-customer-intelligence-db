USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_DivisionTypes]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_DivisionTypes]
GO
/****** Object:  Table [raw].[HOST_CIG_DivisionTypes]    Script Date: 24-sept.-18 14:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_DivisionTypes](
	[ID] [uniqueidentifier] NULL,
	[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DescriptionTermId] [int] NULL,
	[Item] [uniqueidentifier] NULL,
	[Modules] [bigint] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
