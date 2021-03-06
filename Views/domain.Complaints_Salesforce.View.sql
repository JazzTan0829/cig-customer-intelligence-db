USE [CustomerIntelligence]
GO
/****** Object:  View [domain].[Complaints_Salesforce]    Script Date: 24-sept.-18 14:31:57 ******/
DROP VIEW IF EXISTS [domain].[Complaints_Salesforce]
GO
/****** Object:  View [domain].[Complaints_Salesforce]    Script Date: 24-sept.-18 14:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [domain].[Complaints_Salesforce]
AS
SELECT
	CA.Id AS CaseID, 
	CA.CaseNumber, 
	CASE WHEN LEN(RTRIM(LTRIM(AC.Exact_ID__c))) = 36 AND CHARINDEX('-', AC.Exact_ID__c, 1) = 9 THEN CONVERT( uniqueidentifier, RTRIM(LTRIM(AC.Exact_ID__c))) ELSE NULL END AS AccountID ,
	CA.Account_Hosting_Environment__c AS Environment,
	AC.AccountNumber AS AccountCode,	
	CO.UserID__c AS UserID,
	CA.Origin AS Origin,
	Cast(DATEADD(mi, DATEDIFF(mi, GETUTCDATE(), GETDATE()),CA.CreatedDate) AS Date) AS [Opened Date], 
	DATEADD(mi, DATEDIFF(mi, GETUTCDATE(), GETDATE()),CA.CreatedDate) AS [Date/Time Opened],
	Cast(DATEADD(mi, DATEDIFF(mi, GETUTCDATE(), GETDATE()),CA.ClosedDate) AS Date) AS [Closed Date], 
	DATEADD(mi, DATEDIFF(mi, GETUTCDATE(), GETDATE()),CA.ClosedDate) AS [Date/Time Closed],
	RT.Name AS [Case Record Type],       
	CA.Type AS [Type],
	CA.Main_Reason__c AS [Main Reason],
	CA.Sub_Reason__c AS [Sub Reason],
	CA.Subject AS [Subject],
	CA.Description AS [Description],
	CA.Solution__c AS [Solution],
	CA.X2nd_Line_Help__c AS [Second Line Support],
	CA.Date_Time_Reopened__c as [Reopen Date],
	CA.Date_Time_Answered__c as [Answered Date],	
	OW.[Name] AS [Case Owner],
	OW.Alias AS [Case Owner Alias],	
	CA.Owner_Role__c AS [Case Owner Role],
	CA.Number_of_times_reopened__c AS [Number of times reopened],
	AC.Subscription__c AS [Subscription],
	CA.[Status] AS [Status]

FROM [raw].Salesforce_Case_Latest CA

LEFT JOIN [raw].Salesforce_User_Latest OW
ON CA.OwnerId = OW.Id

LEFT JOIN [raw].Salesforce_Account_Latest AC
ON CA.AccountId=AC.Id

LEFT JOIN [raw].Salesforce_Contact_Latest CO
ON CA.ContactId=CO.Id

LEFT JOIN [raw].Salesforce_RecordType_Latest RT
ON CA.RecordTypeId=RT.Id

WHERE CA.Type='EOL Customer Complaint'



GO
