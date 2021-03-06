USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[Requests_DefinitiefAbonnement]    Script Date: 24-sept.-18 14:20:58 ******/
DROP TABLE IF EXISTS [domain].[Requests_DefinitiefAbonnement]
GO
/****** Object:  Table [domain].[Requests_DefinitiefAbonnement]    Script Date: 24-sept.-18 14:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [domain].[Requests_DefinitiefAbonnement](
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
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Soort Contract] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accountant?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Proef => vast!] [int] NULL,
	[Type contract] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Validated accountant?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source accountant validation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Migration?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Financial Exchange] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Customer Code in Synergy] [int] NULL,
	[Exist in EOL?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Other customer code in EOL?] [int] NULL,
	[Accountant linked] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classification?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dealer?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Customer information checked?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Digipass created?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Related question] [uniqueidentifier] NULL,
	[Name, adress, etc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact person] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status old exact package] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reason not linked] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Why online bookkeeping?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Decisive factor for EOL?] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Which package before EOL] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
