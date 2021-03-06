USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AccountsWithGUID]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[CreateTable_AccountsWithGUID]
GO
/****** Object:  StoredProcedure [domain].[CreateTable_AccountsWithGUID]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 21-06-2016
-- Description:	Create table for accounts including the account GUID
-- =============================================
CREATE PROCEDURE [domain].[CreateTable_AccountsWithGUID] 
AS
BEGIN
IF OBJECT_ID (N'CustomerIntelligence.domain.AccountsWithGUID', N'U') IS NOT NULL 
DROP TABLE CustomerIntelligence.domain.AccountsWithGUID

Create Table AccountsWithGUID
(
	AccountID uniqueidentifier NULL,
	Environment  nchar(3)  NULL,
	AccountCode  nvarchar(18)  NULL,
	Name  nvarchar(50)  NULL,
	
	IsAccountant  nvarchar(60)  NULL,
	AccountantOrLinked  tinyint  NULL,
	EntrepreneurAccountantLinked  nvarchar(60)  NULL,
	AccountantCode  nvarchar(18)  NULL,

	ChamberOfCommerce  nvarchar(20)  NULL,
	VATNumber  nvarchar(35)  NULL,
	
	Postcode  nvarchar(20)  NULL,
	City  nvarchar(100)  NULL,
	State  nvarchar(3)  NULL,
	Country  nchar(3)  NULL,

	SectorCode  nvarchar(10)  NULL,
	SubSectorCode  nvarchar(10)  NULL,
	CompSizeCode  nvarchar(10)  NULL,
	BusTypeCode  nvarchar(10)  NULL,
	
	AccountClassificationCode  nvarchar(3)  NULL,
	AccountManagerCode  int  NULL,
	AccountManagerAccountantCode  int  NULL,
		
	ResellerCode  nvarchar(18)  NULL,
	
	LeadSourceCode  nvarchar(10)  NULL,
	
	Blocked  tinyint  NULL ,

	NumberOfBlankKeyFields	int NULL
	)
END
GO
