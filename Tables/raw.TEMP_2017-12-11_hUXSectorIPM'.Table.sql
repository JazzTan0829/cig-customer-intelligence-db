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
/****** Object:  Table [raw].[TEMP_2017-12-11_hUXSectorIPM']    Script Date: 30/01/2018 11:59:01 ******/
DROP TABLE IF EXISTS [raw].[TEMP_2017-12-11_hUXSectorIPM']
GO
/****** Object:  Table [raw].[TEMP_2017-12-11_hUXSectorIPM']    Script Date: 30/01/2018 11:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[TEMP_2017-12-11_hUXSectorIPM'']') AND type in (N'U'))
BEGIN
CREATE TABLE [raw].[TEMP_2017-12-11_hUXSectorIPM'](
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accountName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[segmentJoined] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[  fb_DashboardTemplates-timestamp] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[  fb_Datev-whatdoyouthink2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOL_Division] [float] NULL,
	[ValidatingSector_EmployeeNumber] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidatingSector_Sector] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidatingSector_Subsector] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidatingSector_SubsectorConstruction] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidatingSector_SubsectorFinance] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidatingSector_SubsectorGeneralServices] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidatingSector_SubsectorHospitality] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cityCode] [float] NULL,
	[demoCompany] [bit] NOT NULL,
	[earlyAccessPracticeManagment] [bit] NOT NULL,
	[language] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[legislation] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[select sector] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[select subsector] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[solutionName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[stuck] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[test1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[userType] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidatingSector_Sector2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidatingSector_Subsector2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValidatingSector_EmployeeNumber2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
