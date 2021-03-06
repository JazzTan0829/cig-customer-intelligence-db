USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivitySectors]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ActivitySectors]
GO
/****** Object:  StoredProcedure [domain].[Load_ActivitySectors]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_ActivitySectors]
AS
BEGIN
TRUNCATE TABLE domain.ActivitySectors

INSERT INTO domain.ActivitySectors
SELECT 
	ID, 
	Code, 
	Description, 
	sysmodified, 
	syscreated, 
	syscreator, 
	sysmodifier, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed, 
	DescriptionTermID, 
	Parent
FROM
	( 
	SELECT 
		ID, 
		Code, 
		Description, 
		sysmodified, 
		syscreated, 
		syscreator, 
		sysmodifier, 
		CIGCopyTime, 
		Environment, 
		CIGProcessed, 
		DescriptionTermID, 
		Parent,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_ActivitySectors
	) SUB
WHERE SUB.RowNumber='1'
END
GO
