USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[AspxProductEdition]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[AspxProductEdition]
GO
/****** Object:  Table [config].[AspxProductEdition]    Script Date: 24-sept.-18 14:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[AspxProductEdition](
	[ActivityID] [bigint] NOT NULL,
	[Aspx] [nvarchar](90) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Product] [nvarchar](90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Edition] [nvarchar](90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
