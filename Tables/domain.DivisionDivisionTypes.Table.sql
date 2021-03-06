USE [CustomerIntelligence]
GO
/****** Object:  Index [CIX_DivisionDivisionTypes_Environment_DivisionCode]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [CIX_DivisionDivisionTypes_Environment_DivisionCode] ON [domain].[DivisionDivisionTypes] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[DivisionDivisionTypes]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[DivisionDivisionTypes]
GO
/****** Object:  Table [domain].[DivisionDivisionTypes]    Script Date: 24-sept.-18 14:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[DivisionDivisionTypes](
	[ID] [uniqueidentifier] NOT NULL,
	[DivisionCode] [int] NOT NULL,
	[DivisionType] [uniqueidentifier] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[InvoiceAccount] [uniqueidentifier] NULL,
	[InvoicedUntil] [date] NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CIX_DivisionDivisionTypes_Environment_DivisionCode]    Script Date: 24-sept.-18 14:21:24 ******/
CREATE CLUSTERED INDEX [CIX_DivisionDivisionTypes_Environment_DivisionCode] ON [domain].[DivisionDivisionTypes]
(
	[Environment] ASC,
	[DivisionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
