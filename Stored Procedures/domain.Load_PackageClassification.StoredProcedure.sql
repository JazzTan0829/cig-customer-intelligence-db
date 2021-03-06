USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_PackageClassification]    Script Date: 23-Nov-18 11:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 30-03-2017
-- Description:	This procedure is used to fill the domain.PackageClassification_New. 
--				The procedure domain.Insert_PackageClassification is inserting the given environment, 
--				packagecode, solution, product and edition information. into the domain table.
-- =============================================
ALTER PROCEDURE [domain].[Load_PackageClassification]
AS
BEGIN

--Accounting
EXEC	domain.Insert_PackageClassification		'BE',	'EOLADVANCED',			'Advanced',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL',	'EOLADVANCED',			'Advanced',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'DE',	'EOLADVANCED',			'Advanced',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'ES', 	'EOLADVANCED',			'Advanced',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'FR', 	'EOLADVANCED',			'Advanced',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'UK', 	'EOLADVANCED',			'Advanced',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'US', 	'EOLADVANCED',			'Advanced',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'US', 	'EOLBASIC',				'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'UK', 	'EOLBASIC',				'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'FR', 	'EOLBASIC',				'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'ES', 	'EOLBASIC',				'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'DE', 	'EOLBASIC',				'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'EOLBASIC',				'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLBASIC',				'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'EOLBASIC KNGU',		'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'EOLBASIC RodeKruis',	'Advanced',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLBASICXX',			'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'EOLING',				'Advanced',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'EOLInvoicing',			'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLInvoicing',			'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLLIONS',				'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLPremium',			'Premium',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'EOLPremium',			'Premium',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'EOLPrepaid',			'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLROTARY',			'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'EOLSalaris',			'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLSTARTER',			'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'DE', 	'EOLSTARTER',			'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'FR', 	'EOLSTARTER',			'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'UK', 	'EOLSTARTER',			'Basic',		'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLVATMARGIN',			'Premium',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLVATMARGIN2',		'Premium',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLVOLVOT',			'Premium',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'EOLEducatieAvans',		'Basic',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'EOLLite',		'Basic',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'EOLLite',		'Basic',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'DE', 	'EOLLite',		'Basic',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'UK', 	'EOLLite',		'Basic',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'US', 	'EOLLite',		'Basic',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'ES', 	'EOLLite',		'Basic',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'FR', 	'EOLLite',		'Basic',	'Accounting',	'Accounting'
EXEC	domain.Insert_PackageClassification		'BE', 	'GO',		NULL,	'Exact Go',	'Accounting'
EXEC	domain.Insert_PackageClassification		'NL', 	'GO',		NULL,	'Exact Go',	'Accounting'
EXEC	domain.Insert_PackageClassification		'DE', 	'GO',		NULL,	'Exact Go',	'Accounting'
EXEC	domain.Insert_PackageClassification		'UK', 	'GO',		NULL,	'Exact Go',	'Accounting'
EXEC	domain.Insert_PackageClassification		'US', 	'GO',		NULL,	'Exact Go',	'Accounting'
EXEC	domain.Insert_PackageClassification		'ES', 	'GO',		NULL,	'Exact Go',	'Accounting'
EXEC	domain.Insert_PackageClassification		'FR', 	'GO',		NULL,	'Exact Go',	'Accounting'

--Accountancy
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLACC2'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancy'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancy'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancy07'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyAccon'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyAdvanced'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountancyAdvanced'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountancyAdvanced'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyAdvanced'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountancyAdvanced'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLAccountancyAdvanced'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountancyAdvanced'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyAdvMW'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyBasic'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyBasis'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyELearning'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountancyELearning'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountancyELearning'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyELearning'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLAccountancyELearning'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountancyELearning'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountancyELearning'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountancyPayroll'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountancyPayroll'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLAccountancyPayroll'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyPayroll'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountancyPayroll'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountancyPayroll'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyPayroll'	,	'Basic'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyPremium'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountancyPremium'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountancyPremium'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyPremium'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLAccountancyPremium'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountancyPremium'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountancyPremium'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLSoleTrader'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLStarterBasic'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLStarterBasic'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'XEOLINVOICING' 	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyPremium18'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountancyPremium18'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountancyPremium18'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyPremium18'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLAccountancyPremium18'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountancyPremium18'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountancyPremium18'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyAdvancedPlus'	,	'Advanced'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyPremiumPlus'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountancyPreELearning'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyPreELearning'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountancyPreELearning'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyPreELearning'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLAccountancyPreELearning'	,	'Premium'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountancyPreELearning'	,	'Premium'	,	'Accountancy'	,	'Accountancy'




