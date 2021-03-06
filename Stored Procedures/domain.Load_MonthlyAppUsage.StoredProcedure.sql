USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_MonthlyAppUsage]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_MonthlyAppUsage]
GO
/****** Object:  StoredProcedure [domain].[Load_MonthlyAppUsage]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Author:		Alex Green
-- Create date: 13-10-2017
-- Description: Loads the MonthlyAppUsage table from Corporate BI DW 
-- ==========================================================================================
CREATE PROCEDURE [domain].[Load_MonthlyAppUsage]
AS
BEGIN

TRUNCATE TABLE domain.MonthlyAppUsage

INSERT INTO domain.MonthlyAppUsage
(
	[ID] ,
	[Environment] ,
	[AppUsageFreeReason] , 
	[App] ,
	[AppName] ,
	[EntryID] ,
	[FirstAppUsageDate] ,
	[IsFreeConnection] ,
	[Partner] ,
	[PartnerCode] ,
	[PartnerName] ,
	[UsageMonth] ,
	[UsageYear] ,
	[UsedByCustomer] ,
	[UsedByCustomerCode] ,
	[UsedByCustomerName] ,
	[UsedDivision] ,
	[UsedDivisionName] 
)

SELECT 
	[ID] ,
	CASE [ENVIRONMENT]
			WHEN 'GB'
			THEN 'UK'
			ELSE [ENVIRONMENT]
			END AS Environment,
	[AppUsageFreeReason] , 
	[App] ,
	[AppName] ,
	[EntryID] ,
	[FirstAppUsageDate] ,
	[IsFreeConnection] ,
	[Partner] ,
	[PartnerCode] ,
	[PartnerName] ,
	[UsageMonth] ,
	[UsageYear] ,
	[UsedByCustomer] ,
	[UsedByCustomerCode] ,
	[UsedByCustomerName] ,
	[UsedDivision] ,
	[UsedDivisionName] 

FROM [raw].[DW_MonthlyAppUsage]
WHERE 
	META_LOAD_ENDDTS IS NULL   -- If field is NULL then this means it is an old record
	AND META_ISDELETED = 0	   -- If equal to 1 then this row is one that should be deleted

END
GO
