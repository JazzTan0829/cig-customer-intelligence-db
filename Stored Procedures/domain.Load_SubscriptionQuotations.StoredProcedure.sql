USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_SubscriptionQuotations]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_SubscriptionQuotations]
GO
/****** Object:  StoredProcedure [domain].[Load_SubscriptionQuotations]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Author:		Jennifer Vink
-- Create date: 2018-05-23
-- Description:	Load procedure for the latest Subscription Quotations records
-- ==========================================================================================
CREATE PROCEDURE [domain].[Load_SubscriptionQuotations]

AS
BEGIN
 
TRUNCATE TABLE domain.SubscriptionQuotations

INSERT INTO domain.SubscriptionQuotations
	(
	   [SubscriptionQuotationID]
      ,[Code]
      ,[AccountID]
      ,[Environment]
      ,[ItemID]
      ,[Quantity]
      ,[MainLine]
      ,[DiscountAmount]
      ,[DiscountPeriod]
      ,[DiscountDescription]
      ,[Status]
      ,[TotalMRR]
      ,[Notes]
      ,[ExtraServiceDiscountDescription]
      ,[ExtraServiceDiscountNotes]
      ,[DiscountType]
      ,[Approver]
      ,[ExtraServiceNumberOfDays]
      ,[ExtraServiceTotalDiscountAmount]
      ,[FirstYearNoCancellation]
      ,[ContractTerm]
      ,[ExtraServiceGrossAmount]
      ,[CIGCopyTime]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
	)
SELECT
	   [ID] AS SubscriptionQuotationID
      ,[Code]
      ,[Customer] AS AccountID
      ,[Environment]
      ,[Item] AS ItemID
      ,[Quantity]
      ,[MainLine]
      ,[DiscountAmount]
      ,[DiscountPeriod]
      ,[DiscountDescription]
      ,[Status]
      ,[TotalMRR]
      ,[Notes]
      ,[ExtraServiceDiscountDescription]
      ,[ExtraServiceDiscountNotes]
      ,[DiscountType]
      ,[Approver]
      ,[ExtraServiceNumberOfDays]
      ,[ExtraServiceTotalDiscountAmount]
      ,[FirstYearNoCancellation]
      ,[ContractTerm]
      ,[ExtraServiceGrossAmount]
      ,[CIGCopyTime]
      ,[syscreated]
      ,[syscreator]
      ,[sysmodified]
      ,[sysmodifier]
FROM
	(
		SELECT 
			*
			, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY CIGCopyTime DESC) AS RowNumber
		FROM [raw].HOST_CIG_SubscriptionQuotations
	) LatestRec
WHERE LatestRec.RowNumber = 1

END
GO
