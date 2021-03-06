USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_PartialCancellation]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_PartialCancellation]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_PartialCancellation]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-0124
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_PartialCancellation] 
AS
BEGIN
IF OBJECT_ID (N'Requests_PartialCancellation', N'U') IS NOT NULL 
DROP TABLE domain.Requests_PartialCancellation

CREATE TABLE [domain].[Requests_PartialCancellation](
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
[Cancel administrations] int,
[Cancel users] int,
[View users] nvarchar(max),
[Cancel digipasses] nvarchar(max),
[Cancel budget] nvarchar(max),
[Cancel electronic banking] nvarchar(max),
[Cancel costs analysis] nvarchar(max),
[Cancel currency] nvarchar(max),
[Cancel invoice] nvarchar(max),
[Cancel activa] nvarchar(max),
[Cancel accountancy tools] nvarchar(max),
[Reason cancellation] int,
[Reason internal cancellation] int,
[Switched to] nvarchar(max),
[Reverse cancellation] nvarchar(max),
[Mutation date] Date,
[Date next action] Date,
[Confirmation sent?] nvarchar(max),
[Confirmation cancellation] uniqueidentifier,
[Confirmed since:] nvarchar(max),
[# month to collect] nvarchar(max),

[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END
GO
