USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_CustomerProgress]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_CustomerProgress]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_CustomerProgress]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_CustomerProgress] 
AS
BEGIN
IF OBJECT_ID (N'Requests_CustomerProgress', N'U') IS NOT NULL 
DROP TABLE domain.Requests_CustomerProgress

CREATE TABLE [domain].[Requests_CustomerProgress](
[RequestID] uniqueidentifier,
[Created] Datetime,
[Modified] Datetime,
[Realized] Datetime,
[Approved] Datetime,
[StatusChanged] Datetime,

[Status] int,
[HID] int ,
[TypeDescription] nvarchar(max),
[AccountID] uniqueidentifier,
[ContactID] uniqueidentifier,
[Description] nvarchar(max),
[RequestComments] nvarchar(max),
[WorkflowComments] nvarchar(max),
[Basic setup] nvarchar(max),
[Apps] nvarchar(max),
[Setup master data] nvarchar(max),
[Match customer/solution] nvarchar(max),
[Action date] Date,
[EndDate] Date,
[New action] nvarchar(max),
[Start profile] nvarchar(max),
[End profile] nvarchar(max),
[Effort %] nvarchar(max),
[Contract value] nvarchar(max),
[Go-live date] Date,
[Onboarded by AMT?] nvarchar(max),
[Sweetspot customer?] nvarchar(max),
[Sector] nvarchar(max),
[Classification 1] nvarchar(max),
[Classification 2] nvarchar(max),
[Classification 3] nvarchar(max),

[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END
GO
