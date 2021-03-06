USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Divisions_VATReturn]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Divisions_VATReturn]
GO
/****** Object:  View [domain].[Divisions_VATReturn]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [domain].[Divisions_VATReturn]
AS

-- DESCRIPTION: Includes the date for each DivisionStatistics_DailyChange record where the SourceVATReturn value is greater than  0. This is the assumed date of a finalized VAT return.
-- CREATED BY: Alex Green
-- DATE CREATED: 15 Dec 2017

SELECT 
	Environment
	, DivisionCode
	, [Date] AS VATReturnDate
FROM domain.DivisionStatistics_DailyChanges
WHERE SourceVATReturn > 0

GO
