USE [CustomerIntelligence]
GO
/****** Object:  Index [EnviroPackage]    Script Date: 24-sept.-18 14:20:58 ******/
DROP INDEX IF EXISTS [EnviroPackage] ON [domain].[PackageClassification] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [domain].[PackageClassification]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[PackageClassification]
GO
/****** Object:  Table [domain].[PackageClassification]    Script Date: 24-sept.-18 14:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[PackageClassification](
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PackageCode] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Edition] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Solution] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankLinkFunctionality] [int] NULL,
	[SalesInvoiceFunctionality] [int] NULL
) ON [Domain]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EnviroPackage]    Script Date: 24-sept.-18 14:21:32 ******/
CREATE CLUSTERED INDEX [EnviroPackage] ON [domain].[PackageClassification]
(
	[Environment] ASC,
	[PackageCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Domain]
GO
