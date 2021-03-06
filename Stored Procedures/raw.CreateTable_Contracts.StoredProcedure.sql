USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[CreateTable_Contracts]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[CreateTable_Contracts]
GO
/****** Object:  StoredProcedure [raw].[CreateTable_Contracts]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 03-04-2017
-- Description:	
-- =============================================
CREATE PROCEDURE [raw].[CreateTable_Contracts]
AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.raw.Contracts', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.raw.Contracts

CREATE TABLE raw.Contracts
	(
	[ID] [uniqueidentifier] NOT NULL,
	[Number] [nvarchar](30) NOT NULL,
	[Account] [uniqueidentifier] NOT NULL,
	[Type] [nchar](1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ContractEvent] [nvarchar](3) NULL,
	[EndDate] [datetime] NULL,
	[FinalDate] [datetime] NULL,
	[CancellationDate] [datetime] NULL,
	[CancellationEvent] [nvarchar](3) NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) NULL,
	[CIGProcessed] [bit] NULL,
	[TimeUnit] [nchar](2) NULL,
	[syscreated] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NULL,
	[sysmodifier] [uniqueidentifier] NULL
	)
END
GO
