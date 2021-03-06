USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_Enablement]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_Enablement]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_Enablement]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_Enablement] 
AS
BEGIN
IF OBJECT_ID (N'Requests_Enablement', N'U') IS NOT NULL 
DROP TABLE domain.Requests_Enablement

CREATE TABLE [domain].[Requests_Enablement](
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
[Next action date] Date,
[Type of onboarding] nvarchar(max),
[Information] nvarchar(max),
[Date welcome call] Date,
[Certification] nvarchar(max),
[Accountancy profile created] nvarchar(max),
[Risk profile] nvarchar(max),
[Desired date operational] Date,
[Start date consult] Date,
[Consultancy provided by] nvarchar(max),
[Date customer implemented] Date,
[Training followed] nvarchar(max),
[Survey respons] nvarchar(max),
[Date onboarding review call] nvarchar(max),
[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END
GO
