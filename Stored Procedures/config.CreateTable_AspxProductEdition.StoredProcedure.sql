USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[CreateTable_AspxProductEdition]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[CreateTable_AspxProductEdition]
GO
/****** Object:  StoredProcedure [config].[CreateTable_AspxProductEdition]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 12-04-2016
-- Description:	Create Table aspx product edition
-- =============================================
CREATE PROCEDURE [config].[CreateTable_AspxProductEdition] 

AS
BEGIN
IF OBJECT_ID (N'AspxProductEdition', N'U') IS NOT NULL 
DROP TABLE AspxProductEdition

CREATE TABLE [config].AspxProductEdition(
	ActivityID int Not Null,
	Aspx nvarchar(60) Not Null,
	Product nvarchar(30) Null,
	Edition nvarchar(30) Null,)
END
GO
