USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ContractEvents]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ContractEvents]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ContractEvents]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_ContractEvents]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.ContractEvents', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.ContractEvents

CREATE TABLE domain.ContractEvents
	(
	[ID] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](3) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL,
	[DescriptionTermId] [int] NULL,
	[CreationType] [int] NULL
	)
END
GO
