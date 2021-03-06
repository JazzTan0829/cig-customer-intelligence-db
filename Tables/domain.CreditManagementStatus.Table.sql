USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[CreditManagementStatus]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[CreditManagementStatus]
GO
/****** Object:  Table [domain].[CreditManagementStatus]    Script Date: 24-sept.-18 14:21:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[CreditManagementStatus](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DescriptionTermID] [int] NULL,
	[Division] [int] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
