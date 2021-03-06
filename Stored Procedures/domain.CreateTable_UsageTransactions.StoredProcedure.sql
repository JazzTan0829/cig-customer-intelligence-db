USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_UsageTransactions]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_UsageTransactions]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_UsageTransactions]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 29-03-2017
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_UsageTransactions] 
AS
BEGIN
IF OBJECT_ID (N'CustomerIntelligence.domain.UsageTransactions ', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.UsageTransactions 

CREATE TABLE CustomerIntelligence.domain.UsageTransactions 
(
ID uniqueidentifier NOT NULL,
Division int NOT NULL,
Account uniqueidentifier NOT NULL,
Item uniqueidentifier NOT NULL,
StartDate Datetime NOT NULL,
EndDate Datetime NOT NULL,
Quantity int NOT NULL,
sysmodified datetime NOT NULL,
syscreated datetime NOT NULL,
syscreator uniqueidentifier NULL,
sysmodifier uniqueidentifier NULL,
CIGCopyTime datetime NULL,
Environment nchar(3) NULL,
CIGProcessed bit NULL,
Amount float NULL,
Invoice uniqueidentifier NULL,
UsageEntitlement uniqueidentifier NULL,
CostPrice float NULL,
SalesPrice float NULL,
SourceDivision int NULL
)
END
GO
