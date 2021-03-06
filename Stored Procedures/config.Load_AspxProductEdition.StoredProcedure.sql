USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[Load_AspxProductEdition]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[Load_AspxProductEdition]
GO
/****** Object:  StoredProcedure [config].[Load_AspxProductEdition]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer
-- Create date: 12-04-2016
-- Description:	Load procedure AspxProductEdition
-- =============================================
CREATE PROCEDURE [config].[Load_AspxProductEdition] 

AS
BEGIN
TRUNCATE TABLE CustomerIntelligence.config.AspxProductEdition

INSERT INTO [CustomerIntelligence].config.AspxProductEdition
(ActivityID, Aspx, Product, Edition)
SELECT aa.ActivityID,
ActivityDetail, 
CASE aa.Package 
	WHEN 'AccountancyBasic' THEN 'Accountancy' 
	WHEN 'AccountancyAdvanced' THEN 'Accountancy'
	WHEN 'AccountingBasic' THEN 'Accounting'
	WHEN 'AccountingAdvanced' THEN 'Accounting'
	WHEN 'AccountingPremium' THEN 'Accounting'
	WHEN 'WholesaleDistributionBasic' THEN 'Wholesale Distribution'
	WHEN 'WholesaleDistributionAdvanced' THEN 'Wholesale Distribution'
	WHEN 'WholesaleDistributionPremium' THEN 'Wholesale Distribution'
	WHEN 'ProfessionalServicesBasic' THEN 'Professional Services'
	WHEN 'ProfessionalServicesAdvanced' THEN 'Professional Services'
	WHEN 'ProfessionalServicesPremium' THEN 'Professional Services'
	WHEN 'ManufacturingBasic' THEN 'Manufacturing'
	WHEN 'ManufacturingAdvanced' THEN 'Manufacturing'
	END AS Product,
	
	Case aa.Package 
	WHEN 'AccountancyBasic' THEN 'Basic' 
	WHEN 'AccountancyAdvanced' THEN 'Advanced'
	WHEN 'AccountingBasic' THEN 'Basic'
	WHEN 'AccountingAdvanced' THEN 'Advanced'
	WHEN 'AccountingPremium' THEN 'Premium'
	WHEN 'WholesaleDistributionBasic' THEN 'Basic'
	WHEN 'WholesaleDistributionAdvanced' THEN 'Advanced'
	WHEN 'WholesaleDistributionPremium' THEN 'Premium'
	WHEN 'ProfessionalServicesBasic' THEN 'Basic'
	WHEN 'ProfessionalServicesAdvanced' THEN 'Advanced'
	WHEN 'ProfessionalServicesPremium' THEN 'Premium'
	WHEN 'ManufacturingBasic' THEN 'Basic'
	WHEN 'ManufacturingAdvanced' THEN 'Advanced'
	END AS Edition

From
(SELECT unpvt.ActivityID, unpvt.ActivityDetail, unpvt.Package From
		(Select 
			ActivityID,
			ActivityDetail,
			AccountancyBasic,
			AccountancyAdvanced ,
			AccountingBasic,
			AccountingAdvanced ,
			AccountingPremium ,
			WholesaleDistributionBasic  ,
			WholesaleDistributionAdvanced,
			WholesaleDistributionPremium  ,
			ProfessionalServicesBasic  ,
			ProfessionalServicesAdvanced,
			ProfessionalServicesPremium ,
			ManufacturingBasic ,
			ManufacturingAdvanced
			FROM config.Activities Where ActivityID>=5001) p

UNPIVOT
   (binary FOR Package IN 
		(AccountancyBasic,
		AccountancyAdvanced,
		AccountingBasic,
		AccountingAdvanced,
		AccountingPremium ,
		WholesaleDistributionBasic,
		WholesaleDistributionAdvanced,
		WholesaleDistributionPremium,
		ProfessionalServicesBasic,
		ProfessionalServicesAdvanced,
		ProfessionalServicesPremium,
		ManufacturingBasic,
		ManufacturingAdvanced) 
		) unpvt
Where binary='1') aa
END
GO
