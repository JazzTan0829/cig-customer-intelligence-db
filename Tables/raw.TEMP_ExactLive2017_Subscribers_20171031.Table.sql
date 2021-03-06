/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4451)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[TEMP_ExactLive2017_Subscribers_20171031]    Script Date: 30/01/2018 11:59:01 ******/
DROP TABLE IF EXISTS [raw].[TEMP_ExactLive2017_Subscribers_20171031]
GO
/****** Object:  Table [raw].[TEMP_ExactLive2017_Subscribers_20171031]    Script Date: 30/01/2018 11:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[TEMP_ExactLive2017_Subscribers_20171031]') AND type in (N'U'))
BEGIN
CREATE TABLE [raw].[TEMP_ExactLive2017_Subscribers_20171031](
	[ContactID] [float] NULL,
	[Account] [float] NULL,
	[Email Address] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Company] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gender] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[First and Last Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Business Phone] [float] NULL,
	[Accountmanager] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accountchannel] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reseller] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Resellercode] [float] NULL,
	[Sector] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Company Size] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BS-CS] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accountant_yn] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product BS] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Morning Session Construction] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Morning Session Production] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Morning Session Professional Services] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NS] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Segment] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Segment_BS] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type Accountant] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
