USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[AppBillingProposal]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[AppBillingProposal]
GO
/****** Object:  Table [domain].[AppBillingProposal]    Script Date: 24-sept.-18 14:21:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[AppBillingProposal](
	[App] [uniqueidentifier] NULL,
	[AppName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Partner] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartnerCode] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartnerName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[NumberOfCompanies] [int] NULL,
	[Item] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemCode] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemDescription] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemPrice] [float] NULL,
	[Amount] [float] NULL,
	[InvoiceDate] [datetime2](7) NULL,
	[Environment] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[META_SOURCE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[META_LOAD_STARTDTS] [datetime] NOT NULL,
	[META_LOAD_ENDDTS] [datetime] NULL,
	[META_PROCESSID] [int] NOT NULL,
	[META_LASTUPDATEPROCESSID] [int] NOT NULL,
	[META_ISDELETED] [bit] NOT NULL,
	[META_HASH] [int] NOT NULL
) ON [PRIMARY]
GO
