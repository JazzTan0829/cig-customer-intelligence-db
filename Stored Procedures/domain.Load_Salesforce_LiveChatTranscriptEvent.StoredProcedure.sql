USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_LiveChatTranscriptEvent]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Salesforce_LiveChatTranscriptEvent]
GO
/****** Object:  StoredProcedure [domain].[Load_Salesforce_LiveChatTranscriptEvent]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [domain].[Load_Salesforce_LiveChatTranscriptEvent] 
AS
BEGIN 
TRUNCATE TABLE domain.Salesforce_LiveChatTranscriptEvent
END
BEGIN

WITH Salesforce_LiveChatTranscriptEvent_Latest
(
		[Id]
      ,[AgentId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[LastModifiedDate]
      ,[Detail]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LiveChatTranscriptId]
      ,[Name]
      ,[SystemModstamp]
      ,[Time]
      ,[Type]
      ,[EtlInsertTime],
	  RN
)
AS
(
	SELECT
	 [Id]
      ,[AgentId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[LastModifiedDate]
      ,[Detail]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LiveChatTranscriptId]
      ,[Name]
      ,[SystemModstamp]
      ,[Time]
      ,[Type]
      ,[EtlInsertTime],
	  ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
	  FROM [CustomerIntelligence].[raw].[Salesforce_LiveChatTranscriptEvent]
)

INSERT INTO [domain].[Salesforce_LiveChatTranscriptEvent]
	(
		[Id]
      ,[AgentId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[LastModifiedDate]
      ,[Detail]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LiveChatTranscriptId]
      ,[Name]
      ,[SystemModstamp]
      ,[Time]
      ,[Type]
      ,[EtlInsertTime]
	)

	SELECT
		[Id]
      ,[AgentId]
      ,[CreatedById]
      ,[CreatedDate]
      ,[LastModifiedDate]
      ,[Detail]
      ,[IsDeleted]
      ,[LastModifiedById]
      ,[LiveChatTranscriptId]
      ,[Name]
      ,[SystemModstamp]
      ,[Time]
      ,[Type]
      ,[EtlInsertTime]
	  FROM Salesforce_LiveChatTranscriptEvent_Latest
	  WHERE RN = 1

END
GO
