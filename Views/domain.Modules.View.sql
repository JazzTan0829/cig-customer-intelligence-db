USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Modules]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Modules]
GO
/****** Object:  View [domain].[Modules]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [domain].[Modules] AS
SELECT AC.AccountID
	  ,SUB.[Environment]
	  ,SUB.AccountCode
	  ,[EventYearMonth]
      ,[EventYear]
      ,[EventMonth]
      ,[EventDate]
      ,[EventType]
      ,[EventDescription]
      ,[InflowOutflow]
      ,[Itemcode]
      ,[ItemDescription]
	  ,[ValuePerMonth]
FROM (
SELECT 
      [Environment]
      ,[AccountCode]
      ,[Name]
	  ,[EventYearMonth]
      ,[EventYear]
      ,[EventMonth]
      ,[EventDate]
      ,[EventType]
      ,[EventDescription]
      ,[InflowOutflow]
      ,[Itemcode]
      ,[ItemDescription]
	  ,[ValuePerMonth]
	  ,ROW_NUMBER() OVER (Partition BY Environment, AccountCode, ItemCode Order BY EventDate desc, InflowOutflow ) AS RowNumber
  FROM domain.Contracts 
  WHERE /*EventType='CA' AND*/ ItemType='Module' AND InflowOutflow<>'Cancelled'
     ) SUB
  JOIN domain.AccountsContract_Summary ACS
  ON SUB.AccountCode=ACS.AccountCode AND SUB.Environment=ACS.Environment

  JOIN domain.Accounts AC
  ON SUB.AccountCode=AC.AccountCode AND SUB.Environment=AC.Environment

  LEFT JOIN domain.PackageClassification PC
  ON ACS.LatestCommPackage=PC.PackageCode AND ACS.Environment=PC.Environment

  WHERE SUB.RowNumber='1' AND SUB.InflowOutflow='Inflow' AND ACS.Churned='0' AND AccountClassificationCode IN ('AC7', 'AC1', 'JBO', 'EOL','ACC')
GO
