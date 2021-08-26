USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Marketing_AccountantProspects_20180206_BusinessPhoneDNC_Update]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Marketing_AccountantProspects_20180206_BusinessPhoneDNC_Update]
GO
/****** Object:  Table [raw].[Marketing_AccountantProspects_20180206_BusinessPhoneDNC_Update]    Script Date: 24-sept.-18 14:22:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Marketing_AccountantProspects_20180206_BusinessPhoneDNC_Update](
	[Do Not Call Me Flag should be set to YES] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessPhoneCounter_MOD] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
