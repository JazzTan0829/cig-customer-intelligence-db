USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Cancellation]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Cancellation]
GO
/****** Object:  StoredProcedure [domain].[Load_Cancellation]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 24-05-2016
-- Description:	Load the Cancellation data out of ContractData.domain.ExportEOLRequest
-- =============================================
CREATE PROCEDURE [domain].[Load_Cancellation] 

AS

BEGIN
TRUNCATE TABLE CustomerIntelligence.domain.Cancellation

INSERT INTO [CustomerIntelligence].domain.Cancellation 
(RequestID, Environment, AccountCode, Created, TypeDescription, Description, FullCancellation)

SELECT 
		RequestID,
		CASE RC.Environment
			WHEN 'GB' 
			THEN 'UK' 
			ELSE RC.Environment END AS Environment
		,ltrim(rtrim(AccountCode))	AS AccountCode	
		,Created
		,TypeDescription
		,Description 
		,[Full Cancellation]
FROM domain.Requests_CancellationRequest RC

JOIN domain.Accounts AC
ON RC.AccountID=AC.AccountID


END
GO
