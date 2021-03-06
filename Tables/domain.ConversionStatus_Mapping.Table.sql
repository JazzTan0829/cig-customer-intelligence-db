USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[ConversionStatus_Mapping]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ConversionStatus_Mapping]
GO
/****** Object:  Table [domain].[ConversionStatus_Mapping]    Script Date: 24-sept.-18 14:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ConversionStatus_Mapping](
	[ConversionStatusCode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ConversionStatusDescription] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
