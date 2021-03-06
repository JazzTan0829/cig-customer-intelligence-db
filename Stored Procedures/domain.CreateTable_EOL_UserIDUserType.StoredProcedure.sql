USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_EOL_UserIDUserType]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_EOL_UserIDUserType]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_EOL_UserIDUserType]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 16-06-16
-- Description:	Create Table linking UserID to AccountID
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_EOL_UserIDUserType] 

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.dbo.EOL_UserIDUserType', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.dbo.EOL_UserIDUserType
CREATE TABLE EOL_UserIDUserType
(
UserID uniqueidentifier,
UserTypeCode nvarchar(50),
UserTypeDescription nvarchar(100),
UserTypeStartDate Datetime,
UserTypeEndDate Datetime,
Environment nvarchar(3)
)
END
GO
