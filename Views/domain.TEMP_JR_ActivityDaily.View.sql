USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[TEMP_JR_ActivityDaily]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[TEMP_JR_ActivityDaily]
GO
/****** Object:  View [domain].[TEMP_JR_ActivityDaily]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [domain].[TEMP_JR_ActivityDaily] AS
Select Environment, AccountID, AccountCode, ActivityID, Date, SUM(Quantity) AS Quantity
From domain.ActivityDaily
WHERE ActivityID IN ('1', '8', '4')
AND Date > GETDATE()-92
GROUP BY Environment, AccountID, AccountCode, ActivityID, Date
GO
