USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_SupportCases]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_SupportCases]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_SupportCases]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===============================================================================================================
-- Author:		Alex Green
-- Create date: 22-12-2015
-- Description:	This creates the Support Case table based on all support requests in the ExportEOLRequests table
--				in ContractData.
--				A clustured index is created based on CreatedDate. A non-clustured index is created based on the 
--				combination of Environment, AccountCode, and Origin.
-- ===============================================================================================================


CREATE PROC [domain].[CreateTable_SupportCases] AS

                      
IF OBJECT_ID (N'SupportCases', N'U') IS NOT NULL 
DROP TABLE SupportCases

CREATE TABLE [domain].[SupportCases](
	[Environment] [nchar](3) NOT NULL,
	[RequestID] [int] NULL,
	[AccountCode] [nvarchar](30) NULL,
	[Description] [nvarchar](200) NULL,
	[Subject] [nvarchar](200) NULL,
	[Origin] [nvarchar](200) NULL,
	[CreatedDate][date] NULL,
	[CreatedDateTime] [datetime] NULL,
	[Approved] [datetime] NULL,
	[Realized] [datetime] NULL,
	[Status] [int]
)
CREATE CLUSTERED INDEX CreatedDate ON SupportCases (CreatedDate)
CREATE INDEX EnviroAccountOrigin ON SupportCases (Environment, AccountCode, Origin)
GO
