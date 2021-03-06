USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_ExchangeRates]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_ExchangeRates]
GO
/****** Object:  Table [raw].[HOST_CIG_ExchangeRates]    Script Date: 24-sept.-18 14:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_ExchangeRates](
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[SourceCurrency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TargetCurrency] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NULL,
	[Rate] [float] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
