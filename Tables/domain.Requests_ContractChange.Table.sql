USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_ContractChange]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_ContractChange]
GO
/****** Object:  Table [domain].[Requests_ContractChange]    Script Date: 24-sept.-18 14:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_ContractChange](
	[RequestID] [uniqueidentifier] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Realized] [datetime] NULL,
	[Approved] [datetime] NULL,
	[StatusChanged] [datetime] NULL,
	[Status] [int] NULL,
	[HID] [int] NULL,
	[TypeDescription] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [uniqueidentifier] NULL,
	[ContactID] [uniqueidentifier] NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RequestComments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WorkflowComments] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reason] [int] NULL,
	[Old package] [uniqueidentifier] NULL,
	[New package] [uniqueidentifier] NULL,
	[New contract number] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Done] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date of change] [date] NULL,
	[Next action date] [date] NULL,
	[Classification 1] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classification 2] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classification 3] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
