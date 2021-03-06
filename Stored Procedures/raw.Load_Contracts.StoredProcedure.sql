USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Contracts]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Contracts]
GO
/****** Object:  StoredProcedure [raw].[Load_Contracts]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [raw].[Load_Contracts]
AS
BEGIN
TRUNCATE TABLE raw.Contracts

INSERT INTO raw.Contracts
SELECT 
	ID,
	Number, 
	Account, 
	Type, 
	StartDate, 
	ContractEvent, 
	FinalDate, 
	EndDate,
	CancellationDate, 
	CancellationEvent, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed, 
	TimeUnit, 
	syscreated, 
	syscreator, 
	sysmodified, 
	sysmodifier
FROM
	( 
	SELECT 
		ID,
		Number, 
		Account, 
		Type, 
		StartDate, 
		ContractEvent, 
		FinalDate, 
		EndDate,
		CancellationDate, 
		CancellationEvent, 
		CIGCopyTime, 
		Environment, 
		CIGProcessed, 
		TimeUnit, 
		syscreated, 
		syscreator, 
		sysmodified, 
		sysmodifier,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_Contracts
	) SUB
WHERE SUB.RowNumber='1'
END
GO
