USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[OAuthClientUsers]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[OAuthClientUsers]
GO
/****** Object:  View [domain].[OAuthClientUsers]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [domain].[OAuthClientUsers]
AS

SELECT 
	[ID], 
	[OAuthClient], 
	[UserID], 
	[EndDate], 
	[syscreated], 
	[syscreator], 
	[sysmodified], 
	[sysmodifier], 
	[CIGCopyTime], 
	[Environment], 
	[CIGProcessed]
FROM
	(
		SELECT * , ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RN		-- Used to select latest CIGCopyTime record for each client
		FROM [raw].[HOST_CIG_OAuthClientUsers]
	) OAuth
WHERE OAuth.RN = 1		-- Selects only the latest OAuthID record
GO
