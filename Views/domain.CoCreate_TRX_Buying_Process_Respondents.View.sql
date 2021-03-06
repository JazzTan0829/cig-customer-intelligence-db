USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[CoCreate_TRX_Buying_Process_Respondents]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[CoCreate_TRX_Buying_Process_Respondents]
GO
/****** Object:  View [domain].[CoCreate_TRX_Buying_Process_Respondents]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [domain].[CoCreate_TRX_Buying_Process_Respondents]
AS
SELECT
	[recordid] as [Record ID],
	[Q34_1] as [Title],
	[Q34_2] as [Description],
	[Q34_3] as [First name],
	[Q34_4] as [Middle Name],
	[Q34_5] as [Last name],
	[Q34_6] as [Gender],
	[Q34_7] as [Initials],
	[Q34_8] as [Usertype],
	[Q34_9] as [Language],
	[Q34_10] as [Email Address],
	[Q34_11] as [Phone],
	[Q34_12] as [Last Login],
	[Q34_13] as [Maincontact],
	[Q34_14] as [Account code],
	[Q34_15] as [Account name],
	[Q34_16] as [Classification],
	[Q34_17] as [Customer Since],
	[Q34_18] as [Tenure in Months],
	[Q34_19] as [Customer Since Month],
	CASE Q34_20
		WHEN 'Eenmansbedrijf' THEN '1'
		WHEN 'Eenmansbedriijf' THEN '1'
		WHEN '2 - 4 medewerkers' THEN '2 - 4'
		WHEN '5 - 9 medewerkers' THEN '5 - 9'
		WHEN '10 - 19 medewerkers' THEN '10 - 19'
		WHEN '20 - 49 medewerkers' THEN '20 - 49'
		WHEN '50 - 99 medewerkers' THEN '50 - 99'
		WHEN '100 - 499 medewerkers' THEN '100 - 499'
		WHEN '500 - 999 medewerkers' THEN '500 - 999'
		WHEN 'Vanaf 1000 medewerkers' THEN '1000 +'
		WHEN 'NULL' THEN NULL
		ELSE Q34_20 END AS [Company Size],
	[Q34_21] as [Sector],
	[Q34_22] as [Subsector],
	[Q34_23] as [Country 1],
	[Q34_24] as [Source],
	[Q34_25] as [Accountant code],
	[Q34_26] as [Accountant name],
	[Q34_27] as [Reseller code],
	[Q34_28] as [Reseller name],
	[Q34_29] as [DatabaseID],
	[Q34_30] as [Is Accountant],
	[Q34_31] as [Blocked],
	[Q34_32] as [Is Pilot],
	[Q34_33] as [Is Reseller],
	[Q34_34] as [Number of companies],
	[Q34_35] as [Number of users],
	[Q34_36] as [Package],
	[Q34_37] as [Business line],
	[Q34_38] as [Solution],
	[Q34_39] as [MRR],
	[Q34_40] as [Conversion requests],
	[Q34_41] as [Consult requests],
	[Q34_42] as [Support requests],
	[Q35_1] as [Salutation],
	[Q36_1] as [Startdate user],
	[Q36_2] as [User in months],
	[Q36_3] as [Startdate package],
	[Q36_4] as [Package in months],
	[Q36_5] as [Hosting Environment],
	[Q36_6] as [Export date],
	[Q37_1] as [Office],
	[Q37_2] as [Address 1],
	[Q37_3] as [Address 2],
	[Q37_4] as [Address 3],
	[Q37_5] as [Inactive user],
	[Q37_6] as [Website],
	[Q37_7] as [Twitter],
	[Q37_8] as [Linkedin],
	[Q37_9] as [Consult date],
	[Q37_10] as [App center],
	[Q37_11] as [Name consultant],
	[Q37_12] as [Privacy],
	[Q37_13] as [Disclaimer],
	[Q37_14] as [Consult package],
	[Q38_1] as [Contract end date],
	[Q39_1] as [Account manager  code],
	[Q39_2] as [Account manager  name],
	case [Q2] when '1' then 'Via my accountant ' when '2' then 'Via an Exact employee' when '3' then 'Via an Exact partner' when '4' then 'Via another Exact customer' when '5' then 'Via a search engine' when '6' then 'Via social media' when '7' then 'Via an advertisement in a magazine' when '8' then 'Via a radio commercial' when '9' then 'Via a banner on a website' when '10' then 'Via an event' when '11' then 'Via en email' when '12' then 'Other' end as [How did you find out about Exact?],
	[Q2SPECIFIED_12] as [How did you find out about Exact, other],
	case when (cast( [Q26_A_1] as int) < 1) then null when (cast ([Q26_A_1] as int) = 12) then null when (cast ([Q26_A_1] as int) >= 1) then Q26_A_1-1 end  as [OFS Website],
	case when (cast( [Q26_A_2] as int) < 1) then null when (cast ([Q26_A_2] as int) = 12) then null when (cast ([Q26_A_2] as int) >= 1) then Q26_A_2-1 end  as [OFS Trial],
	case when (cast( [Q26_A_3] as int) < 1) then null when (cast ([Q26_A_3] as int) = 12) then null when (cast ([Q26_A_3] as int) >= 1) then Q26_A_3-1 end  as [OFS Sales representative],
	case when (cast( [Q26_A_4] as int) < 1) then null when (cast ([Q26_A_4] as int) = 12) then null when (cast ([Q26_A_4] as int) >= 1) then Q26_A_4-1 end  as [OFS Acccountant],
	case [Q29] when  '1' then 'Exact Website' when '2' then 'Trial Subscription' when '3' then 'Sales representative' when '4' then 'Accountant' when '5' then 'Exact partner' when '6' then 'Other Exact customer' when '7' then 'Social Media' when '8' then 'Event' when '9' then 'Other' else Q29 end as [Main reason for choosing Exact],
	[Q29SPECIFIED_9] as [Main reason for choosing Exact, other],
	case when (cast( [Q3_A_1] as int) < 1) then null when (cast ([Q3_A_1] as int) = 12) then null when (cast ([Q3_A_1] as int) >= 1) then Q3_A_1-1 end  as [WS Easy to find information],
	case when (cast( [Q3_A_2] as int) < 1) then null when (cast ([Q3_A_2] as int) = 12) then null when (cast ([Q3_A_2] as int) >= 1) then Q3_A_2-1 end  as [WS Sufficient information available],
	case when (cast( [Q3_A_3] as int) < 1) then null when (cast ([Q3_A_3] as int) = 12) then null when (cast ([Q3_A_3] as int) >= 1) then Q3_A_3-1 end  as [WS Information is easy to understand],
	case when (cast( [Q3_A_4] as int) < 1) then null when (cast ([Q3_A_4] as int) = 12) then null when (cast ([Q3_A_4] as int) >= 1) then Q3_A_4-1 end  as [WS Information helped me choose the right subscription],
	[Q5] as [WS Comments],
	case when (cast( [Q11_A_1] as int) < 1) then null when (cast ([Q11_A_1] as int) = 12) then null when (cast ([Q11_A_1] as int) >= 1) then Q11_A_1-1 end  as [TR Trial helped me choose the right subscription],
	case when (cast( [Q11_A_2] as int) < 1) then null when (cast ([Q11_A_2] as int) = 12) then null when (cast ([Q11_A_2] as int) >= 1) then Q11_A_2-1 end  as [TR Trial period is long enough],
	case when (cast( [Q11_A_3] as int) < 1) then null when (cast ([Q11_A_3] as int) = 12) then null when (cast ([Q11_A_3] as int) >= 1) then Q11_A_3-1 end  as [TR Trial met my expectations],
	case when (cast( [Q11_A_4] as int) < 1) then null when (cast ([Q11_A_4] as int) = 12) then null when (cast ([Q11_A_4] as int) >= 1) then Q11_A_4-1 end  as [TR Trial subscription is easy to get started],
	[Q12] as [TR Comments],
	case when (cast( [Q13_A_1] as int) < 1) then null when (cast ([Q13_A_1] as int) = 12) then null when (cast ([Q13_A_1] as int) >= 1) then Q13_A_1-1 end  as [SR Support during purchase process],
	case when (cast( [Q13_A_2] as int) < 1) then null when (cast ([Q13_A_2] as int) = 12) then null when (cast ([Q13_A_2] as int) >= 1) then Q13_A_2-1 end  as [SR Product Knowledge],
	case when (cast( [Q13_A_3] as int) < 1) then null when (cast ([Q13_A_3] as int) = 12) then null when (cast ([Q13_A_3] as int) >= 1) then Q13_A_3-1 end  as [SR Communication skills],
	case when (cast( [Q13_A_4] as int) < 1) then null when (cast ([Q13_A_4] as int) = 12) then null when (cast ([Q13_A_4] as int) >= 1) then Q13_A_4-1 end  as [SR Problem-solving skills],
	case when (cast( [Q13_A_5] as int) < 1) then null when (cast ([Q13_A_5] as int) = 12) then null when (cast ([Q13_A_5] as int) >= 1) then Q13_A_5-1 end  as [SR Fulfillment of promises],
	case when (cast( [Q13_A_6] as int) < 1) then null when (cast ([Q13_A_6] as int) = 12) then null when (cast ([Q13_A_6] as int) >= 1) then Q13_A_6-1 end  as [SR Reachability of the sales department],
	[Q14] as [SR Comments],
	case when (cast( [Q15_A_1] as int) < 1) then null when (cast ([Q15_A_1] as int) = 12) then null when (cast ([Q15_A_1] as int) >= 1) then Q15_A_1-1 end  as [AC Support during purchase process],
	case when (cast( [Q15_A_2] as int) < 1) then null when (cast ([Q15_A_2] as int) = 12) then null when (cast ([Q15_A_2] as int) >= 1) then Q15_A_2-1 end  as [AC Product knowledge],
	case when (cast( [Q15_A_3] as int) < 1) then null when (cast ([Q15_A_3] as int) = 12) then null when (cast ([Q15_A_3] as int) >= 1) then Q15_A_3-1 end  as [AC Problem-solving skills],
	[Q16] as [AC Comments],
	case when (cast( [Q19] as int) < 1) then null when (cast ([Q19] as int) = 12) then null when (cast ([Q19] as int) >= 1) then Q19-1 end  as [Bookkeeping knowledge],
	case when ([Q22] < 1) then null when ([Q22] >= 1) then Q22-1 end as [NPS],
	[Q23] as [NPS Verbatim],
	[panelistid] as [Panelist ID],
	cast ([started] as datetime) as [Started],
	cast ([completed] as datetime) as [Completed],
	cast ([branched_out] as datetime) as [Branched Out],
	cast ([over_quota] as datetime) as [Over Quota],
	cast ([modified] as datetime) as [Last Modified],
	[invite_status] as [Invite_Status],
	[campaign_status] as [Campaign_Status],
	[culture] as [Culture],
	[user_key1] as [User_Key1],
	[user_key2] as [User_Key2],
	[user_key3] as [User_Key3],
	[http_referer] as [Http_Referer],
	[http_user_agent] as [Http_User_Agent],
	[remote_addr] as [Remote_Addr],
	[remote_host] as [Remote_Host],
	cast ([initial_date] as datetime) as [Initial_Date],
	[initial_status] as [Initial_Status],
	cast ([reminder1_date] as datetime) as [Reminder1_Date],
	[reminder1_status] as [Reminder1_Status],
	cast ([reminder2_date] as datetime) as [Reminder2_Date],
	[reminder2_status] as [Reminder2_Status],
	cast ([reminder3_date] as datetime) as [Reminder3_Date],
	[reminder3_status] as [Reminder3_Status],
	cast ([reminder4_date] as datetime) as [Reminder4_Date],
	[reminder4_status] as [Reminder4_Status],
	cast ([thankyou_date] as datetime) as [Thankyou_Date],
	[thankyou_status] as [Thankyou_Status],
	cast ([close_date] as datetime) as [Close_Date],
	[last_page] as [Last_Page],
	[fi_loaded] as [Fi_Loaded],
	[last_page_number] as [Last_Page_Number],
	[modifier] as [Modifier],
	[device_type] as [Device_Type],
	[ua_family] as [Ua_Family],
	[ua_majorver] as [Ua_Majorver],
	[os_name] as [Os_Name],
	[os_family] as [Os_Family],
	[iploc_long] as [Iploc_Long],
	[iploc_lat] as [Iploc_Lat],
	[iploc_city] as [Iploc_City],
	[iploc_state] as [Iploc_State],
	[iploc_country] as [Iploc_Country],
	[iploc_zipcode] as [Iploc_Zipcode],
	cast ([LatestImportDate] as datetime) as [Latest Import Date],
	CASE
		WHEN [Q36_5]='DE' THEN 'Germany'
		WHEN [Q36_5]='UK' THEN 'United Kingdom'
		WHEN [Q36_5]='GB' THEN 'United Kingdom'
		WHEN [Q36_5]='US' THEN 'United States'
		WHEN [Q36_5]='NL' THEN 'Netherlands'
		WHEN [Q36_5]='ES' THEN 'Spain'
		WHEN [Q36_5]='FR' THEN 'France'
		WHEN [Q36_5]='BE' THEN 'Belgium'
		WHEN [Q36_5] IS NULL THEN 'Netherlands'
		ELSE [Q36_5] END AS [Country],
	CASE
		WHEN CAST([Q22] AS int) >=1 AND CAST([Q22] AS int)<8  THEN 'Detractor'
		WHEN CAST([Q22] AS int) >7 AND CAST([Q22] AS int)<10 THEN 'Passive'
		WHEN CAST([Q22] AS int) >9 THEN 'Promoter'
		ELSE NULL END AS [PromPasDet],
	CASE WHEN CAST([Q22] AS int) >=1 AND CAST([Q22] AS int)<8  THEN 1 ELSE 0 END AS [Detractor],
	CASE WHEN CAST([Q22] AS int) >7 AND CAST([Q22] AS int)<10 THEN 1 else 0 end as [Passive],
	CASE WHEN CAST([Q22] AS int) >9 THEN 1 else 0 end as [Promoter],
	CASE WHEN [Q22] >=1 THEN 1 ELSE 0 END AS [NPS respondent?],
	CASE [campaign_status]
		WHEN '70' THEN 'Opened not started'
		WHEN '80' THEN 'Survey started'
		WHEN '90' THEN 'Unsubscribed'
		WHEN '98' THEN 'Branched out'
		WHEN '99' THEN 'Over quota'
		WHEN '100' THEN 'Completed survey'
		ELSE [campaign_status] END as [Campaign Status]
FROM [raw].[Verint_EOL_TRX_Buy_Process_Survey]
GO
