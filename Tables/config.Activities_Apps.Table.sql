USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[Activities_Apps]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[Activities_Apps]
GO
/****** Object:  Table [config].[Activities_Apps]    Script Date: 24-sept.-18 14:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[Activities_Apps](
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastUpdatedMonth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sequence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
