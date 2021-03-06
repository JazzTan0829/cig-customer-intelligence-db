USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Persons_Email]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Persons_Email]
GO
/****** Object:  StoredProcedure [raw].[Load_Persons_Email]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 09-03-2018
-- Description:	This job truncates the existing raw.Persons_Email table and inserts the most recent backup record from the raw Persons table.
-- ============================================================================================================================================================
CREATE PROCEDURE [raw].[Load_Persons_Email]

AS
BEGIN

TRUNCATE TABLE [raw].Persons_Email;

WITH CTE_BackupPersonsEmail
AS

	(
		SELECT
		  [ID]
		  ,[Email]
		  , ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RowNumber	-- Creates a row number grouped on the PersonID with the latest CIGCopyTime record with row number 1
		FROM
			[raw].[HOST_CIG_Persons]
	)


INSERT INTO [raw].Persons_Email
(
		  [PersonID]
		  ,[Email]
)

SELECT

	[ID] AS [PersonID]
	,[Email]

FROM
	CTE_BackupPersonsEmail

WHERE
	RowNumber = 1					-- Selects the latest CIGCopyTime row to insert into the domain table

END
GO
