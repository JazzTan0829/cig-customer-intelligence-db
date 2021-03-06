USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[OAuthClients]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[OAuthClients]
GO
/****** Object:  View [domain].[OAuthClients]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [domain].[OAuthClients]
AS

SELECT 
	ID AS ApplicationID
      ,[Account]
      ,[DescriptionTermID]
      ,[Description]
      ,[ApplicationName]
      ,[Logo]
      ,[Type]
      ,[StartDate]
      ,[EndDate]
      ,[ReturnUrl]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[LogoFileName]
      ,[PrivilegedAccess]
      ,[PublishDate]
      ,[AllowResourceOwnerFlow]
      ,[Category]
      ,[CIGCopyTime]
      ,[Environment]
      ,[CIGProcessed]
FROM
	(
		SELECT * , ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RN		-- Used to select latest CIGCopyTime record for each client
		FROM [raw].[HOST_CIG_OAuthClients]
	) OAuth
WHERE OAuth.RN = 1		-- Selects only the latest OAuthID record
GO
