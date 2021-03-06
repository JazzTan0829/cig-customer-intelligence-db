USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_NoActivityDashboard_ActivePerDay]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_NoActivityDashboard_ActivePerDay]
GO
/****** Object:  View [publish].[VIEW_NoActivityDashboard_ActivePerDay]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_NoActivityDashboard_ActivePerDay]
WITH SCHEMABINDING
AS

SELECT 
	[AccountID] ,
	[Environment] ,
	[AccountCode] ,
	[EnviroAccount] ,
	[CalendarDate] ,
	[ActiveOrNot] ,
	[PageviewQuantity]
FROM [publish].[NoActivity_Dashboard]
/*WHERE 
	CalendarDate <= (
						SELECT LastUpdatedDateTime
						FROM config.Activities
						WHERE ActivityID = 1
					)
					*/
/*
CREATE UNIQUE CLUSTERED INDEX IX_AccountID_CalendarDate
ON publish.VIEW_NoActivityDashboard_ActivePerDay(AccountID, CalendarDate)
GO	
*/
GO
