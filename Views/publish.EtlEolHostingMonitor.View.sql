USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[EtlEolHostingMonitor]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[EtlEolHostingMonitor]
GO
/****** Object:  View [publish].[EtlEolHostingMonitor]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [publish].[EtlEolHostingMonitor] AS  
SELECT Environment, max(BackupDateTime) AS LatestRestoredDelta, CASE WHEN DATEDIFF(Day, max(BackupDateTime), GETDATE())>=1  THEN 1 ELSE 0 END AS Warning
  FROM [CustomerIntelligence].[config].[EOLHosting_BackupRestore_Summary]
  GROUP BY Environment
GO
