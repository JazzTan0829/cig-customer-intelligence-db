USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Divisions]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Divisions]
GO
/****** Object:  StoredProcedure [domain].[Load_Divisions]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================================================================
-- Author:		Alex Green
-- Create date: 29-09-2016
-- Description:	This job truncates the existing domain.Divisions table and inserts the most recent backup record from the raw Divisions table.
-- ============================================================================================================================================================

CREATE PROCEDURE [domain].[Load_Divisions]

AS
BEGIN

TRUNCATE TABLE CustomerIntelligence.domain.Divisions

INSERT INTO CustomerIntelligence.domain.Divisions
(		
	   [Environment]
      ,[DivisionCode]
      ,[DivisionDescription]
      ,[AccountID]
      ,[Country]
      ,[Currency]
      ,[Main]
      ,[StartDate]
      ,[EndDate]
      ,[CustomerPortal]
      ,[BlockingStatusCode]
      ,[Status]
      ,[LinkedDivision]
      ,[LegislationCode]

	  ,[Origin] 
	  ,[Website]
	  ,[SectorID]
	  ,[SubSectorID]
	  ,[CompanySizeID] 
	  ,[ChamberOfCommerce]
	  ,[City]
	  ,[Postcode] 
	  ,[DunsNumber] 
	  ,[BusinessTypeID]
	  
      ,[Deleted]
      ,[Deleter]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[TemplateCode]
      ,[DatevAccountantNumber]
      ,[DatevClientNumber]
      ,[ShareCapital]
      ,[CIGCopyTime]
)

SELECT 
	   Environment
	  ,[Code] AS [DivisionCode]
	  ,[Description] AS [DivisionDescription]
      ,[Customer] AS [AccountID]
      ,[Country]
      ,[Currency]
      ,[Main]
      ,[StartDate]
      ,[EndDate]
      ,[CustomerPortal]
      ,[BlockingStatus] AS [BlockingStatusCode]
      ,[Status]
      ,[LinkedDivision]
      ,[LegislationCode]

	  ,[Origin] 
	  ,[Website]
	  ,[ActivitySector]
	  ,[ActivitySubSector]
	  ,[CompanySize] 
	  ,[ChamberOfCommerce]
	  ,[City]
	  ,[Postcode] 
	  ,[DunsNumber] 
	  ,[BusinessType]

	  ,[Deleted]
      ,[Deleter]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[TemplateCode]
      ,[DatevAccountantNumber]
      ,[DatevClientNumber]
      ,[ShareCapital]
      ,[CIGCopyTime]	

FROM
	(
		SELECT
		   [CustomerPortal]
		  ,[BlockingStatus]
		  ,[Status]
		  ,[syscreated]
		  ,[sysmodified]
		  ,[Code]
		  ,[HID]
		  ,[Main]
		  ,[CIGCopyTime]
		  ,[Environment]
		  ,[StartDate]
		  ,[EndDate]
		  ,[Account]
		  ,[Description]
		  ,[Customer]
		  ,[Country]
		  ,[Currency]
		  ,[TemplateCode]

		  ,[Origin] 
		  ,[Website]
		  ,[ActivitySector]
		  ,[ActivitySubSector]
		  ,[CompanySize] 
		  ,[ChamberOfCommerce]
		  ,[City]
		  ,[Postcode] 
		  ,[DunsNumber] 
		  ,[BusinessType]

		  ,[TaxOfficeNumber]
		  ,[DatevAccountantNumber]
		  ,[DatevClientNumber]
		  ,[ShareCapital]
		  ,[sysmodifier]
		  ,[syscreator]
		  ,[LinkedDivision]
		  ,[LegislationCode]
		  ,[Deleted]
		  ,[Deleter]
		  , ROW_NUMBER() OVER(PARTITION BY [Environment], Code ORDER BY CIGCopyTime DESC) AS RowNumber	-- Creates a row number grouped on the Environment DivisionCode with the latest CIGCopyTime record with row number 1
			
		FROM
			CustomerIntelligence.[raw].[HOST_CIG_Divisions]
	
	) AS [Backup]

WHERE 
	RowNumber = 1					-- Selects the latest CIGCopyTime row to insert into the domain table

END
GO
