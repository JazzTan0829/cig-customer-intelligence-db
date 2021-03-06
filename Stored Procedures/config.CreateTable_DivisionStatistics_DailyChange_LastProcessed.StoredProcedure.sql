USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[CreateTable_DivisionStatistics_DailyChange_LastProcessed]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[CreateTable_DivisionStatistics_DailyChange_LastProcessed]
GO
/****** Object:  StoredProcedure [config].[CreateTable_DivisionStatistics_DailyChange_LastProcessed]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [config].[CreateTable_DivisionStatistics_DailyChange_LastProcessed] AS

-- ===========================================================================================================================================================
-- Author:		Alex Green
-- Create date: 02-02-2017
-- Description:	Creates the date table for running the loop to calculate DivisionStatistics changes per day
-- ===========================================================================================================================================================

CREATE TABLE [config].[DivisionStatistics_DailyChange_LastProcessed]
	(
		  Environment  nchar(3)  NOT NULL
		, DateLastProcessed  date  NOT NULL		
		, DateForNextRun date NULL

	)
GO
