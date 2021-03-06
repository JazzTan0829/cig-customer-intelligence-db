USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AccountsContract_Summary]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_AccountsContract_Summary]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AccountsContract_Summary]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================================================
-- Author:		Alex Green (based on original script by Ronald Dahne)
-- Create date: 25-11-2015
-- Description:	Creates the AccountsContract_Summary table.
-- ===================================================================================================

CREATE PROCEDURE [domain].[CreateTable_AccountsContract_Summary]

AS
BEGIN

IF OBJECT_ID (N'AccountsContract_Summary', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.AccountsContract_Summary

CREATE TABLE CustomerIntelligence.domain.AccountsContract_Summary
(
	[AccountID] [uniqueidentifier],
	[Environment] [nchar](3) NOT NULL ,
	[AccountCode] [nvarchar](18) NOT NULL ,
	[HadTrial] [integer] NULL,
	[FirstTrialStartDate] [date] NULL ,	
	[FirstTrialPackage]  [nvarchar](30) NULL , 	
	[FirstTrialFinalDate] [date] NULL ,
	[LatestTrialPackage] [nvarchar](30) NULL,
	[LatestTrialStartDate] [date] NULL,
	[LatestTrialFinalDate] [date] NULL,
	[HadCommContract] [integer] NULL,
	[FirstCommStartDate] [date] NULL ,	
	[FirstCommPackage]  [nvarchar](30) NULL ,
	[FirstCommFinalDate] [date] NULL, 
	[LatestCommPackage] [nvarchar](30) NULL,
	[LatestCommStartDate] [date] NULL,
	[LatestCommFinalDate] [date] NULL,
	[CommLifetimeMonths] [integer] NULL,
	[LatestMRR] [integer] NULL,
	[LatestNumberOfAvailableAdmins] [integer] NULL,
	[LatestNumberOfArchivedAdmins] [integer] NULL,	
	[LatestNumberOfUsers]	[integer] NULL,	
	[LatestNumberPayingUsers]	[integer] NULL,	
	[LatestNumberFreeUsers]	[integer] NULL,	
	[AccountantLinked] [int] NULL,
	[DateFirstLinkedToAccountant] [date] NULL ,
	[RequestedFullCancellation] [integer] NULL,
	[FullCancellationRequestDate] [date] NULL,
	[Churned] [int] NULL
)
CREATE CLUSTERED INDEX AccountCode ON domain.AccountsContract_Summary (Environment, AccountCode)

END
GO
