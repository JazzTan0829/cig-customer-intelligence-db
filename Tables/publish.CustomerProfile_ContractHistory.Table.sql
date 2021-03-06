USE [CustomerIntelligence]
GO
/****** Object:  Table [publish].[CustomerProfile_ContractHistory]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [publish].[CustomerProfile_ContractHistory]
GO
/****** Object:  Table [publish].[CustomerProfile_ContractHistory]    Script Date: 24-sept.-18 14:21:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [publish].[CustomerProfile_ContractHistory](
	[AccountID] [uniqueidentifier] NULL,
	[EventDate] [date] NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LinePackage] [int] NULL,
	[SumMRR] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
