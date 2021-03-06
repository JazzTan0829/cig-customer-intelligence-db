USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[SalesHandoverDocument]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[SalesHandoverDocument]
GO
/****** Object:  Table [domain].[SalesHandoverDocument]    Script Date: 24-sept.-18 14:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[SalesHandoverDocument](
	[DocumentID] [uniqueidentifier] NOT NULL,
	[HID] [int] NOT NULL,
	[Subject] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountID] [uniqueidentifier] NULL,
	[UserID] [uniqueidentifier] NULL,
	[ContactID] [uniqueidentifier] NULL,
	[ItemID] [uniqueidentifier] NULL,
	[OwnerID] [uniqueidentifier] NULL,
	[OwnerType] [smallint] NULL,
	[Status] [smallint] NOT NULL,
	[Language] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Source] [smallint] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
