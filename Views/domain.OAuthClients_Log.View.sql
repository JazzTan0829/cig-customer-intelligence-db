USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[OAuthClients_Log]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[OAuthClients_Log]
GO
/****** Object:  View [domain].[OAuthClients_Log]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [domain].[OAuthClients_Log]
AS
  SELECT
		DISTINCT
		CASE 
			WHEN publishdate IS NULL THEN MIN(CAST(sysmodified AS DATE)) ELSE PublishDate END AS PublishDate,
				CASE 
			WHEN publishdate IS NULL THEN 'Unpublished' ELSE 'Published' END AS [Event]
			,ID AS OAuthClientID

  From [raw].[HOST_CIG_OAuthClients]
--  WHERE ID='73D53B0E-7D0B-4D52-AF85-F9CF267D666A'
  GROUP BY publishdate,ID
  --order by ID
GO
