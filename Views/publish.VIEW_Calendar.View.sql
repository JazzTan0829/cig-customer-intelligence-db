USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_Calendar]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_Calendar]
GO
/****** Object:  View [publish].[VIEW_Calendar]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [publish].[VIEW_Calendar] AS
Select * From config.Calendar
GO
