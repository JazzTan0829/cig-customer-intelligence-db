USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_AppUsageLines]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_AppUsageLines]
GO
/****** Object:  StoredProcedure [domain].[Load_AppUsageLines]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-03-02
-- Description:	Load App Usage Lines table
-- =============================================
CREATE PROCEDURE [domain].[Load_AppUsageLines] 
AS
BEGIN

TRUNCATE TABLE [CustomerIntelligence].[domain].[AppUsageLines] 

INSERT INTO [CustomerIntelligence].[domain].[AppUsageLines] ([ID], [OAuthClient], [UsedOnDate], [UsedDivision], [syscreated], [syscreator], [sysmodified], [sysmodifier], [UserID], [CIGCopyTime], [Environment], [CIGProcessed])
SELECT 		ID
		, OAuthClient
		, UsedOnDate
		, UsedDivision
		, [syscreated]
		, [syscreator]
		, [sysmodified]
		, [sysmodifier]
	    , [UserID]
		, [CIGCopyTime]
		, [Environment]
		, [CIGProcessed]
FROM (
SELECT 
		ID
		, OAuthClient
		, UsedOnDate
		, UsedDivision
		, [syscreated]
		, [syscreator]
		, [sysmodified]
		, [sysmodifier]
	    , [UserID]
		, [CIGCopyTime]
		, [Environment]
		, [CIGProcessed]
		, ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CIGCopyTime desc) AS RowNumber
  FROM raw.HOST_CIG_AppUsageLines) SUB
WHERE SUB.RowNumber='1'
END
GO
