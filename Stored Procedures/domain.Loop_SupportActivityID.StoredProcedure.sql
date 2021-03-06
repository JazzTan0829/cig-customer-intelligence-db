USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Loop_SupportActivityID]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Loop_SupportActivityID]
GO
/****** Object:  StoredProcedure [domain].[Loop_SupportActivityID]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================================================================================
-- Author:		Jennifer Vink
-- Create date: 2-12-2015
-- Description:	Loop ActivityID. This loop runs the procedure Loop_SupportCasesDailyDate and Loop_SupportCasesMonthlyDate for every Activity in the Activities table.
-- =================================================================================================================================
CREATE PROC [domain].[Loop_SupportActivityID] AS
BEGIN
INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ActivityDaily_SupportCases', 'Start')

DECLARE @i INT = 1
DECLARE @iTotal INT = (SELECT Max(Sequence) FROM config.Activities WHERE ActivityID='12')

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

--Insert ActivityDaily
	IF	
			(Select (DATEADD(d,-1, CONVERT(Date,max([Opened Date])))) FROM [CustomerIntelligence].[domain].[SupportCases_Salesforce]) 
			> 
			Cast(ISNULL(Cast(@LastUpdatedDateTime as datetime), Cast('2015-10-01' as Date))AS Date)
			AND (@ActivityID='4' OR (@ActivityID BETWEEN '5' AND '7') OR (@ActivityID BETWEEN '1001' AND '1007') OR @ActivityID='12')
		
	BEGIN
		EXEC domain.Loop_SupportDailyDate @ActivityID, @ActivitySource, @ActivityField, @ActivityDetail, @ActivityAction, @LogText
	END

--Insert ActivityMonthly
	IF 	
			(Select Cast(dateadd(dd,-(day((Select Cast(max([Opened Date]) AS DATE) FROM [CustomerIntelligence].[domain].[SupportCases_Salesforce]))-1),(Select StartDate FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported])) As Date)) 
			>
			Cast(ISNULL(Cast(DATEADD(MM,1,@LastUpdatedMonth)as date), Cast('2015-10-01' as Date))AS Date)
			AND (@ActivityID='4' OR (@ActivityID BETWEEN '5' AND '7') OR (@ActivityID BETWEEN '1001' AND '1007') OR @ActivityID='12')
			
	BEGIN
		EXEC domain.Loop_SupportMonthlyDate @ActivityID, @ActivitySource, @ActivityField, @ActivityDetail, @ActivityAction
	END

SET @i+=1	
END

INSERT INTO config.JobLog (StartEndTime, Job, Action) VALUES (GETDATE(), 'ActivityDaily_SupportCases', 'End')
END
GO
