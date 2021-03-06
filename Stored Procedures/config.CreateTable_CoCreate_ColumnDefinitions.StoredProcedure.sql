USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[CreateTable_CoCreate_ColumnDefinitions]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[CreateTable_CoCreate_ColumnDefinitions]
GO
/****** Object:  StoredProcedure [config].[CreateTable_CoCreate_ColumnDefinitions]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [config].[CreateTable_CoCreate_ColumnDefinitions] 

AS
BEGIN

-- =============================================
-- Author:		Tommaso Magherini
-- Create date: 2016-03-31
-- Description:	Creation of the table of CoCreate column definitions
-- =============================================


IF OBJECT_ID (N'CoCreate_ColumnDefinitions ', N'U') IS NOT NULL 
DROP TABLE CoCreate_ColumnDefinitions

CREATE TABLE [config].[CoCreate_ColumnDefinitions] 
(
VerintColumnID  nvarchar(255)  NOT NULL,
MeasureGroup  nvarchar(max)   NULL,
Measure  nvarchar(max)   NULL,
AdditionalInformation  nvarchar(max)   NULL,
)
END
GO
