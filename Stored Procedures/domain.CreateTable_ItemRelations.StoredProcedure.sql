USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ItemRelations]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ItemRelations]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ItemRelations]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_ItemRelations] 
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.ItemRelations', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.ItemRelations

CREATE TABLE domain.ItemRelations
	(
	ID uniqueidentifier NOT NULL, 
	Type int NOT NULL, 
	Item uniqueidentifier NOT NULL, 
	ItemRelated uniqueidentifier NOT NULL, 
	Quantity float NOT NULL, 
	MaxQuantity float NULL,
	CIGCopyTime Datetime NULL, 
	Environment nchar(3) NULL, 
	CIGProcessed bit NULL, 
	Division int NULL
	)
END
GO
