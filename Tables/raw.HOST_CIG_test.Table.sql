USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_test]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_test]
GO
/****** Object:  Table [raw].[HOST_CIG_test]    Script Date: 24-sept.-18 14:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_test](
	[EOLTable] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CIGTable] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TSColumn] [tinyint] NULL,
	[CIGQuery] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
