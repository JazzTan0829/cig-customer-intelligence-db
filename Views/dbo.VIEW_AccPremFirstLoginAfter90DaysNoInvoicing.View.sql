USE [CustomerIntelligence]
GO
/****** Object:  View [dbo].[VIEW_AccPremFirstLoginAfter90DaysNoInvoicing]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [dbo].[VIEW_AccPremFirstLoginAfter90DaysNoInvoicing]
GO
/****** Object:  View [dbo].[VIEW_AccPremFirstLoginAfter90DaysNoInvoicing]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[VIEW_AccPremFirstLoginAfter90DaysNoInvoicing] AS
SELECT *
FROM
(
	Select 
	AD.Environment, 
	AD.Date, 
	AD.AccountCode,
	DateAdd(D,90,ACS.LatestCommStartDate) AS LatestCommStartDatePlus,
	DATEDIFF("D",DateAdd(D,90,ACS.LatestCommStartDate),AD.Date) AS DateDifference,
	ROW_NUMBER ( )   
		OVER (Partition by AD.AccountCode, AD.Environment Order by DATEDIFF("D",ACS.LatestCommStartDate,AD.Date)) AS RowNumber

	From domain.ActivityDaily AD

	JOIN domain.AccountsContract_Summary ACS
	ON AD.AccountCode=ACS.AccountCode AND AD.Environment=ACS.Environment


	Where ActivityID='1'
	AND LatestCommPackage='EOLPREMIUM'
	AND LatestCommStartDate<='2016-07-31'
	AND LatestCommStartDate>='2015-11-01'
	AND Churned='0'
	AND DATEDIFF("D",DateAdd(D,90,ACS.LatestCommStartDate),AD.Date)>0

	GROUP BY AD.Environment, AD.AccountCode, Date, ACS.LatestCommStartDate

) SUB
WHERE SUB.RowNumber=1

--Order by SUB.Environment, SUB.AccountCode, Date

GO
