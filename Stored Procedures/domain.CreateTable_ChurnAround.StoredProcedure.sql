USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ChurnAround]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ChurnAround]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ChurnAround]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 25-11-2015
-- Description:	ChurnAround Create Table
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_ChurnAround] 

AS
IF OBJECT_ID (N'ChurnAround', N'U') IS NOT NULL 
DROP TABLE ChurnAround

CREATE TABLE [domain].[ChurnAround](
	[Environment] nchar(3) Not Null,
	[RequestID] nvarchar(30) Null,
	[AccountCode] nvarchar(30) Null,
	[Description] nvarchar(max) Null,
	[Reasons1] int Null,
	[Reasons2] int Null,
	[Reasons3] int Null,
	[Created] datetime Null
	)

CREATE CLUSTERED INDEX Created ON ChurnAround (Created)
CREATE INDEX EnvironmentAccount ON ChurnAround (Environment, AccountCode)
GO
