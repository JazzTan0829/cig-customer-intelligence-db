USE [CustomerIntelligence]
GO
/****** Object:  Index [IX_ID_CIGCopyTime]    Script Date: 24-sept.-18 14:20:57 ******/
DROP INDEX IF EXISTS [IX_ID_CIGCopyTime] ON [raw].[HOST_CIG_UsageEntitlements] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [raw].[HOST_CIG_UsageEntitlements]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_UsageEntitlements]
GO
/****** Object:  Table [raw].[HOST_CIG_UsageEntitlements]    Script Date: 24-sept.-18 14:22:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_UsageEntitlements](
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Account] [uniqueidentifier] NOT NULL,
	[Item] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[OriginalQuantity] [int] NOT NULL,
	[UnitPrice] [float] NULL,
	[ActualQuantity] [int] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_ID_CIGCopyTime]    Script Date: 24-sept.-18 14:22:17 ******/
CREATE CLUSTERED INDEX [IX_ID_CIGCopyTime] ON [raw].[HOST_CIG_UsageEntitlements]
(
	[ID] ASC,
	[CIGCopyTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
