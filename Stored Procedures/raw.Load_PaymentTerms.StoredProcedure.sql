USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_PaymentTerms]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_PaymentTerms]
GO
/****** Object:  StoredProcedure [raw].[Load_PaymentTerms]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 06/01/2017
-- Description:	This procedure truncates the existing data in the PaymentTerms table and inserts the latest records.
--				This is the first attempt at building a modified version of Payment terms.
--				This table does not contain all columns from EOL Hosting as some are too sensitive for Customer Intelligence to collect
--				A WHERE condition only selects records with a CIGCopyTime on or after 8 July 2017 - the date on which a full backup of the data was done 
-- =====================================================================================================================================================================

CREATE PROCEDURE [raw].[Load_PaymentTerms]

AS
BEGIN

TRUNCATE TABLE [raw].PaymentTerms;

WITH CTE_PaymentTerms
AS
(
	SELECT
	   [ID]
      ,[Environment]
      ,[Division]
      ,[EntryID]
      ,[Journal]
      ,[LineType]
      ,[Account]
      ,[AccountContact]
      ,[Currency]
      ,[AmountFC]
      ,[RateFC]
      ,[AmountDC]
      ,[EntryDate]
      ,[InvoiceDate]
      ,[DueDate]
      ,[EndDate]
      ,[EndYear]
      ,[EndPeriod]
      ,[EntryNumber]
      ,[InvoiceNumber]
      ,[Status]
      ,[MatchID]
      ,[WriteOffCode]
      ,[Source]
      ,[PaymentCondition]
      ,[PaymentDiscountType]
      ,[PaymentDiscount]
      ,[PaymentReference]
      ,[PaymentMethod]
      ,[PaymentDays]
      ,[PaymentStatus]
      ,[TransactionID]
      ,[TransactionType]
      ,[TransactionReportingYear]
      ,[TransactionReportingPeriod]
      ,[TransactionReversal]
      ,[TransactionStatus]
      ,[TransactionDueDate]
      ,[TransactionAmountFC]
      ,[TransactionAmountDC]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[CIGCopyTime]
	  , ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RowNumber
	FROM [raw].HOST_CIG_PaymentTerms
	WHERE CIGCopyTime >= '2017-07-08'		-- This is the date that Infra provided us with a full backup of the PaymentTerms data that no longer contained the rows which caused the 10 cent A/R bug
)

INSERT INTO [raw].PaymentTerms
(
	   [PaymentTermsID]
      ,[Environment]
      ,[AccountID]
	  ,[DivisionCode]
      ,[EntryID]
      ,[Journal]
      ,[LineType]
      ,[AccountContact]
      ,[Currency]
      ,[AmountFC]
      ,[RateFC]
      ,[AmountDC]
      ,[EntryDate]
      ,[InvoiceDate]
      ,[DueDate]
      ,[EndDate]
      ,[EndYear]
      ,[EndPeriod]
      ,[EntryNumber]
      ,[InvoiceNumber]
      ,[Status]
      ,[MatchID]
      ,[WriteOffCode]
      ,[Source]
      ,[PaymentCondition]
      ,[PaymentDiscountType]
      ,[PaymentDiscount]
      ,[PaymentReference]
      ,[PaymentMethod]
      ,[PaymentDays]
      ,[PaymentStatus]
      ,[TransactionID]
      ,[TransactionType]
      ,[TransactionReportingYear]
      ,[TransactionReportingPeriod]
      ,[TransactionReversal]
      ,[TransactionStatus]
      ,[TransactionDueDate]
      ,[TransactionAmountFC]
      ,[TransactionAmountDC]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[CIGCopyTime]
	)

SELECT
	  ID AS [PaymentTermsID]
      ,[Environment]
      ,[Account] AS [AccountID]
      ,Division AS [DivisionCode]
      ,[EntryID]
      ,[Journal]
      ,[LineType]
      ,[AccountContact]
      ,[Currency]
      ,[AmountFC]
      ,[RateFC]
      ,[AmountDC]
      ,[EntryDate]
      ,[InvoiceDate]
      ,[DueDate]
      ,[EndDate]
      ,[EndYear]
      ,[EndPeriod]
      ,[EntryNumber]
      ,[InvoiceNumber]
      ,[Status]
      ,[MatchID]
      ,[WriteOffCode]
      ,[Source]
      ,[PaymentCondition]
      ,[PaymentDiscountType]
      ,[PaymentDiscount]
      ,[PaymentReference]
      ,[PaymentMethod]
      ,[PaymentDays]
      ,[PaymentStatus]
      ,[TransactionID]
      ,[TransactionType]
      ,[TransactionReportingYear]
      ,[TransactionReportingPeriod]
      ,[TransactionReversal]
      ,[TransactionStatus]
      ,[TransactionDueDate]
      ,[TransactionAmountFC]
      ,[TransactionAmountDC]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
      ,[CIGCopyTime]
FROM  CTE_PaymentTerms
WHERE
	RowNumber = 1

END
GO
