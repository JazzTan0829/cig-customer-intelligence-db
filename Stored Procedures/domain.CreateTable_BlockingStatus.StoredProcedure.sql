USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_BlockingStatus]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_BlockingStatus]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_BlockingStatus]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 09/09/2016
-- Description:	This procedure drops the previous version of the DivisionBlockingStatus table and rebuilds it. 
--				The domain.BlockingStatus table contains a slightly modified version of the raw BlockingStatus table from EOL. 
-- =====================================================================================================================================================================

CREATE PROCEDURE [domain].[CreateTable_BlockingStatus]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.BlockingStatus', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.[domain].BlockingStatus

CREATE TABLE CustomerIntelligence.[domain].BlockingStatus
(
	   [BlockingStatusCode] INT NOT NULL						-- This field is called ID in the raw data table
      ,[BlockingStatusDescription] NVARCHAR(60) NOT NULL		-- This field is called Description in the raw table
      ,[DescriptionTermID] INT NULL
      ,[DescriptionSuffix] NVARCHAR(60) NULL
      ,[DescriptionSuffixTermID] INT NULL
      ,[CIGCopyTime] DATETIME NULL
)


CREATE CLUSTERED INDEX IX_BlockingStatus ON CustomerIntelligence.[domain].BlockingStatus (BlockingStatusCode) ;

END 
GO
