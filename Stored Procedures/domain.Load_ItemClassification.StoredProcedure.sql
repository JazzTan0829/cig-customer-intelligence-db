USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ItemClassification]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ItemClassification]
GO
/****** Object:  StoredProcedure [domain].[Load_ItemClassification]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[Load_ItemClassification]

AS
BEGIN

-- =========================================================================================================================
-- Author:		Alex Green
-- Create date: 24-11-2015
-- Description:	Loads the ItemClassification from ContractData

-- UPDATED: 31/07-2017
-- Replaced the update section with a left join to allow the job to run on Azure

-- UPDATED: 16/10/2017
-- Changed to use Corporate BI DW version of ContractStatistics
-- =========================================================================================================================

TRUNCATE TABLE domain.ItemClassification

INSERT INTO domain.ItemClassification
(
	Environment,
	ItemCode,
	ItemDescription,
	ItemType
)

SELECT
	CS.Environment
	, CS.ItemCode
	, CS.ItemDescription
	, IT.ItemType
FROM
	(
		SELECT DISTINCT 
			(CASE WHEN Environment = 'GB' THEN 'UK' ELSE Environment END) AS Environment
			, Itemcode
			, ItemDescription
		FROM [raw].[DW_ContractStatistics]
		WHERE
			META_LOAD_ENDDTS IS NULL		 -- If field is NULL then this means it is an old record
			AND META_ISDELETED = 0			 -- If equal to 1 then this row is one that should be deleted
	) CS	
	
-- JOINS THE ITEMTYPE FOR ENVIRONMENTS WHERE THIS IS NULL FOR SAME ITEMCODES
LEFT JOIN 
	(
		SELECT 		
			Itemcode
			, ItemType
			, ROW_NUMBER() OVER(PARTITION BY Itemcode ORDER BY C) AS RN			-- There are some itemcodes with different itemtypes in some environments. This takes the most common itemtype and sets all itemcodes to this.
		FROM		
			(
				SELECT  
					Itemcode
					, ItemType
					, COUNT(Itemcode) AS C
				FROM [raw].[DW_ContractStatistics]
				WHERE 
					ItemType IS NOT NULL
					AND META_LOAD_ENDDTS IS NULL		 -- If field is NULL then this means it is an old record
					AND META_ISDELETED = 0			 -- If equal to 1 then this row is one that should be deleted
				GROUP BY Itemcode, ItemType
			) SQ
	) IT
ON CS.Itemcode = IT.Itemcode
AND RN = 1	-- Joins only where the highest itemtype count

END
GO
