USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_ItemRelationTypes]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_ItemRelationTypes]
GO
/****** Object:  Table [raw].[HOST_CIG_ItemRelationTypes]    Script Date: 24-sept.-18 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_ItemRelationTypes](
	[ID] [int] NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DescriptionTermID] [int] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
