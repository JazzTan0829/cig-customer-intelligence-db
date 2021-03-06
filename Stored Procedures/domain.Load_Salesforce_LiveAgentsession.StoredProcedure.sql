USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_LiveAgentsession]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Salesforce_LiveAgentsession]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_LiveAgentsession]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [domain].[Load_Salesforce_LiveAgentsession] 
AS
BEGIN 
TRUNCATE TABLE domain.Salesforce_LiveAgentsession
END
BEGIN

WITH Salesforce_LiveAgentsession_Latest
(
		[Id]
      ,[AgentId]
      ,[ChatReqAssigned]
      ,[ChatReqDeclined]
      ,[ChatReqEngaged]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[LoginTime]
      ,[LogoutTime]
      ,[Name]
      ,[NumFlagLoweredAgent]
      ,[NumFlagLoweredSupervisor]
      ,[NumFlagRaised]
      ,[OwnerId]
      ,[SystemModstamp]
      ,[TimeAtCapacity]
      ,[TimeIdle]
      ,[TimeInAwayStatus]
      ,[TimeInChats]
      ,[TimeInOnlineStatus]
      ,[EtlInsertTime]
      ,[ChatReqTimedOut],
	  RN
)
AS
(
	SELECT
			[Id]
      ,[AgentId]
      ,[ChatReqAssigned]
      ,[ChatReqDeclined]
      ,[ChatReqEngaged]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[LoginTime]
      ,[LogoutTime]
      ,[Name]
      ,[NumFlagLoweredAgent]
      ,[NumFlagLoweredSupervisor]
      ,[NumFlagRaised]
      ,[OwnerId]
      ,[SystemModstamp]
      ,[TimeAtCapacity]
      ,[TimeIdle]
      ,[TimeInAwayStatus]
      ,[TimeInChats]
      ,[TimeInOnlineStatus]
      ,[EtlInsertTime]
      ,[ChatReqTimedOut],
	  ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
	  FROM [CustomerIntelligence].[raw].[Salesforce_LiveAgentsession]
)

INSERT INTO [domain].[Salesforce_LiveAgentsession]
	(
		[Id]
      ,[AgentId]
      ,[ChatReqAssigned]
      ,[ChatReqDeclined]
      ,[ChatReqEngaged]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[LoginTime]
      ,[LogoutTime]
      ,[Name]
      ,[NumFlagLoweredAgent]
      ,[NumFlagLoweredSupervisor]
      ,[NumFlagRaised]
      ,[OwnerId]
      ,[SystemModstamp]
      ,[TimeAtCapacity]
      ,[TimeIdle]
      ,[TimeInAwayStatus]
      ,[TimeInChats]
      ,[TimeInOnlineStatus]
      ,[EtlInsertTime]
      ,[ChatReqTimedOut]
	)

	SELECT
		[Id]
      ,[AgentId]
      ,[ChatReqAssigned]
      ,[ChatReqDeclined]
      ,[ChatReqEngaged]
      ,[CreatedById]
      ,[CreatedDate]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LastModifiedDate]
      ,[LoginTime]
      ,[LogoutTime]
      ,[Name]
      ,[NumFlagLoweredAgent]
      ,[NumFlagLoweredSupervisor]
      ,[NumFlagRaised]
      ,[OwnerId]
      ,[SystemModstamp]
      ,[TimeAtCapacity]
      ,[TimeIdle]
      ,[TimeInAwayStatus]
      ,[TimeInChats]
      ,[TimeInOnlineStatus]
      ,[EtlInsertTime]
      ,[ChatReqTimedOut]
	  FROM Salesforce_LiveAgentsession_Latest
	  WHERE RN = 1

END
GO
