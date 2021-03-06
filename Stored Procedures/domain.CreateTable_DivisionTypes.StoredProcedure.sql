USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DivisionTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_DivisionTypes]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DivisionTypes]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_DivisionTypes]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.DivisionTypes', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.DivisionTypes

CREATE TABLE domain.DivisionTypes
	(
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[DescriptionTermId] [int] NULL,
	[Item] [uniqueidentifier] NOT NULL,
	[Modules] [bigint] NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[Environment] nchar(3) NOT NULL
	)

END
GO
