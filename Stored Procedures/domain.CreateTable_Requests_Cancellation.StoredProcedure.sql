USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_Cancellation]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_Cancellation]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_Cancellation]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	CreateTable procedure for building the Cancellation Request table
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_Cancellation] 

AS
BEGIN
IF OBJECT_ID (N'Requests_CancellationRequest', N'U') IS NOT NULL 
DROP TABLE domain.Requests_CancellationRequest

CREATE TABLE [domain].[Requests_CancellationRequest](
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
[Trial?] nvarchar(max),
[Full cancellation] nvarchar(max),
[-] nvarchar(max),
[Cancel administrations] int,
[Cancel users] int, 
[View user] nvarchar(max),
[Cancel budget] nvarchar(max),
[Cancel cost analysis] nvarchar(max),
[Cancel currency] nvarchar(max),
[Cancel invoice] nvarchar(max),
[Cancel activa] nvarchar(max),
[Reason cancellation] int,
[Internal reason cancellation] int,
[Migrated to] nvarchar(max),
[Rollback cancellation] nvarchar(max),
[StartDate] Date,
[EndDate] Date, 
[Confirmation cancellation sent?] nvarchar(max),
[Confirmation cancellation] uniqueidentifier,
[Change per] nvarchar(max),
[# months collection] nvarchar(max),
[Done] nvarchar(max),
[Classification 1] nvarchar(max),
[Classification 2] nvarchar(max),
[Classification 3] nvarchar(max),
[Do not change] Date,
[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END
GO
