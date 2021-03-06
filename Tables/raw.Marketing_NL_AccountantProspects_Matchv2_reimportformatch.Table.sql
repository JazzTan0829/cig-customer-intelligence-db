USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Marketing_NL_AccountantProspects_Matchv2_reimportformatch]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Marketing_NL_AccountantProspects_Matchv2_reimportformatch]
GO
/****** Object:  Table [raw].[Marketing_NL_AccountantProspects_Matchv2_reimportformatch]    Script Date: 24-sept.-18 14:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Marketing_NL_AccountantProspects_Matchv2_reimportformatch](
	[ID] [uniqueidentifier] NULL,
	[Environment] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChamberOfCommerce] [float] NULL,
	[HKeyTelemarketingAgency] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Street] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StreetNumber] [float] NULL,
	[StreetNumberExtension] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Postcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TradingAddress] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TradingAdressStreet] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TradingsAddressStreetNumber] [float] NULL,
	[TradingAddressStreetNumberExtension] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TradingAddressPostcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TradingAddressCity] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessPhoneNumber] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessPhoneNumber_DNC] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobilePhoneNumber] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobilePhoneNumber_DNC] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DoNotCall] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanySize] [float] NULL,
	[IntergrationDate] [datetime] NULL,
	[CreditRating] [float] NULL,
	[CreditLimit] [float] NULL,
	[Revenue] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessTypeDescription] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessCode] [float] NULL,
	[AccountancyTypeDescription] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessStatus] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URL] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName3] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName3] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName4] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName4] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName5] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName5] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EstablishmentNumber] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RSIN] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LegalCode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StarterIndicator] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuthorizedOfficial] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuthorizedOfficialGender] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuthorizedOfficialLanguage] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CoropAreaPrimary] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AffiliateIndicator] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EOL_AccountCode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatchedCustomerAddress] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatchedCustomerPostcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatchType] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Confidence] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MatchedCustomerName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LatestCommPackage] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
