USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Marketing_AccountancyProspects_NL_Match20170215]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Marketing_AccountancyProspects_NL_Match20170215]
GO
/****** Object:  Table [raw].[Marketing_AccountancyProspects_NL_Match20170215]    Script Date: 24-sept.-18 14:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Marketing_AccountancyProspects_NL_Match20170215](
	[RowID] [float] NULL,
	[ID] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mar_Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mar_Address] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mar_Street] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mar_Number] [float] NULL,
	[Mar_Postcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mar_Phone] [float] NULL,
	[Mar_City] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mar_Coc] [float] NULL,
	[Mar_TradPostcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOL_AccountCode] [float] NULL,
	[EOL_Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOL_Adress] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOL_Street] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOL_Number] [float] NULL,
	[EOL_Postcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOL_Phone] [float] NULL,
	[EOL_City] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOL_Coc] [float] NULL,
	[MatchType] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Confidence] [float] NULL,
	[Priority] [float] NULL,
	[MatchNr] [float] NULL
) ON [PRIMARY]
GO
