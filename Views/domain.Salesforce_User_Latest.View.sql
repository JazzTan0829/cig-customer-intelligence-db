USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Salesforce_User_Latest]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Salesforce_User_Latest]
GO
/****** Object:  View [domain].[Salesforce_User_Latest]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [domain].[Salesforce_User_Latest] 
AS 
SELECT *
From raw.[Salesforce_User_Latest] 
GO
