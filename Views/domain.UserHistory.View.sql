USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[UserHistory]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[UserHistory]
GO
/****** Object:  View [domain].[UserHistory]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [domain].[UserHistory]
AS

SELECT [ID]
      ,[HID]
      ,[UserName]
      ,[FullName]
      ,[Person]
      ,[Customer]
      ,[Blocked]
      ,[sysmodified]
      ,[AuthenticationType]
      ,[syscreated]
      ,[sysmodifier]
      ,[LockoutTime]
      ,[LockoutAttempts]
      ,[Environment]
      ,[StartDate]
      ,[EndDate]
      ,[ValidationDate]
      ,[ValidationID]
      ,[syscreator]
      ,[Digipass]
  FROM [CustomerIntelligence].[raw].[HOST_CIG_Users]
  GROUP BY [ID]
      ,[HID]
      ,[UserName]
      ,[FullName]
      ,[Person]
      ,[Customer]
      ,[Blocked]
      ,[sysmodified]
      ,[AuthenticationType]
      ,[syscreated]
      ,[sysmodifier]
      ,[LockoutTime]
      ,[LockoutAttempts]
      ,[Environment]
      ,[StartDate]
      ,[EndDate]
      ,[ValidationDate]
      ,[ValidationID]
      ,[syscreator]
      ,[Digipass]
GO
