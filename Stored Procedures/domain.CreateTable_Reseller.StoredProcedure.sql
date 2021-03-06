USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Reseller]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Reseller]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Reseller]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_Reseller]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.Reseller', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.Reseller

CREATE TABLE CustomerIntelligence.domain.Reseller
(	
	Environment  NCHAR(3) NOT NULL,
	ResellerCode NVARCHAR(18) NOT NULL,
	ResellerName NVARCHAR(50) NULL,
)

CREATE CLUSTERED INDEX ResellerCode ON Reseller (Environment, ResellerCode)

END
GO
