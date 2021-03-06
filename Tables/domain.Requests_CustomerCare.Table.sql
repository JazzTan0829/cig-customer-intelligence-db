USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_CustomerCare]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_CustomerCare]
GO
/****** Object:  Table [domain].[Requests_CustomerCare]    Script Date: 24-sept.-18 14:21:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_CustomerCare](
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
	[Subject] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Follow up by] [uniqueidentifier] NULL,
	[Next action date] [datetime] NULL,
	[NPS score] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NPS status] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Churn risk] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Training followed] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Complaint request] [uniqueidentifier] NULL,
	[Project] [uniqueidentifier] NULL,
	[Consultancy request] [uniqueidentifier] NULL,
	[Apps in use] [bit] NULL,
	[Responsible for sales at that time] [uniqueidentifier] NULL,
	[MRR value during call] [float] NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
