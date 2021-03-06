USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[AppUsageLines]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[AppUsageLines]
GO
/****** Object:  Table [domain].[AppUsageLines]    Script Date: 24-sept.-18 14:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[AppUsageLines](
	[ID] [uniqueidentifier] NOT NULL,
	[OAuthClient] [uniqueidentifier] NOT NULL,
	[UsedOnDate] [date] NOT NULL,
	[UsedDivision] [int] NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[UserID] [uniqueidentifier] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY]
GO
