/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4451)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [CustomerIntelligence]
GO
/****** Object:  Table [domain].[CreditInvoice_TOBEDELETED]    Script Date: 30/01/2018 11:59:01 ******/
DROP TABLE IF EXISTS [domain].[CreditInvoice_TOBEDELETED]
GO
/****** Object:  Table [domain].[CreditInvoice_TOBEDELETED]    Script Date: 30/01/2018 11:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[domain].[CreditInvoice_TOBEDELETED]') AND type in (N'U'))
BEGIN
CREATE TABLE [domain].[CreditInvoice_TOBEDELETED](
	[Status] [int] NULL,
	[ID] [uniqueidentifier] NULL,
	[HID] [int] NULL,
	[TypeDescription] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [uniqueidentifier] NULL,
	[ContactID] [uniqueidentifier] NULL,
	[Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RequestComments] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WorkflowComments] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Entry information] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Original invoice number] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Original invoice date] [date] NULL,
	[Credit invoice date] [date] NULL,
	[Original invoice blocked] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reason] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Related account] [uniqueidentifier] NULL,
	[Related request] [uniqueidentifier] NULL,
	[Realize information] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Credit invoice number] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New debit invoice number] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Process information] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Revenue category] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIGCopyTime] [datetime] NULL,
	[Environment] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processed] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
