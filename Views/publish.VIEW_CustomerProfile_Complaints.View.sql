USE [CustomerIntelligence]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_Complaints]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [publish].[VIEW_CustomerProfile_Complaints]
GO
/****** Object:  View [publish].[VIEW_CustomerProfile_Complaints]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [publish].[VIEW_CustomerProfile_Complaints]
AS


SELECT
	CONCAT(Environment, AccountCode) AS EnviroAccountCode
	, HID
	, Created
	, Realised
	, Description
	, CONCAT('https://start.exactonline.', LOWER(RTRIM(Environment)), '/docs/WflRequest.aspx?BCAction=1&ID=%7b', LOWER(ID), '%7d&_Division_=1') AS Link
FROM 
	domain.Complaints
GO
