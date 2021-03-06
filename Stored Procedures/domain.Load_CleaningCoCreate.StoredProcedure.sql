USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_CleaningCoCreate]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_CleaningCoCreate]
GO
/****** Object:  StoredProcedure [domain].[Load_CleaningCoCreate]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2016-10-07
-- Description:	Clean the CoCreate data
-- =============================================
CREATE PROCEDURE [domain].[Load_CleaningCoCreate] 
AS
BEGIN
TRUNCATE TABLE domain.[CoCreate_Clean]
INSERT INTO domain.[CoCreate_Clean]
SELECT
[recordid] AS [Record ID],

CASE 
	--WHEN (user_key1 = '2014/05') THEN '2014/06' 
	--WHEN (user_key1 = '2014/11') THEN '2014/12' 
	--WHEN (user_key1 = '2015/11') THEN '2015/12' 
	--WHEN (user_key1 = '2016/05') THEN '2016/06' 	
	--WHEN (user_key1 = '2016/11') then '2016/12'
	--WHEN (user_key1 = '2017/05') THEN '2017/06' 	
	--WHEN (user_key1 = '2017/11') then '2017/12'
	WHEN (user_key1 LIKE '%/05') THEN CONCAT(LEFT(user_key1,5),'06')
	WHEN (user_key1 LIKE '%/11') THEN CONCAT(LEFT(user_key1,5),'12')
	ELSE user_key1
END AS [Wave],
CASE 
	WHEN ([campaign_status] = '70') THEN 'Opened not started' 
	WHEN ([campaign_status] = '80') THEN 'Survey started' 
	WHEN ([campaign_status] = '90') THEN 'Unsubscribed' 
	WHEN ([campaign_status] = '98') THEN 'Branched out' 
	WHEN ([campaign_status] = '99') THEN 'Over quota' 
	WHEN ([campaign_status] = '100') THEN 'Completed survey' 
	WHEN ([campaign_status] not in ('70','80','90','98','99','100')) THEN [campaign_status] END as [Campaign Status],

[Q24_10] AS [Email Address],
[Q24_14] as [AccountCode],
[Q24_16] as [Classification],
[Q24_17] as [Customer Since],
[Q24_19] as [Customer Since Month],

CASE Q24_20 WHEN 'Eenmansbedrijf' THEN '1' 
WHEN '2 - 4 medewerkers' THEN '2 - 4' 
WHEN '5 - 9 medewerkers' THEN '5 - 9' 
WHEN '10 - 19 medewerkers' THEN '10 - 19' 
WHEN '20 - 49 medewerkers' THEN '20 - 49' 
WHEN '50 - 99 medewerkers' THEN '50 - 99'
WHEN '100 - 499 medewerkers' THEN '100 - 499'
WHEN '500 - 999 medewerkers' THEN '500 - 999'
WHEN 'Vanaf 1000 medewerkers' THEN '1000 +'
WHEN 'NULL' THEN null else Q24_20 END AS [Company Size],
CASE WHEN (Q24_21 = 'NULL') THEN null WHEN (Q24_21 != 'NULL') THEN Q24_21 END AS [Sector],
CASE WHEN (Q24_22 = 'NULL') THEN null WHEN (Q24_22 != 'NULL') THEN Q24_22 END AS [Subsector],
CASE WHEN (Q24_24 = 'NULL') THEN null WHEN (Q24_24 != 'NULL') THEN Q24_24 END AS [Source],
CASE WHEN (Q24_25 = 'NULL') THEN null WHEN (Q24_25 != 'NULL') THEN Q24_25 END AS [Accountant Code],
CASE WHEN (Q24_26 = 'NULL') THEN null WHEN (Q24_26 != 'NULL') THEN Q24_26 END AS [Accountant Name],
CASE WHEN (Q24_27 = 'NULL') THEN null WHEN (Q24_27 != 'NULL') THEN Q24_27 END AS [Reseller Code],
CASE WHEN (Q24_28 = 'NULL') THEN null WHEN (Q24_28 != 'NULL') THEN Q24_28 END AS [Reseller Name],
PC1.Solution AS Solution,
PC1.Product AS Product,
PC1.Edition AS Edition,
--CASE Q24_37 
--	WHEN 'Easy' THEN 'Accounting'
--	WHEN 'SB' THEN 'Industry' 
--	WHEN 'EDU' THEN 'Other' 
--	WHEN 'PS' THEN 'Other' 
--	WHEN 'NULL' THEN null else  Q24_37 END AS [Solution],

--CASE 
--	WHEN q24_38 in ('AccountancyAdvanced', 'AccountancyBasic') THEN 'Accountancy' 
--	WHEN Q24_38 in ('MfgAdvanced','MfgBasic') THEN 'Manufacturing' 
--	WHEN Q24_38 in ('PS', 'PSAAdvanced', 'PSABasic', 'PSAPremium') THEN 'Professional services' 
--	WHEN Q24_38 in ('WDAdvanced','WDBasic','WDPremium','WDPSABasic', 'Wholesale') THEN 'Wholesale Distribution'
--	WHEN (Q24_38 = 'NULL') THEN null 
--	ELSE Q24_38 END AS [Product],

--CASE  
--	WHEN Q24_36 IN ('NULL') THEN null 
--	WHEN Q24_36 IN ('EOLBasic','EOLBasic RodeKruis','EOLAccountancyBasic','EOLAccountancyBasis','EOLUrenFacturen','EOLHandel', 'EOLTradeQB','EOLManufacturingQB','EOLProductie', 'EOLACC2','EOLAccountancy') THEN 'Basic' 
--	WHEN Q24_36 IN ('EOLAdvanced', 'EOLAccountancyAdvanced', 'EOLAccountancyAdvMW', 'EOLTradeAdvQB','EOLAccountancyAccon','EOLaccountancy07','EOLHandelAdvanced','EOLPSAAdvanced','EOLManufactAdvQB', 'EOLProductieAdvanced', 'EOLAccountancyAccon', 'EOLaccountancy07') THEN 'Advanced' 
--	WHEN Q24_36 IN ('EOLPremium', 'EOLAccountancyPremium', 'EOLHandelPremium', 'EOLPSPremium', 'EOLProductiePremium','EOLTradePreQB') THEN 'Premium'
--	WHEN Q24_36 IN ('EOLInvoicing', 'XEOLINVOICING') THEN 'Invoicing'
--	WHEN Q24_36='EOLReseller' THEN 'Reseller'
--	WHEN Q24_36='EOLSalaris' THEN 'Other'
--	WHEN Q24_36 IN ('EOLSoleTrader','EOLStarterBasic') THEN 'Sole Trader'   
--	WHEN Q24_36 IN ('EOLVATMARGIN','EOLVATMARGIN2','EOLProductieUren','EOLHandelOnderwijsinstelling','EOLHandelUren','EOLROTARY') THEN 'Other'
--else Q24_36 END AS [Edition],

CASE WHEN (Q27_1 = 'NULL') THEN null WHEN (Q27_1 != 'NULL') THEN Q27_1 END AS [User Since],
CASE WHEN (Q27_3 = 'NULL') THEN null WHEN (Q27_3 != 'NULL') THEN Q27_3 END AS [Package Since],
CASE 
		WHEN Q27_5 IS NULL THEN 'NL'
		WHEN Q27_5 LIKE '%GB%' THEN 'UK' 
		ELSE Q27_5 END AS [Hosting Environment],
CASE WHEN (Q29_2 = 'NULL') THEN null WHEN (Q29_2 != 'NULL') THEN Q29_2 END AS [Account Manager Name],
CASE WHEN (Q30_1 < 1) THEN NULL WHEN (Q30_1 >= 1) THEN Q30_1- 1 END AS [SEND Email HUX],
CASE WHEN (Q19 < 1) THEN NULL WHEN (Q19 >= 1) THEN Q19- 1 END AS [Industry],
CASE WHEN (Q20 < 1) THEN NULL WHEN (Q20 >= 1) THEN Q20- 1 END AS [User Type],
[Q6] as [NPS verbatim],
[Q22] as [Improvements],
[Q8SPECIFIED_6] as [Other Referral],

[Q24_18] as [Tenure in Months],

CASE WHEN (Q24_18 > 0) and (Q24_18 <=3) THEN '< 3' WHEN (Q24_18 > 3) and (Q24_18 <=6) THEN '3 - 6' WHEN (Q24_18 > 6) and (Q24_18 <=12) THEN '6 - 12' WHEN (Q24_18 > 12) and (Q24_18 <=24) THEN '12 - 24' WHEN (Q24_18 > 24) and (Q24_18 <= 36) THEN '24 - 36' WHEN (Q24_18 > 36) THEN '> 36' END as [Tenure Range],

CASE WHEN (Q24_33 = 'NULL') THEN null WHEN (Q24_33 = '0') THEN 'No' WHEN (Q24_33 = 1) THEN 'Yes' else Q24_33 END AS [Is Reseller],

CASE WHEN (Q24_34 = 'NULL') THEN null WHEN (Q24_34 != 'NULL') THEN Q24_34 END AS [Number Of Administrations],

CASE WHEN (Q24_35 = 'NULL') THEN null WHEN q24_35 = 1 THEN '1' WHEN q24_35 = 2 THEN '2' WHEN q24_35 = 3 THEN '3' WHEN q24_35 = 4 THEN '4' WHEN q24_35 = 5 THEN '5' WHEN (Q24_35 > 5) and (Q24_35 <=10) THEN '6 - 10' WHEN (Q24_35 > 10) and (Q24_35 <=20) THEN '10 - 20' WHEN (Q24_35 > 20) and (Q24_35 <=30) THEN '20 - 30' WHEN (Q24_35 > 30) and (Q24_35 <=40) THEN '30 - 40' WHEN (Q24_35 > 40) and (Q24_35 <=50) THEN '40 - 50' WHEN (Q24_35 > 50) THEN '50 +' else Q24_35 END AS [Number Of Users],

CASE WHEN (Q24_39 = 'NULL') THEN null WHEN (Q24_39 != 'NULL') THEN Q24_39 END AS [MRR],
CASE WHEN (Q24_40 = 'NULL') THEN null WHEN (Q24_40 != 'NULL') THEN Q24_40 END AS [Conversion Requests],
CASE WHEN (Q24_41 = 'NULL') THEN null WHEN (Q24_41 != 'NULL') THEN Q24_41 END AS [Consult Requests],
CASE WHEN (Q24_42 = 'NULL') THEN null WHEN (Q24_42 != 'NULL') THEN Q24_42 END AS [Support Requests],
CASE WHEN (Q27_2 = 'NULL') THEN null WHEN (Q27_2 != 'NULL') THEN Q27_2 END AS [User in Months],
CASE WHEN (Q27_4 = 'NULL') THEN null WHEN (Q27_4 != 'NULL') THEN Q27_4 END AS [Package in Months],

CASE WHEN Q24_13 = 'Maincontact' THEN 'Yes'  WHEN Q24_13 is null THEN 'No' END AS [Main Contact],

CASE WHEN (Q8 < 1) THEN NULL WHEN (Q8 >= 1) THEN Q8- 1 END AS [Referral],
CASE WHEN (Q10 < 1) THEN NULL WHEN (Q10 >= 1) THEN Q10- 1 END AS [Positive Referral],
CASE WHEN (Q11 < 1) THEN NULL WHEN (Q11 >= 1) THEN Q11- 1 END AS [Negative Referral],
CASE WHEN (Q1 < 1) THEN NULL WHEN (Q1 >= 1) THEN Q1- 1 END AS [NPS],
CASE WHEN ([Q12_A_1] < 1) THEN NULL WHEN ([Q12_A_1] >= 1) THEN [Q12_A_1] - 1 END AS [BR Exact is an innovative company],
CASE WHEN (Q12_A_2 < 1) THEN NULL WHEN (Q12_A_2 >= 1) THEN Q12_A_2- 1 END AS [BR Exact provides safe and reliable solutions],
CASE WHEN (Q12_A_3 < 1) THEN NULL WHEN (Q12_A_3 >= 1) THEN Q12_A_3- 1 END AS [BR Exact is a trusted partner],
CASE WHEN (Q12_A_4 < 1) THEN NULL WHEN (Q12_A_4 >= 1) THEN Q12_A_4- 1 END AS [BR Exact communicates in a clear manner],
CASE WHEN (Q7 < 1) THEN NULL WHEN (Q7 >= 1) THEN Q7- 1 END AS [Continue Using],
CASE WHEN (Q13_A_1 < 1) THEN NULL WHEN (Q13_A_1 >= 1) THEN Q13_A_1- 1 END AS [Buying Experience],
CASE WHEN (Q13_A_2 < 1) THEN NULL WHEN (Q13_A_2 >= 1) THEN Q13_A_2- 1 END AS [Getting Started Experience],
CASE WHEN (Q13_A_3 < 1) THEN NULL WHEN (Q13_A_3 >= 1) THEN Q13_A_3- 1 END AS [Product Experience],
CASE WHEN (Q13_A_4 < 1) THEN NULL WHEN (Q13_A_4 >= 1) THEN Q13_A_4- 1 END AS [Customer Support Experience],
CASE WHEN (Q13_A_5 < 1) THEN NULL WHEN (Q13_A_5 >= 1) THEN Q13_A_5- 1 END AS [Invoicing Experience],

CASE WHEN (Q14_A_1 < 1) THEN NULL WHEN (Q14_A_1 >= 1) THEN Q14_A_1- 1 END AS [GS Ease of understanding how to get started],
CASE WHEN (Q14_A_2 < 1) THEN NULL WHEN (Q14_A_2 >= 1) THEN Q14_A_2- 1 END AS [GS Training options available],
CASE WHEN (Q14_A_3 < 1) THEN NULL WHEN (Q14_A_3 >= 1) THEN Q14_A_3- 1 END AS [GS Ease of migrating data to Exact Online],
CASE WHEN (Q14_A_4 < 1) THEN NULL WHEN (Q14_A_4 >= 1) THEN Q14_A_4- 1 END AS [GS Availability of consulting services],

CASE WHEN (Q15_A_1 < 1) THEN NULL WHEN (Q15_A_1 >= 1) THEN Q15_A_1- 1 END AS [BY Clarity of solution information available on our website pricing and features],
CASE WHEN (Q15_A_2 < 1) THEN NULL WHEN (Q15_A_2 >= 1) THEN Q15_A_2- 1 END AS [BY Ease of comparing different solution options],
CASE WHEN (Q15_A_3 < 1) THEN NULL WHEN (Q15_A_3 >= 1) THEN Q15_A_3- 1 END AS [BY Ease of identifying the solution to suit your needs],
CASE WHEN (Q15_A_4 < 1) THEN NULL WHEN (Q15_A_4 >= 1) THEN Q15_A_4- 1 END AS [BY The sales person you spoke to advised you on the appropriate solution to meet your business needs],
CASE WHEN (Q15_A_5 < 1) THEN NULL WHEN (Q15_A_5 >= 1) THEN Q15_A_5- 1 END AS [BY Ease of filling out order form on the website],

CASE WHEN (Q16_A_1 < 1) THEN NULL WHEN (Q16_A_1 >= 1) THEN Q16_A_1- 1 END AS [PR Ease of use],
CASE WHEN (Q16_A_2 < 1) THEN NULL WHEN (Q16_A_2 >= 1) THEN Q16_A_2- 1 END AS [PR The performance of the software speed],
CASE WHEN (Q16_A_3 < 1) THEN NULL WHEN (Q16_A_3 >= 1) THEN Q16_A_3- 1 END AS [PR The solution works as expected],
CASE WHEN (Q16_A_4 < 1) THEN NULL WHEN (Q16_A_4 >= 1) THEN Q16_A_4- 1 END AS [PR Content of help documentation],
CASE WHEN (Q16_A_5 < 1) THEN NULL WHEN (Q16_A_5 >= 1) THEN Q16_A_5- 1 END AS [PR Add-ons offered in the App Centre],
CASE WHEN (Q16_A_6 < 1) THEN NULL WHEN (Q16_A_6 >= 1) THEN Q16_A_6- 1 END AS [PR The range of available  features and functionality],
CASE WHEN (Q16_A_7 < 1) THEN NULL WHEN (Q16_A_7 >= 1) THEN Q16_A_7- 1 END AS [PR Communication on new features/functionality available],
CASE WHEN (Q16_A_8 < 1) THEN NULL WHEN (Q16_A_8 >= 1) THEN Q16_A_8- 1 END AS [PR The solution meets your needs],
CASE WHEN (Q16_A_9 < 1) THEN NULL WHEN (Q16_A_9 >= 1) THEN Q16_A_9- 1 END AS [PR Ease of changing your subscription/package],

CASE WHEN (Q17_A_1 < 1) THEN NULL WHEN (Q17_A_1 >= 1) THEN Q17_A_1- 1 END AS [CS Ease of contacting support],
CASE WHEN (Q17_A_2 < 1) THEN NULL WHEN (Q17_A_2 >= 1) THEN Q17_A_2- 1 END AS [CS Knowledge of support team],
CASE WHEN (Q17_A_3 < 1) THEN NULL WHEN (Q17_A_3 >= 1) THEN Q17_A_3- 1 END AS [CS The time taken to solve your request],
CASE WHEN (Q17_A_4 < 1) THEN NULL WHEN (Q17_A_4 >= 1) THEN Q17_A_4- 1 END AS [CS Frequency of updates on open support requests],

CASE WHEN (Q18_A_1 < 1) THEN NULL WHEN (Q18_A_1 >= 1) THEN Q18_A_1- 1 END AS [IV Accuracy of invoices],
CASE WHEN (Q18_A_2 < 1) THEN NULL WHEN (Q18_A_2 >= 1) THEN Q18_A_2- 1 END AS [IV Clarity of the information in the invoice],
CASE WHEN (Q18_A_3 < 1) THEN NULL WHEN (Q18_A_3 >= 1) THEN Q18_A_3- 1 END AS [IV Speed of resolving invoicing issues],

[CustomerIntelligence].[domain].[Accounts].[SectorCode] ,[SubSectorCode],
CASE [CustomerIntelligence].[domain].[Accounts].[SectorCode]
WHEN 'A' THEN 'A: Agriculture, forestry and fishing'
WHEN 'B' THEN 'B: Mining and quarrying'
WHEN 'C' THEN 'C: Manufacturing'
WHEN 'D' THEN 'D: Electricity, gas, steam and air conditioning supply'
WHEN 'E' THEN 'E: Water supply; sewerage, waste managementand remediation activities'
WHEN 'F' THEN 'F: Construction'
WHEN 'G' THEN 'G: Wholesale and retail trade; repair of motor vehicles and motorcycles'
WHEN 'H' THEN 'H: Transportation and storage'
WHEN 'I' THEN 'I: Accommodation and food service activities'
WHEN 'J' THEN 'J: Information and communication'
WHEN 'K' THEN 'K: Financial and insurance activities'
WHEN 'L' THEN 'L: Real estate activities'
WHEN 'M' THEN 'M: Professional, scientific and technical activities'
WHEN 'N' THEN 'N: Administrative and support service activities'
WHEN 'O' THEN 'O: Public administration and defence; compulsory social security'
WHEN 'P' THEN 'P: Education'
WHEN 'Q' THEN 'Q: Human health and social work activities'
WHEN 'R' THEN 'R: Arts, entertainment and recreation'
WHEN 'S' THEN 'S: Other service activities'
WHEN 'U' THEN 'U: Extraterritorial organisations and bodies'
WHEN 'NULL' THEN null
else SectorCode END as [SectorDescription],

CASE [CustomerIntelligence].[domain].[Accounts].[SubSectorCode]
WHEN '01' THEN '1: Agriculture and related service activities'
WHEN '02' THEN '2: Forestry and logging'
WHEN '03' THEN '3: Fishing and aquaculture'
WHEN '06' THEN '6: Extraction of crude petroleum and natural gas'
WHEN '08' THEN '8: Mining and quarrying (no oil and gas)'
WHEN '09' THEN '9: Mining support activities'
WHEN '10' THEN '10: Manufacture of food products'
WHEN '11' THEN '11: Manufacture of beverages'
WHEN '13' THEN '13: Manufacture of textiles'
WHEN '14' THEN '14: Manufacture of wearing apparel'
WHEN '15' THEN '15: Manufacture of leather, products of leather and footwear'
WHEN '16' THEN '16: Manufacture of wood and of products of wood and cork, except furniture; manufacture of articles of straw and plaiting materials'
WHEN '17' THEN '17: Manufacture of paper and paper products'
WHEN '18' THEN '18: Printing and reproduction of recorded media'
WHEN '19' THEN '19: Manufacture of coke and refined petroleum products'
WHEN '20' THEN '20: Manufacture of chemicals and chemical products'
WHEN '21' THEN '21: Manufacture of basic pharmaceutical products and pharmaceutical preparations'
WHEN '22' THEN '22: Manufacture of rubber and plastic products'
WHEN '23' THEN '23: Manufacture of other non-metallic mineral products'
WHEN '24' THEN '24: Manufacture of basic metals'
WHEN '25' THEN '25: Manufacture of fabricated metal products, except machinery and equipment'
WHEN '26' THEN '26: Manufacture of computers, electronic and optical products'
WHEN '27' THEN '27: Manufacture of electrical equipment'
WHEN '28' THEN '28: Manufacture of machinery and equipment n.e.c.'
WHEN '29' THEN '29: Manufacture of motor vehicles, trailers and semi-trailers'
WHEN '30' THEN '30: Manufacture of other transport equipment'
WHEN '31' THEN '31: Manufacture of furniture'
WHEN '32' THEN '32: Manufacture of other products n.e.c.'
WHEN '33' THEN '33: Repair and installation of machinery and equipment'
WHEN '35' THEN '35: Electricity, gas, steam and air conditioning supply'
WHEN '36' THEN '36: Collection, purification and distribution of water'
WHEN '37' THEN '37: Sewerage'
WHEN '38' THEN '38: Waste collection, treatment and disposal activities; materials recovery'
WHEN '39' THEN '39: Remediation activities and other waste management'
WHEN '41' THEN '41: Construction of buildings and development of building projects'
WHEN '42' THEN '42: Civil engineering'
WHEN '43' THEN '43: Specialised construction activities'
WHEN '45' THEN '45: Sale and repair of motor vehicles, motorcycles and trailers'
WHEN '46' THEN '46: Wholesale trade (no motor vehicles and motorcycles)'
WHEN '47' THEN '47: Retail trade (not in motor vehicles)'
WHEN '49' THEN '49: Land transport'
WHEN '50' THEN '50: Water transport'
WHEN '51' THEN '51: Air transport'
WHEN '52' THEN '52: Warehousing and support activities for transportation'
WHEN '53' THEN '53: Postal and courier activities'
WHEN '55' THEN '55: Accommodation'
WHEN '56' THEN '56: Food and beverage service activities'
WHEN '58' THEN '58: Publishing'
WHEN '59' THEN '59: Motion picture and television programme production and distribution; sound recording and music publishing'
WHEN '60' THEN '60: programmeming and broadcasting'
WHEN '61' THEN '61: Telecommunications'
WHEN '62' THEN '62: Support activities in the field of information technology'
WHEN '63' THEN '63: Information service activities'
WHEN '64' THEN '64: Financial institutions, except insurance and pension funding'
WHEN '65' THEN '65: Insurance and pension funding (no compulsory social security)'
WHEN '66' THEN '66: Other financial services'
WHEN '68' THEN '68: Renting and buying and selling of real estate'
WHEN '69' THEN '69: Legal services, accounting, tax consultancy, administration'
WHEN '70' THEN '70: Holding companies (not financial)'
WHEN '71' THEN '71: Architects, engineers and technical design and consultancy; testing and analysis'
WHEN '72' THEN '72: Research and development'
WHEN '73' THEN '73: Advertising and market research'
WHEN '74' THEN '74: Industrial design, photography, translation and other consultancy'
WHEN '75' THEN '75: Veterinary activities'
WHEN '77' THEN '77: Renting and leasing of motor vehicles, consumer goods, machines and other tangible goods'
WHEN '78' THEN '78: Employment placement, provision of temporary employment and payrolling'
WHEN '79' THEN '79: Travel agencies, tour operators, tourist information and reservation services'
WHEN '80' THEN '80: Security and investigation'
WHEN '81' THEN '81: Facility management'
WHEN '82' THEN '82: Other business services'
WHEN '84' THEN '84: Public administration public services and compulsory social security'
WHEN '85' THEN '85: Education'
WHEN '86' THEN '86: Human health activities'
WHEN '87' THEN '87: Residential care and guidance'
WHEN '88' THEN '88: Social work activities without accommodation'
WHEN '90' THEN '90: Arts'
WHEN '91' THEN '91: Lending of cultural goods, public archives, museums, botanical and zoological'
WHEN '92' THEN '92: Lotteries and betting'
WHEN '93' THEN '93: Sports and recreation'
WHEN '94' THEN '94: World view and political organizations, interest and ideological organizations,'
WHEN '95' THEN '95: Repair of computers and consumer goods'
WHEN '96' THEN '96: Wellness and other services; funeral activities'
WHEN '99' THEN '99: Extraterritorial organisations and bodies'
WHEN 'NULL' THEN null
else SubSectorCode END as [SubSectorDescription]
,[panelistid]
,[started]
,Cast(completed as datetime) AS [completed]
,[branched_out]
,[over_quota]
,[modified]
,CASE
	WHEN ([invite_status]='Status') THEN 'Invitation'
	WHEN ([invite_status]='0') THEN 'Initial Invitation'
	WHEN ([invite_status]='1') THEN 'First Reminder'
	WHEN ([invite_status]='2') THEN 'Second Reminder'
	WHEN ([invite_status]='3') THEN 'Third Reminder'
	WHEN ([invite_status]='4') THEN 'Fourth Reminder'
	WHEN ([invite_status]='50') THEN 'Not sent - Invalid address'
	WHEN ([invite_status]='51') THEN 'Not sent - Undeliverable'
	WHEN ([invite_status]='100') THEN 'Thank You'
	ELSE [invite_status]
	END AS [Invite Status]
 
,CASE 
	WHEN ([campaign_status]='10') THEN 'In queue'
	WHEN ([campaign_status]='20') THEN 'Sent'
	WHEN ([campaign_status]='30') THEN 'Undeliverable'
	WHEN ([campaign_status]='31') THEN 'Undeliverable'
	WHEN ([campaign_status]='32') THEN 'Undeliverable'
	WHEN ([campaign_status]='34') THEN 'Undeliverable'
	WHEN ([campaign_status]='70') THEN 'Opened Not Started'
	WHEN ([campaign_status]='80') THEN 'Survey Started'
	WHEN ([campaign_status]='90') THEN 'Unsubscribed'
	WHEN ([campaign_status]='98') THEN 'Branched Out'
	WHEN ([campaign_status]='99') THEN 'Over Quota'
	WHEN ([campaign_status]='100') THEN 'Completed Survey'
	ELSE [campaign_status]
	END AS [Campaign Status]
,[culture]
,[user_key1]
,[user_key2]
,[user_key3]
,[http_referer]
,[http_user_agent]
,[remote_addr]
,[remote_host]
,Cast([initial_date] AS datetime)
,[initial_status]
,Cast([reminder1_date] AS datetime)
,[reminder1_status]
,Cast([reminder2_date] AS datetime)
,[reminder2_status]
,Cast([reminder3_date] AS datetime)
,[reminder3_status]
,Cast([reminder4_date] AS datetime)
,[reminder4_status]
,Cast([thankyou_date] AS datetime)
,[thankyou_status]
,Cast([close_date] AS datetime)
,[last_page]
,[fi_loaded]
,[last_page_number]
,[modifier]
, PC.PackageCode AS [PackageCodeWhenLastModified]
, PC.Solution AS [SolutionWhenLastModified]
, PC.Product AS [ProductWhenLastModified]
, PC.Edition AS [EditionWhenLastModified]
, ACPM.MRR AS [MRR]
, ACPM.CommercialLifetimeMonths AS [Tenure]
, ACPM.NumberOfUsers AS [NumberOfUsers]
, ACPM.NumberOfAvailableAdmins AS [NumberOfAvailableAdministrations]
, CASE 
	WHEN CAST([completed] AS date) >= '2014-05-19' AND CAST([completed] AS date) <= '2014-06-30' THEN '2014/06'
	WHEN CAST([completed] AS date) >= '2014-09-09' AND CAST([completed] AS date) <= '2014-10-30' THEN '2014/09'
	WHEN CAST([completed] AS date) >= '2014-11-25' AND CAST([completed] AS date) <= '2014-12-30' THEN '2014/12'
	WHEN CAST([completed] AS date) >= '2015-03-04' AND CAST([completed] AS date) <= '2015-04-30' THEN '2015/03'
	WHEN CAST([completed] AS date) >= '2015-06-03' AND CAST([completed] AS date) <= '2015-06-30' THEN '2015/06'
	WHEN CAST([completed] AS date) >= '2015-09-09' AND CAST([completed] AS date) <= '2015-10-30' THEN '2015/09'
	WHEN CAST([completed] AS date) >= '2015-11-24' AND CAST([completed] AS date) <= '2015-12-30' THEN '2015/12'
	WHEN CAST([completed] AS date) >= '2016-03-16' AND CAST([completed] AS date) <= '2016-04-30' THEN '2016/03'
	WHEN CAST([completed] AS date) >= '2016-05-24' AND CAST([completed] AS date) <= '2016-06-30' THEN '2016/06'
	WHEN CAST([completed] AS date) >= '2016-09-07' AND CAST([completed] AS date) <= '2016-09-30' THEN '2016/09'
	WHEN CAST([completed] AS date) >= '2016-11-23' AND CAST([completed] AS date) <= '2016-12-22' THEN '2016/12'
	WHEN CAST([completed] AS date) >= '2017-02-24' AND CAST([completed] AS date) <= '2017-03-25' THEN '2017/03'
	WHEN CAST([completed] AS date) >= '2017-05-26' AND CAST([completed] AS date) <= '2017-06-24' THEN '2017/06'
	WHEN CAST([completed] AS date) >= '2017-08-25' AND CAST([completed] AS date) <= '2017-09-23' THEN '2017/09'
	WHEN CAST([completed] AS date) >= '2017-11-24' AND CAST([completed] AS date) <= '2017-12-23' THEN '2017/12'
	WHEN (Q1 IS NOT NULL AND Q1<>'0') AND [completed] IS NULL THEN	(
																	CASE
																	WHEN CAST([started] AS date) >= '2014-05-19' AND CAST([started] AS date) <= '2014-06-30' THEN '2014/06'
																	WHEN CAST([started] AS date) >= '2014-09-09' AND CAST([started] AS date) <= '2014-10-30' THEN '2014/09'
																	WHEN CAST([started] AS date) >= '2014-11-25' AND CAST([started] AS date) <= '2014-12-30' THEN '2014/12'
																	WHEN CAST([started] AS date) >= '2015-03-04' AND CAST([started] AS date) <= '2015-04-30' THEN '2015/03'
																	WHEN CAST([started] AS date) >= '2015-06-03' AND CAST([started] AS date) <= '2015-06-30' THEN '2015/06'
																	WHEN CAST([started] AS date) >= '2015-09-09' AND CAST([started] AS date) <= '2015-10-30' THEN '2015/09'
																	WHEN CAST([started] AS date) >= '2015-11-24' AND CAST([started] AS date) <= '2015-12-30' THEN '2015/12'
																	WHEN CAST([started] AS date) >= '2016-03-16' AND CAST([started] AS date) <= '2016-04-30' THEN '2016/03'
																	WHEN CAST([started] AS date) >= '2016-05-24' AND CAST([started] AS date) <= '2016-06-30' THEN '2016/06'
																	WHEN CAST([started] AS date) >= '2016-09-07' AND CAST([started] AS date) <= '2016-09-30' THEN '2016/09'
																	WHEN CAST([started] AS date) >= '2016-11-23' AND CAST([started] AS date) <= '2016-12-22' THEN '2016/12'
																	WHEN CAST([started] AS date) >= '2017-02-24' AND CAST([started] AS date) <= '2017-03-25' THEN '2017/03'
																	WHEN CAST([started] AS date) >= '2017-05-26' AND CAST([started] AS date) <= '2017-06-24' THEN '2017/06'
																	WHEN CAST([started] AS date) >= '2017-08-25' AND CAST([started] AS date) <= '2017-09-23' THEN '2017/09'
																	WHEN CAST([started] AS date) >= '2017-11-24' AND CAST([started] AS date) <= '2017-12-23' THEN '2017/12'
																	END
																	)
	ELSE NULL END AS [Wave Responded]
, CASE
	WHEN CAST([Q1] AS int) >='1' AND CAST([Q1] AS int)<'8'  THEN 'Detractor'
	WHEN CAST([Q1] AS int) >'7' AND CAST([Q1] AS int)<'10' THEN 'Passive'
	WHEN CAST([Q1] AS int) >'9'  THEN 'Promoter' 
	ELSE NULL END AS [American NPS PromPasDet]
, CASE
	WHEN CAST([Q1] AS int) >='1' AND CAST([Q1] AS int)<'7' AND ([Q27_5]<>'US' OR [Q27_5] IS NULL) THEN 'Detractor'
	WHEN CAST([Q1] AS int) >'6' AND CAST([Q1] AS int)<'9' AND ([Q27_5]<>'US' OR [Q27_5] IS NULL) THEN 'Passive'
	WHEN CAST([Q1] AS int) >'8' AND ([Q27_5]<>'US' OR [Q27_5] IS NULL) THEN 'Promoter' 
	WHEN CAST([Q1] AS int) >='1' AND CAST([Q1] AS int)<'8' AND [Q27_5]='US'  THEN 'Detractor'
	WHEN CAST([Q1] AS int) >'7' AND CAST([Q1] AS int)<'10' AND [Q27_5]='US' THEN 'Passive'
	WHEN CAST([Q1] AS int) >'9' AND [Q27_5]='US' THEN 'Promoter' 
	ELSE NULL END AS [European NPS PromPasDet]
,1 AS [US Promoter]
,1 AS [US Passive]
,1 AS [US Detractor]
,1 AS [EU Promoter]
,1 AS [EU Passive]
,1 AS [EU Detractor]
,1 AS [NPS respondent?]
,CASE 
	WHEN [Q27_5]='DE' THEN 'Germany' 
	WHEN [Q27_5]='UK' THEN 'United Kingdom' 
	WHEN [Q27_5]='GB' THEN 'United Kingdom'
	WHEN [Q27_5]='US' THEN 'United States' 
	WHEN [Q27_5]='NL' THEN 'Netherlands' 
	WHEN [Q27_5]='ES' THEN 'Spain' 
	WHEN [Q27_5]='FR' THEN 'France' 
	WHEN [Q27_5]='BE' THEN 'Belgium' 
	WHEN [Q27_5] IS NULL THEN 'Netherlands'
	else [Q27_5] end as [Country]
,[Q24_2] as [Title]
,[Q24_3] as [First name]
,[Q24_4] as [Middle name]
,[Q24_5] as [Last name]
,[Q24_6] as [Gender]
,[Q24_15] as [Account name],
Case [Q20] when '1' then 'Decision maker' when '2' then 'Influencer' when '3' then 'End user' end as [Consider yourself],
Q31 AS [Exact Ideas],
Q32 AS [Exact Ideas rating]




            
FROM [CustomerIntelligence].[raw].[Verint_CoCreate_Relationship_Survey]

LEFT JOIN [CustomerIntelligence].[domain].[Accounts] 
ON [Verint_CoCreate_Relationship_Survey].[Q24_14] = [CustomerIntelligence].[domain].[Accounts].[Accountcode]

LEFT JOIN domain.AccountsContract_PerMonth AS ACPM
ON	ACPM.AccountCode = [raw].[Verint_CoCreate_Relationship_Survey].[Q24_14]
	AND ACPM.Year = YEAR(cast([raw].[Verint_CoCreate_Relationship_Survey].[modified] AS DATE))
	AND ACPM.Month = Month(cast([raw].[Verint_CoCreate_Relationship_Survey].[modified] AS DATE))

LEFT JOIN domain.PackageClassification PC
ON ACPM.PackageCode=PC.PackageCode 
AND ACPM.Environment=PC.Environment

LEFT JOIN domain.PackageClassification PC1
ON Q24_36=PC1.PackageCode
AND (CASE 
		WHEN Q27_5 IS NULL THEN 'NL'
		WHEN Q27_5 LIKE '%GB%' THEN 'UK' 
		ELSE Q27_5 END)= PC1.Environment

WHERE [user_key1] not in ('2015/10','201509test','201511','test150303-1200') and Q24_36 not in ('EOLAccountancyELearning', 'EOLVOLVOT') and Q24_38 not in ('Payroll')
END

BEGIN
UPDATE domain.[CoCreate_Clean]
SET [US Promoter]= CASE [American NPS PromPasDet] WHEN 'Promoter' THEN '1' ELSE '0' END

UPDATE domain.[CoCreate_Clean]
SET [US Passive]= CASE [American NPS PromPasDet] WHEN 'Passive' THEN '1' ELSE '0' END

UPDATE domain.[CoCreate_Clean]
SET [US Detractor]= CASE [American NPS PromPasDet] WHEN 'Detractor' THEN '1' ELSE '0' END

UPDATE domain.[CoCreate_Clean]
SET [EU Promoter]= CASE [European NPS PromPasDet] WHEN 'Promoter' THEN '1' ELSE '0' END

UPDATE domain.[CoCreate_Clean]
SET [EU Passive]= CASE [European NPS PromPasDet] WHEN 'Passive' THEN '1' ELSE '0' END

UPDATE domain.[CoCreate_Clean]
SET [EU Detractor]= CASE [European NPS PromPasDet] WHEN 'Detractor' THEN '1' ELSE '0' END

UPDATE domain.[CoCreate_Clean]
SET [NPS respondent?]= CASE WHEN [NPS] IS NOT NULL THEN '1' ELSE '0' END

UPDATE domain.[CoCreate_Clean]
SET [Wave Responded]='2015/09'
WHERE [Record ID] IN ('635802376801284290','635802376817534746','635802376829722655','635802376839097240')

END
GO
