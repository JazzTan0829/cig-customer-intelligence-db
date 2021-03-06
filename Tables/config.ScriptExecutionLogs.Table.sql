USE [CustomerIntelligence]
GO
/****** Object:  Table [config].[ScriptExecutionLogs]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [config].[ScriptExecutionLogs]
GO
/****** Object:  Table [config].[ScriptExecutionLogs]    Script Date: 24-sept.-18 14:21:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[ScriptExecutionLogs](
	[Guid] [uniqueidentifier] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[UserName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ScriptName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Arguments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [int] NOT NULL,
	[CompletionTimestamp] [datetime] NULL,
	[Result] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_config.ScriptExecutionLogs] PRIMARY KEY CLUSTERED 
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
