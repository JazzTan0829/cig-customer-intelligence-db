USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DefinitiefAbonnement]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_DefinitiefAbonnement]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_DefinitiefAbonnement]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-24
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_DefinitiefAbonnement] 

AS

BEGIN
IF OBJECT_ID (N'DefinitiefAbonnement', N'U') IS NOT NULL 
DROP TABLE domain.DefinitiefAbonnement

CREATE TABLE [domain].[DefinitiefAbonnement](
[Status] int,
[ID] uniqueidentifier,
[HID] int ,
[TypeDescription] nvarchar(200),
[AccountID] uniqueidentifier,
[ContactID] uniqueidentifier,
[Description] nvarchar(255),
[RequestComments] nvarchar(255),
[WorkflowComments] nvarchar(255),
[StartDate] Date,
[EndDate] Date,
[Soort Contract] nvarchar(80),
[Accountant?] nvarchar(80),
[Proef => vast!] int,
[Type contract] nvarchar(80),
[Validated accountant?] nvarchar(80),
[Source accountant validation] nvarchar(80),
[Migration?] nvarchar(80),
[Financial Exchange] nvarchar(80),
[Customer Code in Synergy] int,
[Exist in EOL?] nvarchar(80),
[Other customer code in EOL?] int,
[Accountant linked] nvarchar(80),
[Classification?] nvarchar(80),
[Dealer?] nvarchar(80),
[Customer information checked?] nvarchar(80),
[Digipass created?] nvarchar(80),
[Related question] uniqueidentifier,
[Name, adress, etc] nvarchar(80),
[Contact person] uniqueidentifier,
[Status old exact package] nvarchar(80),
[Reason not linked] nvarchar(80),
[Why online bookkeeping?] nvarchar(80),
[Decisive factor for EOL?] nvarchar(80),
[Which package before EOL] nvarchar(80),
[CIGCopyTime] Datetime,
[Environment] nvarchar(3),
[Processed] nvarchar(20)
)
END
GO
