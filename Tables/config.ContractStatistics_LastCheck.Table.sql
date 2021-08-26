USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[ContractStatistics_LastCheck]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[ContractStatistics_LastCheck]
GO
/****** Object:  Table [config].[ContractStatistics_LastCheck]    Script Date: 24-sept.-18 14:21:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[ContractStatistics_LastCheck](
	[Environment] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Occurrences] [int] NULL,
	[LastCheck] [datetime] NULL
) ON [PRIMARY]
GO
