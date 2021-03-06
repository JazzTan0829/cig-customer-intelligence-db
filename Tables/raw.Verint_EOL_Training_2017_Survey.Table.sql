USE [CustomerIntelligence]
GO
/****** Object:  Table [raw].[Verint_EOL_Training_2017_Survey]    Script Date: 24-sept.-18 14:20:57 ******/
DROP TABLE IF EXISTS [raw].[Verint_EOL_Training_2017_Survey]
GO
/****** Object:  Table [raw].[Verint_EOL_Training_2017_Survey]    Script Date: 24-sept.-18 14:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[Verint_EOL_Training_2017_Survey](
	[recordid] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q10_1] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q1_1] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q1_2] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q1_3] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q2] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q3] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q3SPECIFIED_9] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q14_A_1] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q14_A_2] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q14_A_3] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q14_A_4] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q15] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q12] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q13] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q8] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q8SPECIFIED_6] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q16] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q25_A_1] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q25_A_2] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q25_A_3] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q25_A_4] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q25_A_5] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q25_A_6] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q25_A_7] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q25_A_8] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Q31] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[started] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[completed] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[branched_out] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[over_quota] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[modified] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[campaign_status] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[culture] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[http_referer] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[http_user_agent] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[remote_addr] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[remote_host] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_page] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fi_loaded] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_page_number] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[modifier] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[device_type] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ua_family] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ua_majorver] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[os_name] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[os_family] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_long] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_lat] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_city] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_state] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_country] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[iploc_zipcode] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LatestImportDate] [datetime] NULL
) ON [PRIMARY]
GO
