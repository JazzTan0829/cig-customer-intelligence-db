USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivityMonthly_ActivityLog]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ActivityMonthly_ActivityLog]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivityMonthly_ActivityLog]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 26/01/2016
-- Description:	Load Activity Monthly summary based on the Activity Daily table and MonthlyAppUsage2
-- =============================================
CREATE PROCEDURE [domain].[Load_ActivityMonthly_ActivityLog] (@StartDate date, @ActivityID INT, @ActivitySource NVARCHAR(MAX), @ActivityField NVARCHAR(MAX), @ActivityDetail NVARCHAR(MAX))
AS

DECLARE @Year int
DECLARE @Month int

SET @Year = Datepart(yyyy,@StartDate)
SET @Month = Datepart(mm,@StartDate) 

--Count manual pageviews
IF @ActivityID='1'
BEGIN
INSERT INTO domain.ActivityMonthly (Environment, Year, Month, AccountID, AccountCode, UserID, DivisionCode, ActivityID, Quantity, AverageDuration, YearMonth) 
SELECT Environment, @Year, @Month, AccountID, AccountCode, UserID, DivisionCode, @ActivityID, Sum(Quantity) as Quantity, ROUND(AVG(AverageDuration),0) As AverageDuration, Concat(@Year, RIGHT(100+@Month,2)) as YearMonth
FROM [domain].[ActivityDaily]
WHERE ActivityID='1' AND @Year= Datepart(yyyy,Date) AND @Month=Datepart(mm,Date)
GROUP BY Environment, Datepart(yyyy,Date), Datepart(mm,Date), AccountID, AccountCode, DivisionCode, UserID
END

--Count unique users
IF @ActivityID='2'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year, Month, AccountID, AccountCode, ActivityID, Quantity, YearMonth) 
SELECT Environment, @Year, @Month, AccountID, AccountCode, @ActivityID, COUNT(Distinct UserID) AS Quantity,Concat(@Year, RIGHT(100+@Month,2)) as YearMonth
FROM [domain].[ActivityDaily]
WHERE ActivityID='1' AND @Year= Datepart(yyyy,Date) AND @Month=Datepart(mm,Date) 
GROUP BY Environment, Datepart(yyyy,Date), Datepart(mm,Date), AccountID, AccountCode
END

--Count unique administrations
IF @ActivityID='3'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year, Month, AccountCode, ActivityID, Quantity, YearMonth) 
SELECT Environment, @Year, @Month, AccountCode, @ActivityID, COUNT(Distinct DivisionCode) AS Quantity, Concat(@Year, RIGHT(100+@Month,2)) as YearMonth
FROM [domain].[ActivityDaily]
WHERE ActivityID='1' AND @Year= Datepart(yyyy,Date) AND @Month=Datepart(mm,Date) 
GROUP BY Environment, Datepart(yyyy,Date), Datepart(mm,Date), AccountID, AccountCode
END

--Count specific ActivityLog per administrationID and userID
IF @ActivityID>='5000' AND @ActivityID<'59999999'
BEGIN
INSERT INTO domain.ActivityMonthly (Environment, Year, Month, AccountID, AccountCode, UserID, DivisionCode, ActivityID, Quantity, AverageDuration, YearMonth) 
SELECT Environment, @Year, @Month, AccountID, AccountCode, UserID, DivisionCode, ActivityID,  SUM(Quantity), ROUND(AVG(AverageDuration),0) As AverageDuration, Concat(@Year, RIGHT(100+@Month,2)) as YearMonth
FROM [domain].[ActivityDaily]
WHERE @Year= Datepart(yyyy,Date) AND @Month=Datepart(mm,Date) AND ActivityID=@ActivityID AND (ActivityID>='5000' AND ActivityID<'59999999') 
GROUP BY Environment, Datepart(yyyy,Date), Datepart(mm,Date), AccountID, AccountCode, DivisionCode, UserID, ActivityID
End

---CALCULATING FROM ACTIVITYLOG
--Count unique mobile users
IF @ActivityID='8'
BEGIN
INSERT INTO [domain].[ActivityMonthly](Environment, Year, Month, AccountCode, ActivityID, Quantity, YearMonth) 
SELECT Environment, @Year, @Month, AccountCode, @ActivityID, COUNT(Distinct UserID) AS Quantity, Concat(@Year, RIGHT(100+@Month,2)) as YearMonth
FROM [raw].[EOLActivityLog]
WHERE App='restapi/apps/internal/smartphonemenu' AND @Year= Datepart(yyyy,LogDateTime) AND @Month=Datepart(mm,LogDateTime) AND @ActivityID='8'
GROUP BY Environment, Datepart(yyyy,LogDateTime), Datepart(mm,LogDateTime), AccountCode
END

