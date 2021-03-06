USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ItemRelations]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ItemRelations]
GO
/****** Object:  StoredProcedure [domain].[Load_ItemRelations]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_ItemRelations]
AS
BEGIN

TRUNCATE TABLE domain.ItemRelations

INSERT INTO domain.ItemRelations
SELECT 
	ID, 
	Type, 
	Item, 
	ItemRelated, 
	Quantity, 
	MaxQuantity, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed, 
	Division
FROM
	( 
	SELECT 
			ID, 
			Type, 
			Item, 
			ItemRelated, 
			Quantity, 
			MaxQuantity, 
			CIGCopyTime, 
			Environment, 
			CIGProcessed, 
			Division,
			ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_ItemRelations
	) SUB
WHERE SUB.RowNumber='1'
END
GO
