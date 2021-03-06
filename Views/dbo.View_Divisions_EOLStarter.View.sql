USE [CustomerIntelligence]
GO
/****** Object:  View [dbo].[View_Divisions_EOLStarter]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [dbo].[View_Divisions_EOLStarter]
GO
/****** Object:  View [dbo].[View_Divisions_EOLStarter]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[View_Divisions_EOLStarter] AS

Select Distinct ID AS UserID, UT.UserTypeCode, UT.UserTypeDescription
FROM raw.HOST_CIG_Users US

LEFT JOIN domain.UserUserTypes UUT
ON US.ID=UUT.UserID

LEFT JOIN domain.UserTypes UT
ON UUT.UserTypeID=UT.UserTypeID

WHERE UT.UserTypeCode IN ('Client', 'ClientADC', 'Starter')
AND US.Environment='NL'
AND US.EndDate IS NULL

Group by US.ID, UT.UserTypeCode, UT.UserTypeDescription
GO
