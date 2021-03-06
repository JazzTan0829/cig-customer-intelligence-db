USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_ExecuteTransferRequest]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_ExecuteTransferRequest]
GO
/****** Object:  Table [domain].[Requests_ExecuteTransferRequest]    Script Date: 24-sept.-18 14:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_ExecuteTransferRequest](
	[RequestID] [uniqueidentifier] NULL,
	[Created] [datetime] NULL,
	[Realized] [datetime] NULL,
	[Status] [int] NULL,
	[HID] [int] NULL,
	[TypeDescription] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RequestComments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExistingAccountID] [uniqueidentifier] NULL,
	[NewAccountID] [uniqueidentifier] NULL,
	[ContactID] [uniqueidentifier] NULL,
	[RelatedRequest] [uniqueidentifier] NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
