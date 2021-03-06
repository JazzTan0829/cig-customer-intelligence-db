USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_App]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_App]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_App]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2016-10-04
-- Description:	Create table procedure for App information
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_App] 
AS
BEGIN
IF OBJECT_ID (N'CustomerIntelligence.domain.App', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.App

CREATE TABLE CustomerIntelligence.domain.App
(	
	Environment NCHAR(3) NULL,
	App NVARCHAR(100) NULL,
	AppName NVARCHAR(100) NULL,
	Partner NVARCHAR(100) NULL,
	PartnerCode NVARCHAR(50) NULL,
	Category NVARCHAR(100) NULL
)
END
GO
