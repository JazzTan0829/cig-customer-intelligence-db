USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_ItemRelations]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_ItemRelations]
GO
/****** Object:  Table [raw].[HOST_CIG_ItemRelations]    Script Date: 24-sept.-18 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_ItemRelations](
	[ID] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[Item] [uniqueidentifier] NOT NULL,
	[ItemRelated] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[MaxQuantity] [float] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[Division] [int] NULL
) ON [PRIMARY]
GO
