USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_ContractLines]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_ContractLines]
GO
/****** Object:  Table [raw].[HOST_CIG_ContractLines]    Script Date: 24-sept.-18 14:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_ContractLines](
	[ID] [uniqueidentifier] NOT NULL,
	[ContractID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ContractEvent] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FinalDate] [datetime] NULL,
	[CancellationDate] [datetime] NULL,
	[CancellationEvent] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[Unitcode] [nchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreated] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[Item] [uniqueidentifier] NULL,
	[ItemNumber] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LineDescription] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemPrice] [uniqueidentifier] NULL,
	[UnitFactor] [float] NULL,
	[Discount] [float] NULL,
	[EndDate] [datetime] NULL,
	[ProlongDayPart] [int] NULL,
	[UsageQuantity] [int] NULL,
	[ContractEventID] [uniqueidentifier] NULL,
	[CancellationEventID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
