USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_ConversionRequest]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_ConversionRequest]
GO
/****** Object:  Table [domain].[Requests_ConversionRequest]    Script Date: 24-sept.-18 14:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_ConversionRequest](
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
	[Deliver the backup?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Conversion form] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Only master data?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BU received] [date] NULL,
	[BU placed] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number of administrations] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number of administrations converted] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Conversion done by] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Payment] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Costs] [int] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
