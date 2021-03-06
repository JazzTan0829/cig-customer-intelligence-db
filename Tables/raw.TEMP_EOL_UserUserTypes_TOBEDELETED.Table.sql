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
/****** Object:  Table [raw].[TEMP_EOL_UserUserTypes_TOBEDELETED]    Script Date: 30/01/2018 11:59:01 ******/
DROP TABLE IF EXISTS [raw].[TEMP_EOL_UserUserTypes_TOBEDELETED]
GO
/****** Object:  Table [raw].[TEMP_EOL_UserUserTypes_TOBEDELETED]    Script Date: 30/01/2018 11:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[TEMP_EOL_UserUserTypes_TOBEDELETED]') AND type in (N'U'))
BEGIN
CREATE TABLE [raw].[TEMP_EOL_UserUserTypes_TOBEDELETED](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[UserType] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Source] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[syscreator] [uniqueidentifier] NULL,
	[EndDate] [datetime] NULL,
	[InvoiceAccount] [uniqueidentifier] NULL,
	[InvoicedUntil] [date] NULL
) ON [PRIMARY]
END
GO
