USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_UsageTransactions]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_UsageTransactions]
GO
/****** Object:  Table [raw].[HOST_CIG_UsageTransactions]    Script Date: 24-sept.-18 14:22:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_UsageTransactions](
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Account] [uniqueidentifier] NOT NULL,
	[Item] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[Amount] [float] NULL,
	[Invoice] [uniqueidentifier] NULL,
	[UsageEntitlement] [uniqueidentifier] NULL,
	[CostPrice] [float] NULL,
	[SalesPrice] [float] NULL,
	[SourceDivision] [int] NULL
) ON [PRIMARY]
GO
