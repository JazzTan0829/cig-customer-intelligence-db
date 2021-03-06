USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[CreateTable_AccountIDHash]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[CreateTable_AccountIDHash]
GO
/****** Object:  StoredProcedure [config].[CreateTable_AccountIDHash]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 01-07-2016
-- Description:	CreateTable Look up
-- =============================================
CREATE PROCEDURE [config].[CreateTable_AccountIDHash] AS
BEGIN
IF OBJECT_ID (N'CustomerIntelligence.config.AccountIDHash', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.config.AccountIDHash

CREATE TABLE CustomerIntelligence.config.AccountIDHash
(	
AccountID nvarchar(max),
HashedCustomer nvarchar(max)
)
END

GO
