USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ItemClassification]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ItemClassification]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ItemClassification]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===========================================================
-- Author:		Alex Green
-- Create date: 26/11/2015
-- Description: Creates the ItemClassification table
-- ===========================================================

CREATE PROCEDURE [domain].[CreateTable_ItemClassification]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.dbo.ItemClassification', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.dbo.ItemClassification

CREATE TABLE CustomerIntelligence.dbo.ItemClassification
(
	Environment NCHAR(3) NOT NULL,
	ItemCode NVARCHAR(30) NOT NULL,
	ItemDescription NVARCHAR(60) NULL,
	ItemType NVARCHAR(30) NULL
)

END
GO
