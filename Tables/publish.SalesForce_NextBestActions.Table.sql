USE [CustomerIntelligence]
GO
/****** Object:  Table [publish].[SalesForce_NextBestActions]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [publish].[SalesForce_NextBestActions]
GO
/****** Object:  Table [publish].[SalesForce_NextBestActions]    Script Date: 24-sept.-18 14:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [publish].[SalesForce_NextBestActions](
	[RowNumber] [int] IDENTITY(1,1) NOT NULL,
	[CI_EventID] [uniqueidentifier] NULL,
	[AccountID] [uniqueidentifier] NULL,
	[NextBestActionID] [uniqueidentifier] NULL,
	[DateTimeSelectedForAction] [datetime] NULL,
	[DateTimeSentToSalesforce] [datetime] NULL,
	[Suggest] [bit] NULL,
	[DateTimeLastModified] [datetime] NULL,
	[Salesforce_ID] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
