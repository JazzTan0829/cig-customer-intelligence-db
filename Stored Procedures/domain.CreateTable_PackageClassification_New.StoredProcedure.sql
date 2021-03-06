USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_PackageClassification_New]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_PackageClassification_New]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_PackageClassification_New]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 31-03-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_PackageClassification_New] 
	-- Add the parameters for the stored procedure here
	@p1 int = 0, 
	@p2 int = 0
AS
BEGIN
CREATE TABLE domain.PackageClassification_New
(
Environment nchar(3) NOT NULL
, PackageCode nvarchar(50) NOT NULL
, Edition nvarchar(18) NOT NULL
, Product nvarchar(30) NOT NULL
, Solution nvarchar(18) NOT NULL
)
END
GO
