USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Users]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Users]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Users]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 09/09/2016
-- Description:	This procedure drops the previous version of the Users table and rebuilds it. 
--				The domain.Users table contains a slightly modified version of the raw Users table from EOL. 
-- =====================================================================================================================================================================

CREATE PROCEDURE [domain].[CreateTable_Users]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.Users', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.[domain].Users

CREATE TABLE CustomerIntelligence.[domain].Users
(
	[UserID] [uniqueidentifier] NOT NULL,							-- Field named ID in raw table
	[HID] [int] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,						-- Field named Customer in raw table
	[PersonID] [uniqueidentifier] NOT NULL,							-- Field named Person in raw table
	--[UserName] [nvarchar](60) NOT NULL,
	[Environment] nchar(3) NOT NULL ,								-- This field is called Source in the raw table
	[FullName] [nvarchar](128) NOT NULL,
	[Digipass] [uniqueidentifier] NULL,
	[AuthenticationType] [int] NOT NULL,
	[LockoutTime] [datetime] NULL,
	[LockoutAttempts] [int] NULL,
	[Blocked] [tinyint] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ValidationDate] [datetime] NULL,
	[ValidationID] [uniqueidentifier] NULL,
	[LastLogin] [datetime] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	--[timestamp] [timestamp] NOT NULL
	[CIGCopyTime] [datetime] NULL
)

CREATE CLUSTERED INDEX IX_UserID ON CustomerIntelligence.[domain].Users (UserID) ;

END 
GO
