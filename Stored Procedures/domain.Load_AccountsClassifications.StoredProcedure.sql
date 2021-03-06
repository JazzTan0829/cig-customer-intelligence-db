USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_AccountsClassifications]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_AccountsClassifications]
GO
/****** Object:  StoredProcedure [domain].[Load_AccountsClassifications]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_AccountsClassifications]
AS
BEGIN
TRUNCATE TABLE domain.AccountsClassifications

INSERT INTO domain.AccountsClassifications
(ID, 
Division, 
AccountClassificationCode, 
AccountClassificationDescription, 
sysmodified, 
syscreated, 
syscreator, 
sysmodifier, 
CIGCopyTime, 
Environment, 
CIGProcessed, 
DescriptionTermID, 
CreditManagementScenario)
SELECT
	ID,
	Division,
	Code AS AccountClassificationCode,
	Description AS AccountClassificationDescription,
	sysmodified,
	syscreated,
	syscreator,
	sysmodifier,
	CIGCopyTime,
	Environment,
	CIGProcessed,
	DescriptionTermID,
	CreditManagementScenario
FROM
	(
	SELECT
		ID,
		Division,
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
		CreditManagementScenario,
		ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_Classifications
	) SUB
WHERE SUB.RowNumber='1'
END
GO
