USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_DivisionsLog]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_DivisionsLog]
GO
/****** Object:  StoredProcedure [domain].[Load_DivisionsLog]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[Load_DivisionsLog]
AS
TRUNCATE TABLE domain.DivisionsLog

Insert into domain.DivisionsLog ([DivisionCode], [Environment], [StartDate], [Archived], [Blocked], [Blocked&Deleted], [Deleted], [Ended], [YearMonthDeleted], [YearMonthBlocked], [YearMonthArchived], [YearMonthBlocked&Deleted], [YearMonthStarted], [YearMonthEnded])
Select 
	DL.DivisionCode, 
	DL.Environment, 
	DL.StartDate, 
	Archived, 
	Blocked, 
	[Blocked&Deleted], 
	DL.Deleted,
	DL.Ended
	,CASE WHEN (CONCAT(LEFT(CAST(DL.Deleted AS DATE),4), RIGHT(LEFT(CAST(DL.Deleted AS DATE),7),2)))='' THEN NULL ELSE (CONCAT(LEFT(CAST(DL.Deleted AS DATE),4), RIGHT(LEFT(CAST(DL.Deleted AS DATE),7),2))) END 
	,CASE WHEN (CONCAT(LEFT(CAST(DL.Blocked AS DATE),4), RIGHT(LEFT(CAST(DL.Blocked AS DATE),7),2)))='' THEN NULL ELSE  (CONCAT(LEFT(CAST(DL.Blocked AS DATE),4), RIGHT(LEFT(CAST(DL.Archived AS DATE),7),2)))END
	,CASE WHEN (CONCAT(LEFT(CAST(DL.Archived AS DATE),4), RIGHT(LEFT(CAST(DL.Archived AS DATE),7),2)))='' THEN NULL ELSE  (CONCAT(LEFT(CAST(DL.Archived AS DATE),4), RIGHT(LEFT(CAST(DL.Blocked AS DATE),7),2))) END
	,CASE WHEN (CONCAT(LEFT(CAST(DL.[Blocked&Deleted] AS DATE),4), RIGHT(LEFT(CAST(DL.[Blocked&Deleted] AS DATE),7),2)))='' THEN NULL ELSE (CONCAT(LEFT(CAST(DL.[Blocked&Deleted] AS DATE),4), RIGHT(LEFT(CAST(DL.[Blocked&Deleted] AS DATE),7),2))) END
    ,CASE WHEN (CONCAT(LEFT(CAST(DL.StartDate AS DATE),4), RIGHT(LEFT(CAST(DL.StartDate AS DATE),7),2)))='' THEN 'NULL' ELSE (CONCAT(LEFT(CAST(DL.StartDate AS DATE),4), RIGHT(LEFT(CAST(DL.StartDate AS DATE),7),2))) END
	,CASE WHEN (CONCAT(LEFT(CAST(DL.Ended AS DATE),4), RIGHT(LEFT(CAST(DL.Ended AS DATE),7),2)))='' THEN NULL ELSE (CONCAT(LEFT(CAST(DL.Ended AS DATE),4), RIGHT(LEFT(CAST(DL.Ended AS DATE),7),2))) END 

FROM domain.Divisions_Log_Pivot DL

GO
