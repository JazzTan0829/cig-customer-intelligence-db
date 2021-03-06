USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_ItemRelationRelations]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_ItemRelationRelations]
GO
/****** Object:  Table [raw].[HOST_CIG_ItemRelationRelations]    Script Date: 24-sept.-18 14:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_ItemRelationRelations](
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Relation] [uniqueidentifier] NOT NULL,
	[RelatedRelation] [uniqueidentifier] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[syscreator] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
