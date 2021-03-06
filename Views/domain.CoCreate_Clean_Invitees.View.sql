USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[CoCreate_Clean_Invitees]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[CoCreate_Clean_Invitees]
GO
/****** Object:  View [domain].[CoCreate_Clean_Invitees]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [domain].[CoCreate_Clean_Invitees]
AS SELECT *, CASE 
	--WHEN (user_key1 = '2014/05') THEN '2014/06' 
	--WHEN (user_key1 = '2014/11') THEN '2014/12' 
	--WHEN (user_key1 = '2015/11') THEN '2015/12' 
	--WHEN (user_key1 = '2016/05') THEN '2016/06' 	
	--WHEN (user_key1 = '2016/11') then '2016/12'
	--WHEN (user_key1 = '2017/05') THEN '2017/06' 	
	--WHEN (user_key1 = '2017/11') then '2017/12'
	WHEN (user_key1 LIKE '%/05') THEN CONCAT(LEFT(user_key1,5),'06')
	WHEN (user_key1 LIKE '%/11') THEN CONCAT(LEFT(user_key1,5),'12')
	ELSE user_key1 END AS [Wave]
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
 FROM [raw].Verint_Participants_CoCreate

GO
