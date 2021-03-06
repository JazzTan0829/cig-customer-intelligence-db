USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AccountsClassifications]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_AccountsClassifications]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AccountsClassifications]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_AccountsClassifications]

AS
BEGIN

-- ========================================================================
-- Author:		Alex Green
-- Create date: 1-12-2015
-- Description:	Creates the AccountsClassifications Accounts support table
-- ========================================================================

IF OBJECT_ID (N'CustomerIntelligence.domain.AccountsClassifications', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.AccountsClassifications

CREATE TABLE CustomerIntelligence.domain.AccountsClassifications
(	
	Environment  NCHAR(3) NOT NULL,
	AccountClassificationCode NVARCHAR(3) NOT NULL,
	AccountClassificationDescription NVARCHAR(60) NULL,
)

CREATE CLUSTERED INDEX AccountClassificationCode ON AccountsClassifications (Environment, AccountClassificationCode)

END
GO
