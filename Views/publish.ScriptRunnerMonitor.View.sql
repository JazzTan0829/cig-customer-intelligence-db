USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[ScriptRunnerMonitor]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[ScriptRunnerMonitor]
GO
/****** Object:  View [publish].[ScriptRunnerMonitor]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [publish].[ScriptRunnerMonitor] AS 
SELECT ScriptName, Timestamp, CompletionTimestamp, DATEDIFF(MILLISECOND, Timestamp,CompletionTimestamp) AS ExecutionTime_ms, CASE  when DATEDIFF(DAY, Timestamp,SYSDATETIME())>1 THEN 1 ELSE 0 END as Warning
FROM(
	SELECT ScriptName, Timestamp, CompletionTimestamp, ROW_NUMBER() OVER (PARTITION BY ScriptName ORDER BY Timestamp DESC) AS ROWNUMBER
	FROM config.ScriptExecutionLogs
	) AS SubQuery
WHERE ROWNUMBER=1 
GO
