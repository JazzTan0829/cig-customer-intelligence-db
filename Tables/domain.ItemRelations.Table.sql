USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[ItemRelations]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ItemRelations]
GO
/****** Object:  Table [domain].[ItemRelations]    Script Date: 24-sept.-18 14:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ItemRelations](
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
