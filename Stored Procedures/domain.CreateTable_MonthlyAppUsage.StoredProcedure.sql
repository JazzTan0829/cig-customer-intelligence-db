USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_MonthlyAppUsage]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_MonthlyAppUsage]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_MonthlyAppUsage]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_MonthlyAppUsage]
AS
BEGIN
-- ==================================================================================================================
-- Author:		Alex Green
-- Create date: 13-10-2017
-- Description: Produces a domain table of the MonthlyAppUsage table taken from the Corporate BI Data Warehouse
-- ==================================================================================================================

IF OBJECT_ID (N'CustomerIntelligence.domain.MonthlyAppUsage', N'U') IS NOT NULL 
DROP TABLE domain.MonthlyAppUsage

CREATE TABLE domain.MonthlyAppUsage
(
	[ID] [uniqueidentifier] NOT NULL,
	[Environment] [varchar](30) NULL,
	[AppUsageFreeReason] [nvarchar](100) NULL,
	[App] [nvarchar](100) NULL,
	[AppName] [nvarchar](100) NULL,
	[EntryID] [nvarchar](100) NULL,
	[FirstAppUsageDate] [date] NULL,
	[IsFreeConnection] [int] NULL,
	[Partner] [nvarchar](100) NULL,
	[PartnerCode] [nvarchar](100) NULL,
	[PartnerName] [nvarchar](100) NULL,
	[UsageMonth] [nvarchar](50) NULL,
	[UsageYear] [nvarchar](50) NULL,
	[UsedByCustomer] [nvarchar](100) NULL,
	[UsedByCustomerCode] [nvarchar](100) NULL,
	[UsedByCustomerName] [nvarchar](100) NULL,
	[UsedDivision] [nvarchar](100) NULL,
	[UsedDivisionName] [nvarchar](100) NULL,
) 
END
GO
