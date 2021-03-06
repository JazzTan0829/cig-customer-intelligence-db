USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Contracts]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Contracts]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Contracts]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================================================================================================
-- Author:		Alex Green (based on original code by Ronald Dahne)
-- Create date: 24-11-2015
-- Description:	Creates the Contracts table - this shows the changes to contracts over time
--				16/10/2017 - removed EventID column as this is not available as part of Corporate BI Data Warehouse verison of ContractStatistics
-- ==========================================================================================================================================================

CREATE PROC [domain].[CreateTable_Contracts] as


IF OBJECT_ID (N'Contracts', N'U') IS NOT NULL 
DROP TABLE Contracts

CREATE TABLE [domain].[Contracts]
(
	[Environment] [nchar](3) NOT NULL,
	[AccountCode] [nvarchar](18) NULL,
	[ContractNumber] [nvarchar](30) NULL,
	[ContractType] [nchar](1) NULL,
	[StartDate] [date],
	[EndDate] [date],
	[FinalDate] [date],
	[EventDate] [date],
	[InflowOutflow] [nvarchar](10) NULL,
	[ContractEventTypeCode] [nvarchar](30) NULL,
	[ItemCode] [nvarchar](30) NULL,
	[PackageCode] [nvarchar](30) NULL,
	[LinePackage] [tinyint] NULL,
	[Quantity] [int] NULL,
	[NumberOfAdministrations] [int] NULL,
	[NumberOfUsers] [int] NULL,
	[ContractLineValue] [float] NULL,
	[ValuePerMonth] [float] NULL,
	[ValuePerYear] [float] NULL,
	[ContractLineValueDC] [float] NULL,
	[ValuePerMonthDC] [float] NULL,
	[ValuePerYearDC] [float] NULL,
	[ExchangeRate] [float] NULL,
	[ItemBasePricePerMonth] [float] NULL,
	[ItemBasePricePeryear] [float] NULL
)

CREATE CLUSTERED INDEX EventDate ON Contracts (EventDate)
CREATE INDEX Account ON Contracts (AccountCode)
CREATE INDEX Items ON Contracts (ItemCode)
CREATE INDEX StartDateFinalDate ON Contracts (StartDate, FinalDate)
GO
