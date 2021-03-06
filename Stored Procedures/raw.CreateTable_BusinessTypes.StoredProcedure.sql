USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[CreateTable_BusinessTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[CreateTable_BusinessTypes]
GO
/****** Object:  StoredProcedure [raw].[CreateTable_BusinessTypes]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [raw].[CreateTable_BusinessTypes]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.raw.BusinessTypes', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.raw.BusinessTypes

CREATE TABLE raw.BusinessTypes
	(
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermID] [int] NULL,
	[Country] [nchar](3) NULL,
	[ShortDescription] [nvarchar](60) NULL,
	[ShortDescriptionTermID] [int] NULL
	)

END
GO
