USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_SupportCases]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_CustomerProfile_SupportCases]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_SupportCases]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_CustomerProfile_SupportCases]
AS


SELECT
	 CONCAT(Environment, AccountCode) AS EnviroAccountCode
	, Environment
	, AccountCode
	, RequestID AS [Case Number]
	, [Origin]
	, [Opened Date]
	, [Closed Date]
	, [Main Reason]
	, [Sub Reason]
FROM	
	[raw].SupportSalesForce
WHERE ISNUMERIC(AccountCode) <> 0	-- Excludes non-numeric values that appear in the AccountCode raw data
GO
