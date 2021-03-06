USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[EtlToolsMonitor]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[EtlToolsMonitor]
GO
/****** Object:  View [publish].[EtlToolsMonitor]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [publish].[EtlToolsMonitor] AS  
SELECT LastHeartbeat.ComponentName,
	   LastHeartbeat.LastHeartbeat, 
	   HeartbeatConfig.HeartbeatTimeWindow_ms, 
	   case when DATEDIFF(MILLISECOND, LastHeartbeat.LastHeartbeat,SYSDATETIME()) <  HeartbeatConfig.HeartbeatTimeWindow_ms THEN 1 ELSE 0 END as HeartbeatWorking,
	   StartExec.LatestStartTimeExecution,
	   EndExec.LatestEndTimeExecution,
	   case when DATEDIFF(MILLISECOND, StartExec.LatestStartTimeExecution,EndExec.LatestEndTimeExecution) < 0 THEN NULL ELSE DATEDIFF(MILLISECOND, StartExec.LatestStartTimeExecution,EndExec.LatestEndTimeExecution) END AS ExecutionTime_ms,
	   case when (DATEDIFF(MILLISECOND, StartExec.LatestStartTimeExecution,EndExec.LatestEndTimeExecution) > 10*60*1000) OR NOT(DATEDIFF(MILLISECOND, LastHeartbeat.LastHeartbeat,SYSDATETIME()) <  HeartbeatConfig.HeartbeatTimeWindow_ms) THEN 1 ELSE 0 END AS Warning
FROM
  ( SELECT ComponentName, max(Date) AS LastHeartbeat
   FROM [CustomerIntelligence].[config].[ETLLog]
   WHERE Message LIKE'%Heartbeat%'
   GROUP BY ComponentName ) AS LastHeartbeat

LEFT JOIN
  (SELECT ComponentName, cast(replace(message, 'Starting heartbeat every: ', '') AS INT) AS HeartbeatTimeWindow_ms
   FROM
     (SELECT ComponentName,Date, message, ROW_NUMBER() OVER (PARTITION BY ComponentName ORDER BY Date DESC) AS ROWNUMBER
      FROM [CustomerIntelligence].[config].[ETLLog]
      WHERE Message LIKE'%Starting heartbeat every: %' ) AS SubQuery
   WHERE ROWNUMBER=1 ) AS HeartbeatConfig 
   ON HeartbeatConfig.ComponentName=LastHeartbeat.ComponentName

LEFT JOIN
  ( SELECT ComponentName, Date AS LatestStartTimeExecution
   FROM
     (SELECT ComponentName, message, date, ROW_NUMBER() OVER (PARTITION BY ComponentName ORDER BY Date DESC) AS ROWNUMBER
      FROM [CustomerIntelligence].[config].[ETLLog]
      WHERE Message LIKE'%executing...%'
 ) AS SubQuery
   WHERE ROWNUMBER=1 ) AS StartExec 
   ON StartExec.ComponentName = LastHeartbeat.ComponentName

LEFT JOIN
  ( SELECT ComponentName, Date AS LatestEndTimeExecution
   FROM
     (SELECT ComponentName, message, date, ROW_NUMBER() OVER (PARTITION BY ComponentName ORDER BY Date DESC) AS ROWNUMBER
      FROM [CustomerIntelligence].[config].[ETLLog]
      WHERE Message LIKE'%executed%' ) AS SubQuery
   WHERE ROWNUMBER=1 ) AS EndExec 
   ON EndExec.ComponentName = LastHeartbeat.ComponentName
GO
