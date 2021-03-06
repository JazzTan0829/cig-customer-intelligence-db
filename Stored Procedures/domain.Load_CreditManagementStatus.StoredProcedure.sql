USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_CreditManagementStatus]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_CreditManagementStatus]
GO
/****** Object:  StoredProcedure [domain].[Load_CreditManagementStatus]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[Load_CreditManagementStatus]
AS
BEGIN
TRUNCATE TABLE domain.CreditManagementStatus

INSERT INTO domain.CreditManagementStatus
SELECT 
	ID, 
	Code, 
	Description, 
	DescriptionTermID, 
	Division, 
	IsActive, 
	syscreated, 
	syscreator, 
	sysmodified, 
	sysmodifier, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed

FROM
	( 
	SELECT 
	ID, 
	Code, 
	Description, 
	DescriptionTermID, 
	Division, 
	IsActive, 
	syscreated, 
	syscreator, 
	sysmodified, 
	sysmodifier, 
	CIGCopyTime, 
	Environment, 
	CIGProcessed,
	ROW_NUMBER() OVER (PARTITION BY ID ORDER BY CigCopyTime DESC) AS RowNumber
	FROM raw.HOST_CIG_CreditManagementStatus
	) SUB
WHERE SUB.RowNumber='1'
END
GO
