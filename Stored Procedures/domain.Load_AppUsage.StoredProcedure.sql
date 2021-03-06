USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_AppUsage]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_AppUsage]
GO
/****** Object:  StoredProcedure [domain].[Load_AppUsage]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2016-10-04
-- Description:	Load App usage information into AppUsage table
-- =============================================
CREATE PROCEDURE [domain].[Load_AppUsage] 
AS
BEGIN

TRUNCATE TABLE [CustomerIntelligence].[domain].[AppUsage] 

INSERT INTO [CustomerIntelligence].[domain].[AppUsage] (Environment, App, AppUsageFreeReason, IsFreeConnection, Month, Year, AccountID, AccountCode, DivisionID)
SELECT Environment
		, App AS AppID
		, AppUsageFreeReason
		, IsFreeConnection
		, UsageMonth AS Month
		, UsageYear AS Year
		, UsedByCustomer AS AccountID
		, UsedByCustomerCode AS AccountCode
		, UsedDivision AS DivisionID
  FROM raw.DW_MonthlyAppUsage
END
GO
