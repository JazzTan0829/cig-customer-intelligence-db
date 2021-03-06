USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_SubSectors]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_SubSectors]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_SubSectors]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_SubSectors]

AS
BEGIN

-- =========================================================
-- Author:		Alex Green
-- Create date: 1-12-2015
-- Description:	Loads the SubSectors Accounts support table
-- =========================================================

IF OBJECT_ID (N'CustomerIntelligence.domain.SubSectors', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.SubSectors

CREATE TABLE CustomerIntelligence.domain.SubSectors
(	
	Environment  NCHAR(3) NOT NULL,
	SubSectorCode NVARCHAR(10) NOT NULL,
	SubSectorDescription NVARCHAR(150) NULL,
)

CREATE CLUSTERED INDEX SubSectorCode ON SubSectors(Environment, SubSectorCode)

END
GO
