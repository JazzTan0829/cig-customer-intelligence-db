USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_DivisionTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_DivisionTypes]
GO
/****** Object:  StoredProcedure [domain].[Load_DivisionTypes]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_DivisionTypes]
AS
BEGIN
TRUNCATE TABLE domain.DivisionTypes

INSERT INTO domain.DivisionTypes(
		ID, 
		Code, 
		Description, 
		DescriptionTermId, 
		Item, 
		Modules, 
		Environment)

SELECT 
		ID, 
		Code, 
		Description, 
		DescriptionTermId, 
		Item, 
		Modules, 
		Environment
FROM (
SELECT 
		ID, 
		Code, 
		Description, 
		DescriptionTermId, 
		Item, 
		Modules, 
		Environment,
		ROW_NUMBER() OVER(PARTITION BY [Environment], Code ORDER BY CIGCopyTime DESC) AS RowNumber
FROM raw.HOST_CIG_DivisionTypes ) SUB
WHERE Sub.RowNumber='1'
END
GO
