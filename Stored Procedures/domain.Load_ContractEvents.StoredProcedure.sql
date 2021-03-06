USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ContractEvents]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ContractEvents]
GO
/****** Object:  StoredProcedure [domain].[Load_ContractEvents]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_ContractEvents]
AS
BEGIN
TRUNCATE TABLE domain.ContractEvents

INSERT INTO domain.ContractEvents
SELECT 
	ID, 
	Type, 
	Description, 
	sysmodified, 
	syscreated, 
	syscreator, 
	sysmodifier, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed, 
	DescriptionTermId, 
	CreationType
FROM
	( 
	SELECT 
		ID, 
		Type, 
		Description, 
		sysmodified, 
		syscreated, 
		syscreator, 
		sysmodifier, 
		CIGCopyTime, 
		Environment, 
		CIGProcessed, 
		DescriptionTermId, 
		CreationType,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_ContractEvents
	) SUB
WHERE SUB.RowNumber='1'
END
GO
