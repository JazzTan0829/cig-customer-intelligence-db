USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_LeadSources]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_LeadSources]
GO
/****** Object:  StoredProcedure [domain].[Load_LeadSources]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_LeadSources]
AS
BEGIN
TRUNCATE TABLE domain.LeadSources

INSERT INTO domain.LeadSources
SELECT 
	ID, 
	Division, 
	Code, 
	Description, 
	sysmodified, 
	Active, 
	syscreated, 
	syscreator, 
	Notes, 
	sysmodifier, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed, 
	DescriptionTermID
FROM
	( 
	SELECT 
		ID, 
		Division, 
		Code, 
		Description, 
		sysmodified, 
		Active, 
		syscreated, 
		syscreator, 
		Notes, 
		sysmodifier, 
		CIGCopyTime, 
		Environment, 
		CIGProcessed, 
		DescriptionTermID,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_LeadSources
	) SUB
WHERE SUB.RowNumber='1'
END
GO
