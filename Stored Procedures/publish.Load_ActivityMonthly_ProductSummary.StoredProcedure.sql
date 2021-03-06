USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [publish].[Load_ActivityMonthly_ProductSummary]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [publish].[Load_ActivityMonthly_ProductSummary]
GO
/****** Object:  StoredProcedure [publish].[Load_ActivityMonthly_ProductSummary]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [publish].[Load_ActivityMonthly_ProductSummary]

AS
BEGIN

-- ============================================================================================================================================================================================================
-- Author:		Alex Green
-- Create date: 07/04/2015
-- Description:	This loads the ActivityMonthly_ProductSummary facts table to be used for the product summary in Power BI
-- ============================================================================================================================================================================================================

TRUNCATE TABLE publish.ActivityMonthly_ProductSummary

INSERT INTO publish.ActivityMonthly_ProductSummary (Environment, YearMonth, Year, Month, Product, Edition, ContractType, LinkedAccountant, Churned, ActivityType, ActivityGroup, ActivitySubGroup, ActivityID, ActivityDetail, ActivityDescription, TotalDistinctCustomers, SumQuantity, SumMRR)
SELECT
	Environment
	, YearMonth
	, Year
	, Month
	, Product
	, Edition
	, ContractType
	, LinkedAccountant
	, Churned
	, ActivityType
	, ActivityGroup
	, ActivitySubGroup
	, ActivityID
	, ActivityDetail
	, ActivityDescription
	, TotalDistinctCustomers
	, SumQuantity
	, SumMRR

FROM
	(
		SELECT
			Environment
			, YearMonth
			, Year
			, Month
			, ContractType
			, LinkedAccountant
			, Product
			, Edition
			, Churned
			, 'Contract' AS ActivityType
			, 'General' AS ActivityGroup
			, 'Contract' AS ActivitySubGroup
			, CAST(0 AS INT) AS ActivityID
			, 'Contracted customers' AS ActivityDetail
			, 'Number of contracted customers in group' AS ActivityDescription
			, COUNT(DISTINCT(AccountCode)) AS TotalDistinctCustomers
			, NULL AS SumQuantity
			, (CASE WHEN ContractType = 'C' THEN SUM(MRR) ELSE 0 END) AS SumMRR

		FROM
			(
				SELECT
					APM. Environment
					, APM.AccountCode
					, APM.YearMonth
					, APM.Year
					, APM.Month
					, ContractType
					, (CASE WHEN IsAccountant = 'Entrepreneur' AND AccountantOrLinked = 1 THEN 1 ELSE 0 END) AS LinkedAccountant		-- Creates a more easily usable column for whether the customer has an accountant linked or not
					, P.Product
					, P.Edition
					, APM.Churned
					, APM.MRR

				FROM
					domain.AccountsContract_PerMonth AS APM

				-- Join Accounts table
				JOIN domain.Accounts
					ON APM.Environment = Accounts.Environment
					AND APM.AccountCode = Accounts.AccountCode

				-- Join PackageClassification
				JOIN domain.PackageClassification P
					ON APM.Environment = P.Environment
					AND APM.PackageCode = P.PackageCode

				WHERE
					-- Only includes Year/Month from when we have Activity Log data
					APM.YearMonth >= 201511

					-- Filters out non-commercial contracts
					AND
						(AccountClassificationCode = 'EOL'
						OR AccountClassificationCode = 'ACC'
						OR AccountClassificationCode = 'AC7'
						OR AccountClassificationCode = 'JBO'
						OR AccountClassificationCode = 'AC1'
						)

					-- Removes Partner product types
					AND P.Product <> 'Partner'

			) Merged

		GROUP BY
			Environment
			, Product
			, Edition
			, Year
			, Month
			, YearMonth
			, LinkedAccountant
			, ContractType
			, Product
			, Edition
			, Churned
	) GroupedAPM


-- Appends the ActivityMonthly table to the original table
UNION
	--(
		SELECT
			Environment
			, YearMonth
			, Year
			, Month
			, Product
			, Edition
			, ContractType
			, LinkedAccountant
			, Churned
			, ActivityType
			, ActivityGroup
			, ActivitySubGroup
			, ActivityID
			, ActivityDetail
			, ActivityDescription
			, COUNT(DISTINCT(AccountCode)) AS TotalDistinctCustomers
			, SUM(Quantity) AS SumQuantity
			, NULL AS SumMRR

		FROM
			(
				SELECT
					APM. Environment
					, APM.AccountCode
					, APM.YearMonth
					, APM.Year
					, APM.Month
					, ContractType
					, (CASE WHEN IsAccountant = 'Entrepreneur' AND AccountantOrLinked = 1 THEN 1 ELSE 0 END) AS LinkedAccountant		-- Creates a more easily usable column for whether the customer has an accountant linked or not
					, P.Product
					, P.Edition
					, APM.Churned
					, ActivityType
					, ActivityGroup
					, ActivitySubGroup
					, AM.ActivityID
					, ActivityDetail
					, ActivityDescription
					, Quantity

				FROM
					domain.AccountsContract_PerMonth AS APM

				-- Join Accounts table
				JOIN domain.Accounts
					ON APM.Environment = Accounts.Environment
					AND APM.AccountCode = Accounts.AccountCode

				-- Join PackageClassification
				JOIN domain.PackageClassification P
					ON APM.Environment = P.Environment
					AND APM.PackageCode = P.PackageCode

				-- Join ActivityMonthly
				JOIN domain.ActivityMonthly AM
					ON APM.Environment = AM.Environment
					AND APM.AccountCode = AM.AccountCode
					AND APM.YearMonth = AM.YearMonth

				-- Joins the Activities Table
				JOIN config.Activities Acts
					ON AM.ActivityID = Acts.ActivityID

					/*
				-- Joins the ASPX Product/Edition table to only include ASPX pages that can belong to a product/edition. This means that ASPX pages from a different product, where a customer has upgraded/downgraded during the month, do not have Activity Group information
				LEFT JOIN
					(
						SELECT
							ActivityID
							, Product
							, Edition
							, 1 AS ASPXIdentifier							-- This creates an identifier as to whether the ASPX page can be found in the Product/Edition
						FROM config.AspxProductEdition
					) AspxProductEdition
					ON AspxProductEdition.ActivityID = AM.ActivityID
					AND  AspxProductEdition.Product = P.Product
					AND AspxProductEdition.Edition = P.Edition
					*/

				WHERE
					-- Only includes Year/Month from when we have Activity Log data
					APM.YearMonth >= 201511

					-- Filters out non-commercial contracts
					AND
						(AccountClassificationCode = 'EOL'
						OR AccountClassificationCode = 'ACC'
						OR AccountClassificationCode = 'AC7'
						OR AccountClassificationCode = 'JBO'
						OR AccountClassificationCode = 'AC1')

					-- Removes Partner product types
					AND P.Product <> 'Partner'

					-- For the ASPX page Activity IDs (those greater than 5000), the ASPX must match the Product/Edition otherwise it is not included
					AND AM.ActivityID < 5000 
			) Merged

		GROUP BY
			Environment
			, Product
			, Edition
			, Year
			, Month
			, YearMonth
			, LinkedAccountant
			, ContractType
			, Product
			, Edition
			, Churned
			, ActivityType
			, ActivityGroup
			, ActivitySubGroup
			, ActivityID
			, ActivityDetail
			, ActivityDescription


ALTER INDEX ALL ON publish.ActivityMonthly_ProductSummary REBUILD

END
GO
