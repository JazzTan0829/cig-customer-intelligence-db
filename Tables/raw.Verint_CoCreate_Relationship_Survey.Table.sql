USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Verint_CoCreate_Relationship_Survey]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Verint_CoCreate_Relationship_Survey]
GO
/****** Object:  Table [raw].[Verint_CoCreate_Relationship_Survey]    Script Date: 24-sept.-18 14:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Verint_CoCreate_Relationship_Survey](
	[LatestImportDate] [datetime] NULL,
	[recordid] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q26_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_4] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_5] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_6] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_7] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_8] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_9] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_10] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_11] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_12] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_13] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_14] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_15] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_16] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_17] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_18] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_19] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_20] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_21] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_22] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_23] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_24] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_25] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_26] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_27] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_28] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_29] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_30] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_31] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_32] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_33] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_34] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_35] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_36] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_37] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_38] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_39] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_40] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_41] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q24_42] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q27_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q27_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q27_3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q27_4] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q27_5] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q27_6] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_4] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_5] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_6] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_7] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_8] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_9] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_10] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_11] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_12] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_13] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q28_14] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q29_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q29_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q6] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q8] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q8SPECIFIED_6] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q10] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q11] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q12_A_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q12_A_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q12_A_3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q12_A_4] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q7] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q13_A_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q13_A_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q13_A_3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q13_A_4] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q13_A_5] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q15_A_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q15_A_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q15_A_3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q15_A_4] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q15_A_5] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q14_A_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q14_A_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q14_A_3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q14_A_4] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q16_A_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q16_A_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q16_A_3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q16_A_4] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q16_A_5] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q16_A_6] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q16_A_7] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q16_A_8] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q16_A_9] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q30_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q17_A_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q17_A_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q17_A_3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q17_A_4] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q18_A_1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q18_A_2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q18_A_3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q19] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q20] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q22] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[panelistid] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[started] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[completed] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[branched_out] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[over_quota] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[modified] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[invite_status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[campaign_status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[culture] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[user_key1] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[user_key2] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[user_key3] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[http_referer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[http_user_agent] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[remote_addr] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[remote_host] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[initial_date] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[initial_status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reminder1_date] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reminder1_status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reminder2_date] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reminder2_status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reminder3_date] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reminder3_status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reminder4_date] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reminder4_status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thankyou_date] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thankyou_status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[close_date] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_page] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fi_loaded] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_page_number] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[modifier] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[device_type] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ua_family] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ua_majorver] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[os_name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[os_family] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_long] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_lat] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_city] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_state] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_country] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_zipcode] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q31] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q32] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
