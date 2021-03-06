USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Marketing_BE_RourlartaAccountantsList_20180123]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Marketing_BE_RourlartaAccountantsList_20180123]
GO
/****** Object:  Table [raw].[Marketing_BE_RourlartaAccountantsList_20180123]    Script Date: 24-sept.-18 14:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Marketing_BE_RourlartaAccountantsList_20180123](
	[ENTERPRISE_NUM] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COMPANY_NAME_1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COMPANY_NAME_2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STREET] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NUMBER] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STREET + NUMMER] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[POSTAL_CODE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TOWN] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COUNTRY_CODE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COUNTRY] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COMPANY_LANGUAGE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FILE_TYPE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EMPLOYEE_CLASS_CODE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EMPLOYEE_CLASS] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LEGAL_FORM_CODE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LEGAL_FORM] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GENDER] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACTIVITY_CODE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ACTIVITY_SHORT] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PHONE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DONOTCALLME] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FAX] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URL] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EMAIL] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MANAGER_LASTNAME] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MANAGER_FIRSTNAME] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MANAGER_FUNCTION_CODE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MANAGER_FUNCTION] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MANAGER_LANGUAGE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MANAGER_GENDER_CODE] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MANAGER_GENDER] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MANAGER_EMAIL] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COMMENT] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
