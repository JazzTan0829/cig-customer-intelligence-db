USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Persons]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Persons]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Persons]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 09/09/2016
-- Description:	This procedure drops the previous version of the Persons table and rebuilds it. 
--				The domain.Persons table contains a slightly modified version of the raw Persons table from EOL. For example: the Person field is renamed PersonID,
--				the Account field is renamed AccountID and some fields from the raw table are not included.
-- =====================================================================================================================================================================


CREATE PROCEDURE [domain].[CreateTable_Persons]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.Persons', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.Persons

CREATE TABLE CustomerIntelligence.domain.Persons
(
	[Environment] nchar(3) NOT NULL ,								-- This field is called Source in the raw table
	[PersonID] [uniqueidentifier] NOT NULL,
	--[HID] [int] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,						-- Field is called Customer in the raw table
	[FullName] [nvarchar](128) NOT NULL,
	[NameComposition] [smallint] NOT NULL,
	[LastName] [nvarchar](64) NULL,
	[FirstName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](30) NULL,
	[Initials] [nchar](10) NULL,
	[Title] [nchar](4) NULL,
	[Country] [nchar](3) NULL,
	[Language] [nchar](10) NULL,
	[JobTitleDescription] [nvarchar](60) NULL,
	--[Longitude] [float] NULL,
	--[Latitude] [float] NULL,
	--[AddressLine3] [nvarchar](60) NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL ,
	[CIGCopyTime] [datetime] NULL
)

END

CREATE CLUSTERED INDEX IX_PersonID ON CustomerIntelligence.[domain].Persons (PersonID) ; 
GO
