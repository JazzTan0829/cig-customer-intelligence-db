USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Loop_ActivityLogActivityID]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Loop_ActivityLogActivityID]
GO
/****** Object:  StoredProcedure [domain].[Loop_ActivityLogActivityID]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink	
-- Create date: 2017-02-20
-- Description:	Loop_ActivitiesActivityID procedure for the ActivityDaily and Monthly execution
-- =============================================
CREATE PROCEDURE [domain].[Loop_ActivityLogActivityID]
AS
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ActivityDaily', 'Start')

DECLARE @i INT = 1
--DECLARE @iTotal INT = 435

DECLARE @iTotal INT = (SELECT Max(Sequence) FROM config.Activities)

WHILE @i <= @iTotal 

BEGIN

DECLARE @LastUpdatedDateTime Date = (Select LastUpdatedDateTime FROM config.Activities WHERE @i=Sequence)
DECLARE @LastUpdatedMonth Date = (Select LastUpdatedMonth FROM config.Activities WHERE @i=Sequence)
DECLARE @ActivityID INT = (Select ActivityID FROM config.Activities WHERE @i=Sequence)
DECLARE @ActivitySource varchar(100) = (Select ActivitySource FROM config.Activities WHERE @i=Sequence)
DECLARE @ActivityField varchar(100) = (Select ActivityField FROM config.Activities WHERE @i=Sequence)
DECLARE @ActivityDetail varchar(100) = (Select ActivityDetail FROM config.Activities WHERE @i=Sequence)
DECLARE @ActivityAction varchar(100) = (Select ActivityAction FROM config.Activities WHERE @i=Sequence)
DECLARE @LogText varchar(1000) = (Select LogText FROM config.Activities WHERE @i=Sequence)

	IF	
			(Select (DATEADD(d,-1, CONVERT(Date,StartDate))) FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported]) 
			> 
			Cast(ISNULL(Cast(@LastUpdatedDateTime as datetime), Cast('2015-10-01' as Date))AS Date)
		
	BEGIN
		EXEC domain.Loop_ActivityLogDailyDate @ActivityID, @ActivitySource, @ActivityField, @ActivityDetail, @ActivityAction, @LogText
	END

	IF 	
			(Select Cast(dateadd(dd,-(day((Select Cast(StartDate AS DATE) FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported]))-1),(Select StartDate FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported])) As Date)) 
			>
			Cast(ISNULL(Cast(DATEADD(MM,1,@LastUpdatedMonth)as date), Cast('2015-10-01' as Date))AS Date)
		
	BEGIN
		EXEC domain.Loop_ActivityLogMonthlyDate @ActivityID, @ActivitySource, @ActivityField, @ActivityDetail, @ActivityAction
	END

SET @i+=1	
END

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ActivityDaily', 'End')
GO
