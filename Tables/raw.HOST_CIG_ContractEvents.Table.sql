USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_EventID]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_EventID] ON [raw].[HOST_CIG_ContractEvents] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_ContractEvents]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_ContractEvents]
GO
/****** Object:  Table [raw].[HOST_CIG_ContractEvents]    Script Date: 24-sept.-18 14:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_ContractEvents](
	[ID] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermId] [int] NULL,
	[CreationType] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventID]    Script Date: 24-sept.-18 14:22:05 ******/
CREATE CLUSTERED INDEX [IX_EventID] ON [raw].[HOST_CIG_ContractEvents]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
