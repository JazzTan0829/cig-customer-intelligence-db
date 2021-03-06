USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_ConsultAanvraag]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_ConsultAanvraag]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_ConsultAanvraag]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_ConsultAanvraag] 
AS

BEGIN
IF OBJECT_ID (N'Requests_ConsultAanvraag', N'U') IS NOT NULL 
DROP TABLE domain.Requests_ConsultAanvraag

CREATE TABLE [domain].[Requests_ConsultAanvraag](
[RequestID] uniqueidentifier,
[ProjectID] uniqueidentifier, 
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
[Remark] nvarchar(max),
[-] nvarchar(max),
[--] nvarchar(max),
[ItemID] nvarchar(max),
[Number of days] nvarchar(max),
[Consultancy done by] uniqueidentifier,
[Price agreement] uniqueidentifier,
[Sales] uniqueidentifier,
[StartDate] Date,
[EndDate] Date,
[Internal remark] nvarchar(max),
[Consultancy dag 1] Date,
[Contact person] nvarchar(max),
[Email] nvarchar(max),
[Telephone number] nvarchar(max),
[Accountant involved] nvarchar(max),
[Key-users] nvarchar(max),
[Current solution] nvarchar(max),
[Training planned] nvarchar(max),
[Conversion] nvarchar(max),
[Import files?] nvarchar(max),
[Particularities getting started] nvarchar(max),
[Particularities process] nvarchar(max),
[Apps linked] nvarchar(max),
[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime,
[Amount] float,
[UserID] uniqueidentifier,
[RequstHID] integer 
)
END
GO
