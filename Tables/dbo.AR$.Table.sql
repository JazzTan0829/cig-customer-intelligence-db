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
/****** Object:  Table [dbo].[AR$]    Script Date: 30/01/2018 11:59:01 ******/
DROP TABLE IF EXISTS [dbo].[AR$]
GO
/****** Object:  Table [dbo].[AR$]    Script Date: 30/01/2018 11:59:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AR$]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AR$](
	[Country] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Code] [float] NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Not overdue] [float] NULL,
	[1 - 30] [float] NULL,
	[31 - 60] [float] NULL,
	[61 - 90] [float] NULL,
	[91 - 120] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[121 - 180] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[181 - 365] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[> 365] [float] NULL,
	[Outstanding] [float] NULL,
	[Average] [float] NULL
) ON [PRIMARY]
END
GO
