USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Loop_SupportMonthlyDate]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Loop_SupportMonthlyDate]
GO
/****** Object:  StoredProcedure [domain].[Loop_SupportMonthlyDate]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer		
-- Create date: 27-01-2016
-- Description:	This loop executes the procedure Load_ActivityMonthly for every Month
--				Also the variables out of the Loop_ActivityDailyActivityID are used by the Load_ActivityDaily procedure
-- =============================================
CREATE PROCEDURE [domain].[Loop_SupportMonthlyDate] (@ActivityID INT, @ActivitySource NVARCHAR(MAX), @ActivityField NVARCHAR(MAX), @ActivityDetail NVARCHAR(MAX), @ActivityAction INT )
AS
DECLARE 
	@EndMonth date,
	@StartMonth date

SET @StartMonth = Cast((SELECT ISNULL (Cast(DATEADD(MM,1,LastUpdatedMonth)as datetime), Cast('2015-10-01' as Date)) FROM config.Activities WHERE ActivityID = @ActivityID) as date)
SET @EndMonth = (SELECT Cast(dateadd(dd,-(day((Select Cast(max([Opened Date]) AS DATE) FROM [CustomerIntelligence].[domain].[SupportCases_Salesforce]))-1),(Select Cast(max([Opened Date]) AS DATE) FROM [CustomerIntelligence].[domain].[SupportCases_Salesforce])) As Date))  

WHILE @StartMonth < @EndMonth
BEGIN

	IF  (@ActivityID='4' OR (@ActivityID BETWEEN '5' AND '7') OR (@ActivityID BETWEEN '1001' AND '1007') OR @ActivityID='12' ) AND @StartMonth < @EndMonth
	BEGIN
	EXEC domain.Load_ActivityMonthly_SupportCases @StartMonth, @ActivityID, @ActivitySource, @ActivityField, @ActivityDetail	
	UPDATE config.Activities SET LastUpdatedMonth = @StartMonth Where ActivityID=@ActivityID 
	END

SET @StartMonth = DATEADD(month, 1, @StartMonth);
   
 
END
GO
