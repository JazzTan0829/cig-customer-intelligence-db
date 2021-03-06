USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Persons]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Persons]
GO
/****** Object:  StoredProcedure [domain].[Load_Persons]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 28-09-2016
-- Description:	This job truncates the existing domain.Persons table and inserts the most recent backup record from the raw Persons table.
-- ============================================================================================================================================================
CREATE PROCEDURE [domain].[Load_Persons]

AS
BEGIN

TRUNCATE TABLE CustomerIntelligence.domain.Persons ;

WITH CTE_BackupPersons
AS

	(
		SELECT
		  [Environment]
		  ,[ID] 
		  ,[Customer] 
		  ,[FullName]
		  ,[NameComposition]
		  ,[LastName]
		  ,[FirstName]
		  ,[MiddleName]
		  ,[Initials]
		  ,[Title]
		  ,[Country]
		  ,[Language]
		  ,[JobTitleDescription]
		  ,[syscreated]
		  ,[syscreator]
		  ,[sysmodified]
		  ,[sysmodifier]
		  ,[CIGCopyTime]
		  ,IsAnonymized
		  ,AnonymisationSource
		  , ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RowNumber	-- Creates a row number grouped on the PersonID with the latest CIGCopyTime record with row number 1
			
		FROM
			CustomerIntelligence.[raw].[HOST_CIG_Persons]
	)
		

INSERT INTO CustomerIntelligence.domain.Persons
(		

      [PersonID]
      ,[AccountID]
	  ,[Environment]
      ,[FullName]
      ,[NameComposition]
      ,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[Initials]
      ,[Title]
      ,[Country]
      ,[Language]
      ,[JobTitleDescription]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[CIGCopyTime]
	  ,IsAnonymized
	  ,AnonymisationSource
)

SELECT 
	   
	  [ID] AS [PersonID]
      ,[Customer] AS [AccountID]
	  ,[Environment]
      ,[FullName]
      ,[NameComposition]
      ,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[Initials]
      ,[Title]
      ,[Country]
      ,[Language]
      ,[JobTitleDescription]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[CIGCopyTime]	
	  ,IsAnonymized
	  ,AnonymisationSource

FROM
	CTE_BackupPersons

WHERE 
	RowNumber = 1					-- Selects the latest CIGCopyTime row to insert into the domain table

END
GO
