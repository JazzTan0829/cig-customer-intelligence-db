USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ContractLines]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ContractLines]
GO
/****** Object:  StoredProcedure [domain].[Load_ContractLines]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_ContractLines]
AS
BEGIN
TRUNCATE TABLE domain.ContractLines

INSERT INTO domain.ContractLines
SELECT 
	ID, 
	ContractID, 
	Code, 
	Description, 
	Quantity, 
	Price, 
	StartDate, 
	ContractEvent, 
	FinalDate, 
	CancellationDate, 
	CancellationEvent, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed, 
	Unitcode, 
	Type, 
	syscreated, 
	syscreator, 
	sysmodified, 
	sysmodifier
FROM
	( 
	SELECT 
		ID, 
		ContractID, 
		Code, 
		Description, 
		Quantity, 
		Price, 
		StartDate, 
		ContractEvent, 
		FinalDate, 
		CancellationDate, 
		CancellationEvent, 
		CIGCopyTime, 
		Environment, 
		CIGProcessed, 
		Unitcode, 
		Type, 
		syscreated, 
		syscreator, 
		sysmodified, 
		sysmodifier,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_ContractLines
	) SUB
WHERE SUB.RowNumber='1'
END
GO
