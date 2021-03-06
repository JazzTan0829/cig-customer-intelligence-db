USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ItemClasses]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ItemClasses]
GO
/****** Object:  StoredProcedure [domain].[Load_ItemClasses]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_ItemClasses]
AS
BEGIN

TRUNCATE TABLE domain.ItemClasses

INSERT INTO domain.ItemClasses
SELECT 
	ID, 
	Division, 
	ClassID, 
	Code, 
	Description, 
	DescriptionTermID, 
	Notes, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed
FROM
	( 
	SELECT 
			ID, 
			Division, 
			ClassID, 
			Code, 
			Description, 
			DescriptionTermID, 
			Notes, 
			CIGCopyTime, 
			Environment, 
			CIGProcessed,
			ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_ItemClasses
	) SUB
WHERE SUB.RowNumber='1'
END
GO
