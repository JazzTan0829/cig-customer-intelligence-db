USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AppUsage]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_AppUsage]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AppUsage]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2016-10-04
-- Description:	CreateTable procedure for the app usage information
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_AppUsage] 
AS
BEGIN
IF OBJECT_ID (N'CustomerIntelligence.domain.AppUsage', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.AppUsage

CREATE TABLE CustomerIntelligence.domain.AppUsage
(	
	Environment NCHAR(3) NULL,
	App NVARCHAR(100) NULL,
	AppUsageFreeReason INT NULL,
	IsFreeConnection INT NULL,
	Month INT NULL,
	YEAR INT NULL,
	AccountID NVARCHAR(100) NULL,
	AccountCode NVARCHAR(100) NULL,
	DivisionID NVARCHAR(100) NULL
)
END
GO
