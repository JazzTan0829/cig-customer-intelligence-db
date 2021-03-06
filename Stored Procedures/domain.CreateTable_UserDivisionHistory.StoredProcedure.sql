USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_UserDivisionHistory]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_UserDivisionHistory]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_UserDivisionHistory]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 09/09/2016
-- Description:	This procedure drops the previous version of the Divisions table and rebuilds it. 
--				The Division field in the raw table is renamed DivisionCode in the raw table.
-- =====================================================================================================================================================================


CREATE PROCEDURE [domain].[CreateTable_UserDivisionHistory]

AS
BEGIN

IF OBJECT_ID (N'CustomerIntelligence.domain.CreateTable_UserDivisionHistory', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.CreateTable_UserDivisionHistory

CREATE TABLE CustomerIntelligence.domain.UserDivisionHistory
(
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[DivisionCode] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL 
)

END
GO
