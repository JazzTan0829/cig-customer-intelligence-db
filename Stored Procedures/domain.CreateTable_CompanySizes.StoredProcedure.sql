USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CompanySizes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_CompanySizes]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_CompanySizes]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_CompanySizes]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.CompanySizes', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.CompanySizes

CREATE TABLE domain.CompanySizes
	(	
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[Description] [nvarchar](60) NULL,
	[DescriptionTermID] [int] NULL,
	[EmployeeCountFrom] [int] NULL,
	[EmployeeCountTo] [int] NULL
	)
END
GO
