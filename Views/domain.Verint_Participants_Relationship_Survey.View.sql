USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Verint_Participants_Relationship_Survey]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Verint_Participants_Relationship_Survey]
GO
/****** Object:  View [domain].[Verint_Participants_Relationship_Survey]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [domain].[Verint_Participants_Relationship_Survey]
AS
SELECT [Recordid]
      ,[Email]
      ,[Panelistid]
      ,[Started]
      ,[Completed]
      ,[Branched_out]
      ,[Over_quota]
      ,[Modified]
      ,[Invite_status]
      ,[Campaign_status]
      ,[Culture]
      ,[User_key1]
      ,[User_key2]
      ,[User_key3]
      ,[Http_referer]
      ,[Http_user_agent]
      ,[Remote_addr]
      ,[Remote_host]
      ,[Initial_date]
      ,[Initial_status]
      ,[Reminder1_date]
      ,[Reminder1_status]
      ,[Reminder2_date]
      ,[Reminder2_status]
      ,[Reminder3_date]
      ,[Reminder3_status]
      ,[Reminder4_date]
      ,[Reminder4_status]
      ,[Thankyou_date]
      ,[Thankyou_status]
      ,[Close_date]
      ,[Last_page]
      ,[Fi_loaded]
      ,[Url]
      ,[Last_page_number]
      ,[Modifier]
      ,[Device_type]
      ,[Ua_family]
      ,[Ua_majorver]
      ,[Os_name]
      ,[Os_family]
      ,[Iploc_long]
      ,[Iploc_lat]
      ,[Iploc_city]
      ,[Iploc_state]
      ,[Iploc_country]
      ,[Iploc_zipcode]
      ,[ProjectId]
      ,[CIGCopyTime]
  FROM [CustomerIntelligence].[raw].[Verint_Participants_Relationship_Survey] (nolock)

GO
