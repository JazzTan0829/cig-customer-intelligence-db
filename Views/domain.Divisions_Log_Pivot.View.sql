USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Divisions_Log_Pivot]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Divisions_Log_Pivot]
GO
/****** Object:  View [domain].[Divisions_Log_Pivot]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [domain].[Divisions_Log_Pivot] AS
Select *
FROM domain.Divisions_Log
PIVOT
(
	Min(EventDate)
	FOR Event IN (StartDate , Archived, Blocked, [Blocked&Deleted], Deleted, Ended)
) AS pvt



GO
