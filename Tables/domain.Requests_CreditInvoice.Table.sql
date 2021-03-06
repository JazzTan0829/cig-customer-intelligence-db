USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_CreditInvoice]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_CreditInvoice]
GO
/****** Object:  Table [domain].[Requests_CreditInvoice]    Script Date: 24-sept.-18 14:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_CreditInvoice](
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
	[Entry information] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Original invoice number] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Original invoice date] [date] NULL,
	[Credit invoice date] [date] NULL,
	[Original invoice blocked] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reason] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Related account] [uniqueidentifier] NULL,
	[Related request] [uniqueidentifier] NULL,
	[Realize information] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Credit invoice number] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New debit invoice number] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Process information] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Revenue category] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