--Count unique mobile administrations
IF @ActivityID='9'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year, Month, AccountID, AccountCode, ActivityID, Quantity, YearMonth) 
SELECT Environment, @Year, @Month, AccountID, AccountCode, @ActivityID, COUNT(Distinct LogDateTime) AS Quantity, Concat(@Year, RIGHT(100+@Month,2)) as YearMonth
FROM [raw].[EOLActivityLog]
WHERE App='restapi/apps/internal/smartphonemenu' AND @Year= Datepart(yyyy,LogDateTime) AND @Month=Datepart(mm,LogDateTime)
GROUP BY Environment, Datepart(yyyy,LogDateTime), Datepart(mm,LogDateTime), AccountID, AccountCode
END

--Count number of used apps
IF @ActivityID='10'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year, Month, AccountCode, DivisionCode, ActivityID, Quantity, YearMonth)
SELECT 
		CASE Environment
			WHEN 'GB' 
			THEN 'UK' 
			ELSE Environment END AS Environment
		, @Year
		, @Month
		, UsedByCustomerCode AS AccountCode
		, UsedDivision
		, @ActivityID
		, COUNT (DISTINCT(App)) AS Quantity
		, Concat(@Year, RIGHT(100+@Month,2)) as YearMonth
FROM domain.MonthlyAppUsage
WHERE @Year= UsageYear AND @Month=UsageMonth
GROUP BY Environment, UsedByCustomerCode, UsedDivision, UsageYear, UsageMonth
END

--Count number of active days per month
IF @ActivityID='13'
BEGIN
INSERT INTO domain.ActivityMonthly(Environment, Year, Month, AccountID, AccountCode, ActivityID, Quantity, YearMonth)
SELECT Environment, @Year, @Month, AccountID, AccountCode, @ActivityID, Count(Distinct Date), Concat(@Year, RIGHT(100+@Month,2)) as YearMonth
FROM [domain].[ActivityDaily]
WHERE month(Date)=12 AND year(Date)=2015 AND ActivityID='1' 
GROUP BY Environment, Datepart(yyyy,Date), Datepart(mm,Date), AccountID, AccountCode
END

--General Activitylog Total Unique Users (browser and mobile)
IF @ActivityID='14'
INSERT INTO [domain].[ActivityMonthly](Environment, Year, Month, AccountCode, ActivityID, Quantity, YearMonth,AccountID) 
SELECT Environment, @Year, @Month, AccountCode, @ActivityID, COUNT(Distinct UserID) AS Quantity, Concat(@Year, RIGHT(100+@Month,2)) as YearMonth, AccountID
FROM [raw].[EOLActivityLog]
WHERE @Year= Datepart(yyyy,LogDateTime) AND @Month=Datepart(mm,LogDateTime) AND @ActivityID='14' AND ((Type='0' AND App NOT Like'XML%' AND App<>'Clearsession.aspx') OR App='restapi/apps/internal/smartphonemenu')
GROUP BY Environment, Datepart(yyyy,LogDateTime), Datepart(mm,LogDateTime), AccountCode,AccountID

--General Activitylog Total Unique Users (browser and mobile)
IF @ActivityID='15'
INSERT INTO [domain].[ActivityMonthly](Environment, Year, Month, AccountCode, ActivityID, Quantity, YearMonth, AccountID) 
SELECT Environment, @Year, @Month, AccountCode, @ActivityID, COUNT(Distinct AdministrationCode) AS Quantity, Concat(@Year, RIGHT(100+@Month,2)) as YearMonth, AccountID
FROM [raw].[EOLActivityLog]
WHERE @Year= Datepart(yyyy,LogDateTime) AND @Month=Datepart(mm,LogDateTime) AND @ActivityID='15' AND ((Type='0' AND App NOT Like'XML%' AND App<>'Clearsession.aspx') OR App='restapi/apps/internal/smartphonemenu')
GROUP BY Environment, Datepart(yyyy,LogDateTime), Datepart(mm,LogDateTime), AccountCode, AccountID
GO
