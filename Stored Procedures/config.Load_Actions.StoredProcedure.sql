USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [config].[Load_Actions]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [config].[Load_Actions]
GO
/****** Object:  StoredProcedure [config].[Load_Actions]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===========================================================================================================================================================
-- Author:		Alex Green
-- Create date: 22-07-2016
-- Description:	This inserts the specific actions driven by CIG into the Actions table. These actions are hardcoded. For each new action the code below will
--				need to be copied and pasted below, then updated with the new action. This way we do not get duplicate entries into the Actions table.
-- ===========================================================================================================================================================

CREATE PROCEDURE [config].[Load_Actions]
AS

EXEC config.Insert_Actions 1, 'Call',  'No system', 'Customers with no save activity after 30 days of commercial contract lifetime are called', 'Customer Succes', '0', NULL ,NULL,NULL,NULL,NULL
EXEC config.Insert_Actions 2, 'In Product Message',  'Evergage', 'Customers with a lifetime between 14-180 days without a linked accountant receive an IPM encouraging them to link', 'Horizontal UX', '0', NULL ,NULL,NULL,NULL,NULL
EXEC config.Insert_Actions 3, 'E-mail',  'Eloqua', 'Customers selected to receive the Action ID2 IPM but did not link to an accountant after 8 days receive a follow-up e-mail', 'Marketing', '0', NULL ,NULL,NULL,NULL,NULL
EXEC config.Insert_Actions 4, 'Call',  'Customer Progress Requests EOL', 'Existing industry customers with a closed customer progress request that then display 28 consequtive days of no activity will be called', 'Account Management', '0', 'LoadAction_ID4', NULL, NULL, NULL, '1'
EXEC config.Insert_Actions 5, 'Call',  'No system', 'Existing industry customers that did not have a customer progress request and display 28 consequtive days of no activity will be called', 'Customer Succes', '0', NULL ,NULL,NULL,NULL,NULL
EXEC config.Insert_Actions 6, 'In Product Message',  'Evergage', 'EOLPremium (NL) and EOLAdvanced (UK) customers of at least 60 days that have not sent an invoice receive an IPM', 'Customer Succes', '0', NULL ,NULL,NULL,NULL,NULL
GO
