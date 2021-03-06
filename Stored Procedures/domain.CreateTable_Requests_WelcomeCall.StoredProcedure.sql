USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_WelcomeCall]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_WelcomeCall]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_WelcomeCall]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_WelcomeCall] 
AS
BEGIN
IF OBJECT_ID (N'Requests_WelcomeCall', N'U') IS NOT NULL 
DROP TABLE domain.Requests_WelcomeCall

CREATE TABLE [domain].[Requests_WelcomeCall](
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
[-] nvarchar(max),
[Reached] nvarchar(max),
[Accountancy profile] nvarchar(max),
[Welcome] nvarchar(max),
[Accountancy program] nvarchar(max),
[Login data] nvarchar(max),
[Help tools] nvarchar(max),
[Account information] nvarchar(max),
[My Exact Online] nvarchar(max),
[Account manager] nvarchar(max),
[Tips] nvarchar(max),
[--] nvarchar(max),
[Related question] uniqueidentifier,
[StartDate] Date,
[Action date] Date,
[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END
GO
