USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_Timestamps]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_Timestamps]
GO
/****** Object:  Table [raw].[HOST_CIG_Timestamps]    Script Date: 24-sept.-18 14:22:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_Timestamps](
	[TableName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastTimestamp] [varbinary](8) NULL,
	[LastModified] [datetime] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
