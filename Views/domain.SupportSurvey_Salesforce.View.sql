USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[SupportSurvey_Salesforce]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[SupportSurvey_Salesforce]
GO
/****** Object:  View [domain].[SupportSurvey_Salesforce]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================================================================================================
-- Author:		Alex Green 
-- Create date: 11/10/2017
-- Description:	Creates a view of the raw.Salesforce_Survey table. This provides a more consumable version
-- ===============================================================================================================================================



-- CREATES THE NEW VIEW OF THE TABLE
CREATE VIEW [domain].[SupportSurvey_Salesforce]
AS

SELECT
	SFS.ID AS SupportSurveyID
	, SFS.Case__c AS CaseID
	, SFS.CreatedDate
	, OW.UserID__c AS CreatedByUserID
	, SFS.LastModifiedDate
	, SFS.CurrencyIsoCode
	, SFS.IsDeleted
	, SFS.[New_Question_1__c] AS New_Question_1
    , SFS.[New_Question_2__c] AS New_Question_2
    , SFS.[New_Question_3__c] AS New_Question_3
    , SFS.[New_Question_4__c] AS New_Question_4
    , SFS.[New_Question_5__c] AS New_Question_5
	, SFS.New_Converted_Answer_1__c AS New_Converted_Answer_1
	, SFS.New_Answer_2__c AS New_Answer_2
	, SFS.New_Answer_3__c AS New_Answer_3
	, SFS.New_Converted_Answer_4__c AS New_Converted_Answer_4
	, SFS.New_Answer_5__c AS New_Answer_5
	, SFS.Promoter__c AS Promoter
	, SFS.Detractor__c AS Detractor
	
FROM [CustomerIntelligence].[raw].[Salesforce_Survey] SFS

LEFT JOIN [raw].Salesforce_User_Latest OW
	ON SFS.CreatedById = OW.Id

WHERE SFS.CreatedDate >= '2017-05-10 15:24:18.000'	-- This is the first record after the 'new' version of Support Survey
GO
