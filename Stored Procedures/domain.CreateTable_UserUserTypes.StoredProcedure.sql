USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_UserUserTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_UserUserTypes]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_UserUserTypes]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 30/09/2016
-- Description:	This procedure drops the previous version of the UserUserTypes table and rebuilds it. 
--				The domain.UserUserTypes table contains a slightly modified version of the raw Users table from EOL. 
-- =====================================================================================================================================================================

CREATE PROCEDURE [domain].[CreateTable_UserUserTypes]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.UserUserTypes', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.[domain].UserUserTypes

CREATE TABLE CustomerIntelligence.[domain].UserUserTypes
(
	[UserID] [uniqueidentifier] NOT NULL,
	[UserTypeID] [uniqueidentifier] NOT NULL,				-- Field called UserType in raw table
	[Environment] [nchar](3) NULL,							
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[InvoiceAccount] [uniqueidentifier] NULL,
	[InvoicedUntil] [date] NULL	,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,	
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL

)

CREATE CLUSTERED INDEX IX_UserID ON CustomerIntelligence.[domain].UserUserTypes (UserID) ; 

END
GO
