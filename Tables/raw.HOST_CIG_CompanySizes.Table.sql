USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_CompanySizes]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_CompanySizes]
GO
/****** Object:  Table [raw].[HOST_CIG_CompanySizes]    Script Date: 24-sept.-18 14:22:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_CompanySizes](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL,
	[syscreator] [uniqueidentifier] NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DescriptionTermID] [int] NULL,
	[EmployeeCountFrom] [int] NULL,
	[EmployeeCountTo] [int] NULL
) ON [PRIMARY]
GO
