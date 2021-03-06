USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Accountants]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Accountants]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Accountants]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [domain].[CreateTable_Accountants]

AS
BEGIN

-- =========================================================================
-- Author:		Alex Green
-- Create date: 03-12-2015
-- Description:	Creates the Accountants Accounts support table
-- =========================================================================

IF OBJECT_ID (N'CustomerIntelligence.domain.Accountants', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.Accountants

CREATE TABLE CustomerIntelligence.domain.Accountants
(	
	Environment NCHAR(3)  NOT NULL,
	AccountantCode NVARCHAR(18) NOT NULL,
	AccountantName NVARCHAR(50) NULL
)

CREATE CLUSTERED INDEX AccountantCode ON Accountants (Environment, AccountantCode)

END
GO
