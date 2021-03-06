USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Units]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Units]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Units]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Units]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.Units', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.Units

CREATE TABLE domain.Units
	(
	[Type] [nchar](1) NOT NULL,
	[Active] [bit] NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[Division] [int] NOT NULL,
	[Code] [nchar](8) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[Main] [tinyint] NOT NULL,
	[LengthUnit] [nvarchar](10) NULL,
	[AreaUnit] [nvarchar](10) NULL,
	[VolumeUnit] [nvarchar](10) NULL,
	[WeightUnit] [nvarchar](10) NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermID] [int] NULL,
	[TimeUnit] [nchar](2) NULL
	)
END
GO
