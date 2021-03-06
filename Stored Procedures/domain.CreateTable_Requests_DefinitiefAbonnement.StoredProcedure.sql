USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_DefinitiefAbonnement]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_Requests_DefinitiefAbonnement]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_Requests_DefinitiefAbonnement]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_Requests_DefinitiefAbonnement] 

AS

BEGIN
IF OBJECT_ID (N'Requests_DefinitiefAbonnement', N'U') IS NOT NULL 
DROP TABLE domain.Requests_DefinitiefAbonnement

CREATE TABLE [domain].[Requests_DefinitiefAbonnement](
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
[StartDate] Date,
[EndDate] Date,
[Soort Contract] nvarchar(max),
[Accountant?] nvarchar(max),
[Proef => vast!] int,
[Type contract] nvarchar(max),
[Validated accountant?] nvarchar(max),
[Source accountant validation] nvarchar(max),
[Migration?] nvarchar(max),
[Financial Exchange] nvarchar(max),
[Customer Code in Synergy] int,
[Exist in EOL?] nvarchar(max),
[Other customer code in EOL?] int,
[Accountant linked] nvarchar(max),
[Classification?] nvarchar(max),
[Dealer?] nvarchar(max),
[Customer information checked?] nvarchar(max),
[Digipass created?] nvarchar(max),
[Related question] uniqueidentifier,
[Name, adress, etc] nvarchar(max),
[Contact person] nvarchar(max),
[Status old exact package] nvarchar(max),
[Reason not linked] nvarchar(max),
[Why online bookkeeping?] nvarchar(max),
[Decisive factor for EOL?] nvarchar(max),
[Which package before EOL] nvarchar(max),
[CIGCopyTime] Datetime,
[Environment] nvarchar(4),
[Processed] datetime
)
END
GO
