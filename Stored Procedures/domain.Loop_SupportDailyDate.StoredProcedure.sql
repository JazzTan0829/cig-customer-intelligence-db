USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Loop_SupportDailyDate]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Loop_SupportDailyDate]
GO
/****** Object:  StoredProcedure [domain].[Loop_SupportDailyDate]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================================================================
-- Author:		Jennifer Vink
-- Create date: 2-12-2015
-- Description: This loop executes the procedure Load_ActivityDaily for every day. 
--				Also the variables out of the Loop_ActivityDailyActivityID are used in the Load_ActivityDaily procedure
-- ===========================================================================================================================

CREATE PROC [domain].[Loop_SupportDailyDate] (@ActivityID INT, @ActivitySource NVARCHAR(MAX), @ActivityField NVARCHAR(MAX), @ActivityDetail NVARCHAR(MAX), @ActivityAction INT, @LogText NVARCHAR(MAX)) AS

DECLARE @StartDate Datetime
DECLARE @EndDate datetime

--StartDate is the lastUpdatedDatetime for that ActivityID
SET @StartDate = (SELECT ISNULL (cast(DATEADD(dd,1,LastUpdatedDateTime) as Datetime), FirstDate) FROM config.Activities WHERE ActivityID = @ActivityID)

--The EndDate is the max(logdatetime) minus 1 day from the raw ActivityLog
SET @EndDate = (Select (DATEADD(d,-1, CONVERT(Date,max([Opened Date])))) FROM [CustomerIntelligence].[domain].[SupportCases_Salesforce])



WHILE @StartDate <= @EndDate

BEGIN
	IF  @ActivityID='4' OR (@ActivityID BETWEEN '5' AND '7') OR (@ActivityID BETWEEN '1001' AND '1007') OR @ActivityID='12'
	BEGIN
	EXEC [domain].[Load_ActivityDaily_SupportCases] @StartDate, @ActivityID, @ActivitySource, @ActivityField, @ActivityDetail 
		UPDATE [config].[Activities] SET LastUpdatedDateTime = @StartDate Where ActivityID=@ActivityID 
	END

   SET @StartDate = @StartDate + 1;
END
GO
