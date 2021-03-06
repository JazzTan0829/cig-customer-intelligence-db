USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[ErrorLog]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[ErrorLog]
GO
/****** Object:  Table [config].[ErrorLog]    Script Date: 24-sept.-18 14:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[ErrorLog](
	[Occurrence] [datetime] NULL,
	[ErrorProcedure] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ErrorMessage] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ErrorNumber] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorLine] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
