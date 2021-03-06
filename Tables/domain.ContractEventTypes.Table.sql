USE [CustomerIntelligence]
GO
/****** Object:  Index [ContractEventTypeCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [ContractEventTypeCode] ON [domain].[ContractEventTypes] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[ContractEventTypes]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[ContractEventTypes]
GO
/****** Object:  Table [domain].[ContractEventTypes]    Script Date: 24-sept.-18 14:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[ContractEventTypes](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ContractEventTypeCode] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContractEventDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ContractEventTypeCode]    Script Date: 24-sept.-18 14:21:22 ******/
CREATE CLUSTERED INDEX [ContractEventTypeCode] ON [domain].[ContractEventTypes]
(
	[Environment] ASC,
	[ContractEventTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
