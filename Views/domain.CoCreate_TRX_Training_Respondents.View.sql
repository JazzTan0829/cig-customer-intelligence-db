USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[CoCreate_TRX_Training_Respondents]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[CoCreate_TRX_Training_Respondents]
GO
/****** Object:  View [domain].[CoCreate_TRX_Training_Respondents]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [domain].[CoCreate_TRX_Training_Respondents]
AS
SELECT
	[recordid] as [Record ID],
	CASE WHEN [Q10_1] ='GB' THEN 'UK' ELSE Q10_1 END AS [Hosting Environment],
	[Q1_1] as [Company Name],
	[Q1_2] as [First and Last Name],
	[Q1_3] as [Email Address],
	CASE [Q2]
		WHEN '1' THEN 'Basic training Accountancy'
		WHEN '2' THEN 'Basic training Exact Online'
		WHEN '3' THEN 'Basic training Invoicing'
		WHEN '4' THEN 'Basic training Wholesale Distribution'
		WHEN '5' THEN 'Basic training Production'
		WHEN '6' THEN 'Basic training Project Management'
		WHEN '7' THEN 'Basic training Salaris'
		WHEN '8' THEN 'Basic training Time & Billing'
		WHEN '9' THEN ''
		else [Q2] END AS [Training],
	CASE [Q3]
		WHEN '1' THEN 'Bob Kessels'
		WHEN '2' THEN 'Elvan Kose'
		WHEN '3' THEN 'Fransisca Kapitein'
		WHEN '4' THEN 'Kenneth de Cooman'
		WHEN '5' THEN 'Lisa Huigsloot'
		WHEN '6' THEN 'Onno Slot'
		WHEN '7' THEN 'Philippe de Baveye'
		WHEN '8' THEN 'Stijn Rydams'
		WHEN '9' THEN 'Other'
		ELSE [Q3] END AS [Trainer],
	[Q3SPECIFIED_9] as [Other trainer],
	case when (cast( [Q14_A_1] as int) < 1) then null when (cast ([Q14_A_1] as int) = 12) then null when (cast ([Q14_A_1] as int) >= 1) then Q14_A_1-1 end  as [Training met expectations],
	case when (cast( [Q14_A_2] as int) < 1) then null when (cast ([Q14_A_2] as int) = 12) then null when (cast ([Q14_A_2] as int) >= 1) then Q14_A_2-1 end  as [Trainer was knowledgeable],
	case when (cast( [Q14_A_3] as int) < 1) then null when (cast ([Q14_A_3] as int) = 12) then null when (cast ([Q14_A_3] as int) >= 1) then Q14_A_3-1 end  as [Good overview of possibilities],
	case when (cast( [Q14_A_4] as int) < 1) then null when (cast ([Q14_A_4] as int) = 12) then null when (cast ([Q14_A_4] as int) >= 1) then Q14_A_4-1 end  as [Would recommend the training],
	[Q15] as [Comments / Suggestions Training],
	case when ([Q12] < 1) then null when ([Q12] >= 1) then Q12-1 end  as [NPS],
	[Q13] as [NPS Verbatim],
	[Q8] as [Guidance],
	Case 
		when [modified] < '2017-06-01' AND [Q8]='1' then 'Help texts'
		when [modified] < '2017-06-01' AND [Q8]='2' then 'Videos'
		when [modified] < '2017-06-01' AND [Q8]='3' then 'Online training'
		when [modified] < '2017-06-01' AND [Q8]='4' then 'Support'
		when [modified] < '2017-06-01' AND [Q8]='5' then 'Consultancy'
		when [modified] < '2017-06-01' AND [Q8]='6' then 'Other, please specify'
		
		when [modified] > '2017-05-31' AND [Q8]='1' then 'Custom fit training on location (how to work with Exact Online)'
		when [modified] > '2017-05-31' AND [Q8]='2' then 'Live online training given by trainer'
		when [modified] > '2017-05-31' AND [Q8]='3' then 'Standardized e-learning/online training'
		when [modified] > '2017-05-31' AND [Q8]='4' then 'Support (by phone)'
		when [modified] > '2017-05-31' AND [Q8]='5' then 'Consultation on location (help with setting up administration)'
		when [modified] > '2017-05-31' AND [Q8]='6' then 'Other, please specify'
	END as [Guidance Description],

	[Q8SPECIFIED_6] as [Other guidance],
	[Q16] as [Comments / Suggestions Exact],
	case when ([Q25_A_1] < 1) then null when ([Q25_A_1] >= 1) then Q25_A_1 end as [EX Save time],
	case when ([Q25_A_2] < 1) then null when ([Q25_A_2] >= 1) then Q25_A_2 end as [EX Collaboration with third parties],
	case when ([Q25_A_3] < 1) then null when ([Q25_A_3] >= 1) then Q25_A_3 end as [EX Anticipate business needs],
	case when ([Q25_A_4] < 1) then null when ([Q25_A_4] >= 1) then Q25_A_4 end as [EX Administration advice],
	case when ([Q25_A_5] < 1) then null when ([Q25_A_5] >= 1) then Q25_A_5 end as [EX Reaching business aims],
	case when ([Q25_A_6] < 1) then null when ([Q25_A_6] >= 1) then Q25_A_6 end as [EX Insights into administration],
	case when ([Q25_A_7] < 1) then null when ([Q25_A_7] >= 1) then Q25_A_7 end as [EX Efficiency of administration],
	case when ([Q25_A_8] < 1) then null when ([Q25_A_8] >= 1) then Q25_A_8 end as [EX Taking care of administration],
	[Q31] as [Effectiveness of Exact],
	cast ([started] as datetime) as [Started],
	cast ([completed] as datetime) as [Completed],
	cast ([branched_out] as datetime) as [Branched Out],
	cast ([over_quota] as datetime) as [Over Quota],
	cast ([modified] as datetime) as [Last Modified],
	cast ([LatestImportDate] as datetime) as [Latest Import Date],
	CASE
		WHEN [Q10_1] = 'DE' THEN 'Germany'
		WHEN [Q10_1] = 'UK' THEN 'United Kingdom'
		WHEN [Q10_1] = 'GB' THEN 'United Kingdom'
		WHEN [Q10_1] = 'US' THEN 'United States'
		WHEN [Q10_1] = 'NL' THEN 'Netherlands'
		WHEN [Q10_1] = 'ES' THEN 'Spain'
		WHEN [Q10_1] = 'FR' THEN 'France'
		WHEN [Q10_1] = 'BE' THEN 'Belgium'
		WHEN [Q10_1] IS NULL THEN 'Netherlands'
		ELSE [Q10_1] END AS [Country],
	CASE
		WHEN CAST([Q12] AS int) >= 1 AND CAST([Q12] AS int)< 8  THEN 'Detractor'
		WHEN CAST([Q12] AS int) > 7 AND CAST([Q12] AS int)< 10 THEN 'Passive'
		WHEN CAST([Q12] AS int) > 9 THEN 'Promoter'
		ELSE NULL END AS [PromPasDet],
	CASE WHEN CAST([Q12] AS int) >= 1 AND CAST([Q12] AS int)< 8  THEN 1 ELSE 0 END AS [Detractor],
	CASE WHEN CAST([Q12] AS int) > 7 AND CAST([Q12] AS int)< 10 THEN 1 else 0 end as [Passive],
	CASE WHEN CAST([Q12] AS int) > 9 THEN 1 else 0 end as [Promoter],
	CASE WHEN [Q12] >=1 THEN 1 ELSE 0 END AS [NPS respondent?],
	CASE [campaign_status]
		WHEN '70' THEN 'Opened not started'
		WHEN '80' THEN 'Survey started'
		WHEN '90' THEN 'Unsubscribed'
		WHEN '98' THEN 'Branched out'
		WHEN '99' THEN 'Over quota'
		WHEN '100' THEN 'Completed survey'
		ELSE [campaign_status] END as [Campaign Status]
FROM [raw].[Verint_EOL_Training_2017_Survey]

GO
