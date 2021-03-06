USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Loop_ActivityLogMonthlyDate]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Loop_ActivityLogMonthlyDate]
GO
/****** Object:  StoredProcedure [domain].[Loop_ActivityLogMonthlyDate]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-02-20
-- Description:	Loop for getting the right month to run the load procedure to fill the ActivityMonthly table
-- =============================================
CREATE PROCEDURE  [domain].[Loop_ActivityLogMonthlyDate] (@ActivityID INT, @ActivitySource NVARCHAR(MAX), @ActivityField NVARCHAR(MAX), @ActivityDetail NVARCHAR(MAX), @ActivityAction INT ) AS
DECLARE 
	@EndMonth date,
	@StartMonth date

SET @StartMonth = Cast((SELECT ISNULL (Cast(DATEADD(MM,1,LastUpdatedMonth)as datetime), Cast('2015-10-01' as Date)) FROM config.Activities WHERE ActivityID = @ActivityID)as date)
SET @EndMonth = (Select Cast(dateadd(dd,-(day((Select Cast(StartDate AS DATE) FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported]))-1),(Select StartDate FROM [CustomerIntelligence].[config].[EOLActivityLog_LastTimeWindowImported])) As Date)) 

WHILE @StartMonth < @EndMonth
BEGIN
   -- Executes the Load_AccountsContract_PerMonth procedure. This is executed as long as the previous fetch succeeds.
   IF ((@ActivityID BETWEEN '1' AND '3') OR (@ActivityID BETWEEN '8' AND '10') OR (@ActivityID BETWEEN '5000' AND '60000000') OR (@ActivityID BETWEEN '13' AND '15')) AND  @ActivityID NOT BETWEEN '800000' AND'835313'
   BEGIN
   EXEC domain.Load_ActivityMonthly_ActivityLog @StartMonth, @ActivityID, @ActivitySource, @ActivityField, @ActivityDetail		--@EndDate is the output variable used for InputEndDate in the Load_AccountsContract_PerMonth procedure
   UPDATE config.Activities SET LastUpdatedMonth = @StartMonth Where ActivityID=@ActivityID 
   END

   SET @StartMonth = DATEADD(month, 1, @StartMonth);
   
 
END
GO
