USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_SalesHandoverDocument]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_SalesHandoverDocument]
GO
/****** Object:  StoredProcedure [domain].[Load_SalesHandoverDocument]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================================================================================================
-- Author:		Alex Green
-- Create date: 2018-05-28
-- Description: Builds the domain table for the Sales Handover document type
-- =======================================================================================================================================
CREATE PROCEDURE [domain].[Load_SalesHandoverDocument]
AS
BEGIN

TRUNCATE TABLE domain.SalesHandoverDocument

INSERT INTO domain.SalesHandoverDocument
(
	DocumentID
	, HID
	, [Subject]
	, AccountID
	, [UserID]
	, ContactID
	, ItemID
	, OwnerID
	, [OwnerType]
	, [Status] 
	, [Language] 
	, [StartDate] 
	, [EndDate] 
	, [Source] 
	, [syscreated] 
	, [syscreator] 
	, [sysmodified] 
	, [sysmodifier] 
)

SELECT
	ID AS DocumentID
	, HID
	, [Subject]
	, [Account] AS AccountID
	, [UserID]
	, [Contact] AS ContactID
	, [Item] AS ItemID
	, [Owner] AS OwnerID
	, [OwnerType]
	, [Status] 
	, [Language] 
	, [StartDate] 
	, [EndDate] 
	, [Source] 
	, [syscreated] 
	, [syscreator] 
	, [sysmodified] 
	, [sysmodifier] 
FROM
	(
		SELECT *, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC, sysmodified DESC) AS RowNum  -- Takes the latest record based on sysmodified
		FROM [raw].[HOST_CIG_Documents]
		WHERE [Type] = '193'   -- The Sales Handover document type
	) AS SQ
WHERE RowNum = 1

END
GO
