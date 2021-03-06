USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[ContractData_MonthlyAppUsage2]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[ContractData_MonthlyAppUsage2]
GO
/****** Object:  Table [raw].[ContractData_MonthlyAppUsage2]    Script Date: 24-sept.-18 14:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[ContractData_MonthlyAppUsage2](
	[ID] [uniqueidentifier] NOT NULL,
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppUsageFreeReason] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[App] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AppName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EntryID] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstAppUsageDate] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFreeConnection] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Partner] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartnerCode] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartnerName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsageMonth] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsageYear] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsedByCustomer] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsedByCustomerCode] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsedByCustomerName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsedDivision] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UsedDivisionName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MonthlyAppUsageID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
