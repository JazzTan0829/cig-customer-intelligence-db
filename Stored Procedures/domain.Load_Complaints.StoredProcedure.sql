USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Complaints]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Complaints]
GO
/****** Object:  StoredProcedure [domain].[Load_Complaints]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 5-2-2016
-- Description:	
-- =============================================
CREATE PROCEDURE [domain].[Load_Complaints] 

AS
BEGIN
TRUNCATE TABLE CustomerIntelligence.domain.Complaints

INSERT INTO domain.Complaints
			(
			ID,
			Environment, 
			TypeHID,
			HID,
			TypeDescription,
			Created,
			AccountCode,
			Approved,
			Realised,
			Status,
			ItemCode_1,
			FreeTextField_01,
			Description
			)
SELECT
			ID,
			Environment, 
			HID,
			Empty,
			TypeDescription,
			syscreated,
			AccountCode,
			Approved,
			Realised,
			Status,
			ItemCode,
			FreeTextField_01,
			Description
FROM (
		SELECT 
			ID,
			CASE R.Environment
				WHEN 'GB' 
				THEN 'UK' 
				ELSE R.Environment END AS Environment, 
			HID,
			NULL AS Empty,
			TypeDescription,
			R.syscreated,
			A.AccountCode,
			Approved,
			Realized As Realised,
			Status,
			ItemCode,
			R.FreeTextField_01,
			Description,
			ROW_NUMBER() OVER (Partition BY ID ORDER BY R.CIGCopyTime desc) As RowNumber

			FROM raw.HOST_CIG_Requests R
			JOIN domain.Accounts A
			ON R.Account=A.AccountID
			LEFT JOIN domain.Items I
			ON R.Item_1=I.ItemID
			Where HID='1209') SUB
WHERE RowNumber='1'
END
GO
