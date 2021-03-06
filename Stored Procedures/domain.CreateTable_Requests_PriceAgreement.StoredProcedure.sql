USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_PriceAgreement]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_PriceAgreement]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_PriceAgreement]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_PriceAgreement] 
AS
BEGIN
IF OBJECT_ID (N'Requests_PriceAgreement', N'U') IS NOT NULL 
DROP TABLE domain.Requests_PriceAgreement

CREATE TABLE [domain].[Requests_PriceAgreement](
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

[Discount on] nvarchar(max),
[Discount Amount] nvarchar(max),
[Consultancy hour rate] nvarchar(max),

[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END
GO