--Wholesale Distribution
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLHandel'	,	'Basic'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLHandel'	,	'Basic'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLHandel'	,	'Basic'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLHandel'	,	'Basic'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLHandel'	,	'Basic'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLHandel'	,	'Basic'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLHandel'	,	'Basic'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'UK'	,	'EOLHandelAdvanced'	,	'Advanced'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLHandelAdvanced'	,	'Advanced'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLHandelAdvanced'	,	'Advanced'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'FR'	,	'EOLHandelAdvanced'	,	'Advanced'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLHandelAdvanced'	,	'Advanced'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLHandelAdvanced'	,	'Advanced'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLHandelAdvanced'	,	'Advanced'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLHandelPremium'	,	'Premium'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLHandelPremium'	,	'Premium'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLHandelPremium'	,	'Premium'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLHandelPremium'	,	'Premium'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLHandelPremium'	,	'Premium'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLHandelPremium'	,	'Premium'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLHandelPremium'	,	'Premium'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLHandelUren'	,	'Basic'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLTradeAdvQB'	,	'Advanced'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLTradePreQB'	,	'Premium'	,	'Wholesale Distribution'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLTradeQB'	,	'Basic'	,	'Wholesale Distribution'	,	'Industry'

--Professional services
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLPCMPayroll'	,	'Premium'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLPMPayroll'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLPSAAdvanced'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLPSAAdvanced'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLPSAAdvanced'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLPSAAdvanced'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLPSAAdvanced'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLPSAAdvanced'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLPSAAdvanced'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLPSPremium'	,	'Premium'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLPSPremium'	,	'Premium'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLPSPremium'	,	'Premium'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLPSPremium'	,	'Premium'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLPSPremium'	,	'Premium'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLPSPremium'	,	'Premium'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLPSPremium'	,	'Premium'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLTBPayroll'	,	'Basic'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLUrenFacturen'	,	'Basic'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLUrenFacturen'	,	'Basic'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLUrenFacturen'	,	'Basic'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLUrenFacturen'	,	'Basic'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLUrenFacturen'	,	'Basic'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLUrenFacturen'	,	'Basic'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLUrenFacturen'	,	'Basic'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLUFOnderwijsinstelling'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLUFOnderwijsinstelling'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLUrenFacturenStudent'	,	'Advanced'	,	'Professional services'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLPSAdvQB'	,	'Advanced'	,	'Professional services'	,	'Industry'

--Manufacturing
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLManufactAdvQB'		,	'Advanced'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLManufacturingQB'		,	'Basic'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLProductie'		,	'Basic'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLProductie'		,	'Basic'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLProductie'		,	'Basic'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLProductie'		,	'Basic'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLProductie'		,	'Basic'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLProductie'		,	'Basic'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLProductie'		,	'Basic'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLProductieAdvanced'		,	'Advanced'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLProductieAdvanced'		,	'Advanced'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLProductieAdvanced'		,	'Advanced'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLProductieAdvanced'		,	'Advanced'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLProductieAdvanced'		,	'Advanced'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLProductieAdvanced'		,	'Advanced'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLProductieAdvanced'		,	'Advanced'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLProductiePremium'		,	'Premium'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLProductiePremium'		,	'Premium'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLProductiePremium'		,	'Premium'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLProductiePremium'		,	'Premium'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLProductieUren'			,	'Advanced'	,	'Manufacturing'	,	'Industry'
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLProductieStudent'		,	'Partner'		,	'Partner'	,	'Partner'
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLManufactPreQB'		,	'Premium'		,	'Manufacturing'	,	'Industry'

--Partner
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAangifte'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAPPCENTER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAPPCENTER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAPPCENTER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'ES' 	,	'EOLAPPCENTER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAPPCENTER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAPPCENTER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAPPCENTER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLBoekhoudenOnderwijsinst'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLBoekhoudenOnderwijsinst'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLBoekhoudenStudent'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLBoekhoudenStudent'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLCRM'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLDealer'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLEducatie - Leerling'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLEducatie - Leraar'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLEducatieToerist'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLEDUCATION'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLEDUCATION_FAC'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLEDUCATION2'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLEDUCATIONHANDEL'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLEducationRO'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL'	,	'EOLEmployee'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLGLB'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLGLB'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLHandelOnderwijsinstelling'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLHandelOnderwijsinstelling'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLHandelOnderwijsinstelling'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLHandelStudent'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLHandelStudent'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLHandelStudent'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLPartner'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLProdOnderwijsinstelling'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLProdOnderwijsinstelling'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLRESELLER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLRESELLER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLRESELLER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLRESELLER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLRESELLER'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLSalaris_Pilot'	,	'Partner'	,	'Partner'	,	'Partner'																	
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLVDAB'	,	'Partner'	,	'Partner'	,	'Partner'		
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLEDUCATION3'	,	'Partner'	,	'Partner'	,	'Partner'	



-- NEW PACKAGES + EDITIONS
EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyPlus'	,	'Plus'	,	'Accountancy'	,	'Accountancy'				
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyPlus'	,	'Plus'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountancyPlus'	,	'Plus'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountancyPlus'	,	'Plus'	,	'Accountancy'	,	'Accountancy'	
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountancyPlus'	,	'Plus'	,	'Accountancy'	,	'Accountancy'		
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountancyPlus'	,	'Plus'	,	'Accountancy'	,	'Accountancy'	

EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyEss'	,	'Essentials'	,	'Accountancy'	,	'Accountancy'				
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyEss'	,	'Essentials'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountancyEss'	,	'Essentials'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountancyEss'	,	'Essentials'	,	'Accountancy'	,	'Accountancy'	
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountancyEss'	,	'Essentials'	,	'Accountancy'	,	'Accountancy'		
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountancyEss'	,	'Essentials'	,	'Accountancy'	,	'Accountancy'	

EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyPro'	,	'Professional'	,	'Accountancy'	,	'Accountancy'				
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyPro'	,	'Professional'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountancyPro'	,	'Professional'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountancyPro'	,	'Professional'	,	'Accountancy'	,	'Accountancy'	
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountancyPro'	,	'Professional'	,	'Accountancy'	,	'Accountancy'		
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountancyPro'	,	'Professional'	,	'Accountancy'	,	'Accountancy'	

EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountingPlus'	,	'Plus'	,	'Accounting'	,	'Accounting'				
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountingPlus'	,	'Plus'	,	'Accounting'	,	'Accounting'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountingPlus'	,	'Plus'	,	'Accounting'	,	'Accounting'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountingPlus'	,	'Plus'	,	'Accounting'	,	'Accounting'	
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountingPlus'	,	'Plus'	,	'Accounting'	,	'Accounting'		
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountingPlus'	,	'Plus'	,	'Accounting'	,	'Accounting'	

EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountingEss'	,	'Essentials'	,	'Accounting'	,	'Accounting'				
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountingEss'	,	'Essentials'	,	'Accounting'	,	'Accounting'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountingEss'	,	'Essentials'	,	'Accounting'	,	'Accounting'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountingEss'	,	'Essentials'	,	'Accounting'	,	'Accounting'	
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountingEss'	,	'Essentials'	,	'Accounting'	,	'Accounting'		
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountingEss'	,	'Essentials'	,	'Accounting'	,	'Accounting'	

EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountingPro'	,	'Professional'	,	'Accounting'	,	'Accounting'				
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountingPro'	,	'Professional'	,	'Accounting'	,	'Accounting'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountingPro'	,	'Professional'	,	'Accounting'	,	'Accounting'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountingPro'	,	'Professional'	,	'Accounting'	,	'Accounting'	
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountingPro'	,	'Professional'	,	'Accounting'	,	'Accounting'		
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountingPro'	,	'Professional'	,	'Accounting'	,	'Accounting'	

EXEC	domain.Insert_PackageClassification	'NL' 	,	'EOLAccountancyCol'	,	'Collaborate'	,	'Accountancy'	,	'Accountancy'				
EXEC	domain.Insert_PackageClassification	'BE' 	,	'EOLAccountancyCol'	,	'collaborate'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'DE' 	,	'EOLAccountancyCol'	,	'collaborate'	,	'Accountancy'	,	'Accountancy'
EXEC	domain.Insert_PackageClassification	'UK' 	,	'EOLAccountancyCol'	,	'collaborate'	,	'Accountancy'	,	'Accountancy'	
EXEC	domain.Insert_PackageClassification	'US' 	,	'EOLAccountancyCol'	,	'collaborate'	,	'Accountancy'	,	'Accountancy'		
EXEC	domain.Insert_PackageClassification	'FR' 	,	'EOLAccountancyCol'	,	'collaborate'	,	'Accountancy'	,	'Accountancy'	
						

-- Update the BankLinkFunctionality based on the INGBankLink functionality tick/no tick in Master Data -- Back Office in EOL Hosting
UPDATE domain.PackageClassification
SET BankLinkFunctionality = 1

UPDATE domain.PackageClassification
SET BankLinkFunctionality = 0
WHERE Edition = 'Basic' AND Product IN ('Accounting', 'Accountancy')

UPDATE domain.PackageClassification
SET BankLinkFunctionality = 1
WHERE PackageCode IN ('EOLEducatieAvans', 'EOLLite', 'EOLStarter', 'EOLAangifte')

UPDATE domain.PackageClassification
SET BankLinkFunctionality = 0
WHERE PackageCode IN ('EOLAangifte', 'EOLGLB', 'EOLEducatieToerist', 'GO', 'EOLSalaris_Pilot')


-- Updates the SalesInvoiceFunctionality field for package classification 
UPDATE domain.PackageClassification
SET SalesInvoiceFunctionality = 1

UPDATE domain.PackageClassification
SET SalesInvoiceFunctionality = 0
WHERE Edition = 'Basic' AND Product IN ('Accounting', 'Accountancy')

UPDATE domain.PackageClassification
SET SalesInvoiceFunctionality = 0
WHERE Edition = 'Advanced' AND Product = 'Accounting'

UPDATE domain.PackageClassification
SET SalesInvoiceFunctionality = 0
WHERE PackageCode IN ('EOLSoleTrader', 'EOLStarterBasic', 'EOLAangifte', 'EOLAccountancyAccon', 'EOLBoekhoudenOnderwijsinst', 'GO', 'EOLEducatie - Leerling', 'EOLEducatie - Leraar')


END
