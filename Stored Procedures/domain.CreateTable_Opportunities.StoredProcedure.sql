USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Opportunities]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Opportunities]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Opportunities]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================================================================================================
-- Author:		Alex Green
-- Create date: 13-10-2017
-- Description:	CreateTable Opportunities
-- =======================================================================================================================================
CREATE PROCEDURE [domain].[CreateTable_Opportunities] 
AS
IF OBJECT_ID (N'CustomerIntelligence.domain.Opportunities', N'U') IS NOT NULL 
DROP TABLE domain.Opportunities

CREATE TABLE [domain].[Opportunities]
(
	[ID] uniqueidentifier NOT NULL
	,[Environment] nvarchar(3) NOT NULL
    ,[AccountName] nvarchar(100) NULL
    ,[AccountCode] nvarchar(36) NULL
    ,[ActionDate] datetime NULL
    ,[AmountFC] float NULL
    ,[AmountDC] float NULL
    ,[CloseDate] datetime NULL
    ,[Created] datetime NULL
	,[Creator] uniqueidentifier NULL
    ,[Modified] datetime NULL
    ,[Currency] nvarchar(6) NULL
    ,[Name] nvarchar(150) NULL
	,[OpportunityStage] uniqueidentifier NULL
    ,[OpportunityStageDescription] nvarchar(120) NULL
    ,[OpportunityStatus] int NULL
    ,[Probability] float NULL
	,[Owner] uniqueidentifier NULL
    ,[OwnerFullName] nvarchar(100) NULL
    ,[RateFC] float NULL
	,[LeadSource] uniqueidentifier NULL
	,[LeadSourceDescription] nvarchar(60) NULL
	,[SalesType] uniqueidentifier NULL
    ,[SalesTypeDescription] nvarchar(120) NULL
	,[ReasonCode] uniqueidentifier NULL
    ,[ReasonCodeDescription] nvarchar(120) NULL
	,[Notes] nvarchar(max) NULL
	,[Project] uniqueidentifier NULL
    ,[ProjectCode] nvarchar(40) NULL
    ,[ProjectDescription] nvarchar(120) NULL
	,[Campaign] uniqueidentifier NULL
    ,[CampaignDescription] nvarchar(120) NULL
)

CREATE CLUSTERED INDEX EnviroAccountCode ON domain.Opportunities (Environment, AccountCode)
GO
