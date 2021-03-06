USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Units]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Units]
GO
/****** Object:  StoredProcedure [domain].[Load_Units]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_Units]

AS
BEGIN

TRUNCATE TABLE domain.Units

INSERT INTO domain.Units
SELECT 
	Type, 
	Active, 
	ID, 
	Division, 
	Code, 
	Description, 
	Main, 
	LengthUnit, 
	AreaUnit, 
	VolumeUnit, 
	WeightUnit, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed, 
	DescriptionTermID, 
	TimeUnit
FROM
	( 
	SELECT 
		Type, 
		Active, 
		ID, 
		Division, 
		Code, 
		Description, 
		Main, 
		LengthUnit, 
		AreaUnit, 
		VolumeUnit, 
		WeightUnit, 
		CIGCopyTime, 
		Environment, 
		CIGProcessed, 
		DescriptionTermID, 
		TimeUnit,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_Units
	) SUB
WHERE SUB.RowNumber='1'
END
GO
