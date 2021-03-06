USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_WelcomeCall]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_WelcomeCall]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_WelcomeCall]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_WelcomeCall] 
AS
BEGIN
IF OBJECT_ID (N'WelcomeCall', N'U') IS NOT NULL 
DROP TABLE domain.WelcomeCall

CREATE TABLE [domain].[WelcomeCall](
[Status] int,
[ID] uniqueidentifier,
[HID] int ,
[TypeDescription] nvarchar(200),
[AccountID] uniqueidentifier,
[ContactID] uniqueidentifier,
[Description] nvarchar(255),
[RequestComments] nvarchar(255),
[WorkflowComments] nvarchar(255),
[-] nvarchar(80),
[Reached] nvarchar(80),
[Accountancy profile] nvarchar(80),
[Welcome] nvarchar(80),
[Accountancy program] nvarchar(80),
[Login data] nvarchar(80),
[Help tools] nvarchar(80),
[Account information] nvarchar(80),
[My Exact Online] nvarchar(80),
[Account manager] nvarchar(80),
[Tips] nvarchar(80),
[--] nvarchar(80),
[Related question] uniqueidentifier,
[StartDate] Date,
[Action date] Date,
[CIGCopyTime] Datetime,
[Environment] nvarchar(3),
[Processed] nvarchar(20)
)
END
GO
