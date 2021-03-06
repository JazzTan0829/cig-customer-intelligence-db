USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[HOST_CIG_OAuthClients]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[HOST_CIG_OAuthClients]
GO
/****** Object:  Table [raw].[HOST_CIG_OAuthClients]    Script Date: 24-sept.-18 14:22:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[HOST_CIG_OAuthClients](
	[ID] [uniqueidentifier] NOT NULL,
	[Account] [uniqueidentifier] NULL,
	[DescriptionTermID] [int] NULL,
	[Description] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ApplicationName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Logo] [varbinary](max) NULL,
	[Type] [smallint] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[ReturnUrl] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[syscreated] [datetime] NOT NULL,
	[syscreator] [uniqueidentifier] NULL,
	[sysmodified] [datetime] NOT NULL,
	[sysmodifier] [uniqueidentifier] NULL,
	[LogoFileName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrivilegedAccess] [tinyint] NOT NULL,
	[PublishDate] [date] NULL,
	[AllowResourceOwnerFlow] [tinyint] NOT NULL,
	[Category] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGProcessed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
