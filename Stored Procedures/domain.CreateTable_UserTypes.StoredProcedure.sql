USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_UserTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_UserTypes]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_UserTypes]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 09/09/2016
-- Description:	This procedure drops the previous version of the domain.UserTypes table and rebuilds it. 
--				The domain.UserTypes table contains a slightly modified version of the raw Divisions table from EOL. See the column name changes below.
-- =====================================================================================================================================================================


CREATE PROCEDURE [domain].[CreateTable_UserTypes]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.UserTypes', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.UserTypes

CREATE TABLE CustomerIntelligence.domain.UserTypes
(						
	[UserTypeID] [uniqueidentifier] NOT NULL,					-- Field called ID in raw table
	[UserTypeCode] [nvarchar](10) NOT NULL,						-- Field called Code in raw table
	[UserTypeDescription] [nvarchar](60) NOT NULL,				-- Field called Description in raw table
	[UserTypeDescriptionTermId] [int] NULL,						-- Field called DescriptionTermId in raw table
	[Item] [uniqueidentifier] NOT NULL,
	[StartPage] [smallint] NULL,
	[PortalMenu] [nvarchar](60) NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[GettingStartedPage] [smallint] NULL ,
	[Environment] [NCHAR](3) NOT NULL,	
	[CIGCopyTime] [datetime] NULL 
)

CREATE CLUSTERED INDEX IX_Environment_UserTypeID ON CustomerIntelligence.domain.UserTypes (UserTypeID)

END
GO
