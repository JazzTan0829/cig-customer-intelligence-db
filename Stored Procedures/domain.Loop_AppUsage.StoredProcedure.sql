USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Loop_AppUsage]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Loop_AppUsage]
GO
/****** Object:  StoredProcedure [domain].[Loop_AppUsage]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink	
-- Create date: 2018-07-10
-- Description:	Loop_AppUsage procedure for the ActivityMonthly execution for App Usage
-- =============================================
CREATE PROCEDURE [domain].[Loop_AppUsage]
AS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ActivityMonthly_Apps', 'Start')

DECLARE @i INT = (SELECT MIN(Sequence) FROM config.Activities_Apps WHERE LastUpdatedMonth<>'2018-07-01')
--DECLARE @iTotal INT = 435

DECLARE @iTotal INT = (SELECT Max(Sequence) FROM config.Activities_Apps)

WHILE @i <= @iTotal 

BEGIN

DECLARE @LastUpdatedMonth Date = (Select LastUpdatedMonth FROM config.Activities_Apps WHERE @i=Sequence)
DECLARE @AppID uniqueidentifier = (Select ApplicationID FROM config.Activities_Apps WHERE @i=Sequence)

	IF 	
			(Select Cast(dateadd(dd,-(day((Select Cast(StartDate AS DATE) FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported]))-1),(Select StartDate FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported])) As Date)) 
			>
			Cast(ISNULL(Cast(DATEADD(MM,1,@LastUpdatedMonth)as date), Cast('2015-10-01' as Date))AS Date)
		
	BEGIN
		EXEC domain.Loop_AppUsageMonthlyDate @LastUpdatedMonth, @AppID
	END

SET @i+=1	
END

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ActivityMonthly_Apps', 'End')
GO
