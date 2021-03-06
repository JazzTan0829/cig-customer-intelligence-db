USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_CancellationRequest]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_CancellationRequest]
GO
/****** Object:  Table [domain].[Requests_CancellationRequest]    Script Date: 24-sept.-18 14:21:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_CancellationRequest](
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
	[Trial?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Full cancellation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[-] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel administrations] [int] NULL,
	[Cancel users] [int] NULL,
	[View user] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel budget] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel cost analysis] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel currency] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel invoice] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancel activa] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reason cancellation] [int] NULL,
	[Internal reason cancellation] [int] NULL,
	[Migrated to] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Rollback cancellation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Confirmation cancellation sent?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Confirmation cancellation] [uniqueidentifier] NULL,
	[Change per] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[# months collection] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Done] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classification 1] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classification 2] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classification 3] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Do not change] [date] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
