USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[CreateTable_ErrorLog]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[CreateTable_ErrorLog]
GO
/****** Object:  StoredProcedure [config].[CreateTable_ErrorLog]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [config].[CreateTable_ErrorLog]

AS
BEGIN

-- ==========================================================================================================
-- Author:		Alex Green
-- Create date: 05-01-2016
-- Description:	Creates the Error Log table for errors that occur in the Run_Daily procedure
-- ==========================================================================================================

IF OBJECT_ID (N'CustomerIntelligence.config.ErrorLog', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.config.ErrorLog

CREATE TABLE CustomerIntelligence.config.ErrorLog
(	
	  Occurrence DATETIME
	, ErrorProcedure NVARCHAR(MAX)
	, ErrorMessage NVARCHAR(MAX)
	, ErrorNumber INT
	, ErrorSeverity INT
	, ErrorState INT
	, ErrorLine INT
)
END

GO
