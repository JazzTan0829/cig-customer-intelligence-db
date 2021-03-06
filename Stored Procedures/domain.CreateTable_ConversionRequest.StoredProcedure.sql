USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ConversionRequest]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_ConversionRequest]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_ConversionRequest]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_ConversionRequest] 
	-- Add the parameters for the stored procedure here
	@p1 int = 0, 
	@p2 int = 0
AS
BEGIN
IF OBJECT_ID (N'ConversionRequest', N'U') IS NOT NULL 
DROP TABLE domain.ConversionRequest

CREATE TABLE [domain].[ConversionRequest](
[Status] int,
[ID] uniqueidentifier,
[HID] int ,
[TypeDescription] nvarchar(200),
[AccountID] uniqueidentifier,
[ContactID] uniqueidentifier,
[Description] nvarchar(255),
[RequestComments] nvarchar(255),
[WorkflowComments] nvarchar(255),
[Deliver the backup?] nvarchar(80),
[Conversion form] nvarchar(80),
[Only master data?] nvarchar(10),
[BU received] Date,
[BU placed] nvarchar(80),
[Number of administrations] nvarchar(80),
[Number of administrations converted] nvarchar(80),
[Conversion done by] nvarchar(80),
[StartDate] Date,
[EndDate] Date,
[Payment] nvarchar(80),
[CIGCopyTime] Datetime,
[Environment] nvarchar(3),
[Processed] nvarchar(20)
)
END
GO
