USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_User_Latest]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Salesforce_User_Latest]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_User_Latest]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-02-05
-- Description:	Load Procedure Latest Salesforce Table
-- =============================================
CREATE PROCEDURE [raw].[Load_Salesforce_User_Latest] 
AS
BEGIN 
TRUNCATE TABLE raw.Salesforce_User_Latest
END
BEGIN
	
WITH Salesforce_User_Latest
	(	
	[Id] , 
	[UserID__c], 
	[CommunityNickname], 
	[UserType], 
	[ProfileId], 
	[ContactId], 
	[ExactIDAccount__c], 
	[LastModifiedDate], 
	[EtlInsertTime], 
	[Alias], 
	FirstName, 
	MiddleName, 
	LastName, 
	[Name], 
	RN )
	AS
	(
		SELECT 
			[Id] , 
			TRY_CONVERT( uniqueidentifier, RTRIM(LTRIM(UserID__c))) AS UserID__c, 
			[CommunityNickname], 
			[UserType], 
			[ProfileId], 
			[ContactId], 
			[ExactIDAccount__c], 
			[LastModifiedDate], 
			[EtlInsertTime], 
			[Alias],
			FirstName, 
			MiddleName, 
			LastName, 
			[Name],
			ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
		FROM [raw].[Salesforce_User]
	)

INSERT INTO raw.Salesforce_User_Latest
(
	[Id], 
	[UserID__c], 
	[CommunityNickname], 
	[UserType], 
	[ProfileId], 
	[ContactId], 
	[ExactIDAccount__c], 
	[LastModifiedDate], 
	[EtlInsertTime], 
	[Alias], 
	[FirstName], 
	[MiddleName], 
	[LastName], 
	[Name]
)
SELECT 
	[Id] 
	, UserID__c
	, [CommunityNickname]
	, [UserType]
	, [ProfileId]
	, [ContactId]
	, [ExactIDAccount__c]
	, [LastModifiedDate]	
	, [EtlInsertTime]
	, [Alias]
	, FirstName
	, MiddleName
	, LastName
	, [Name]

FROM Salesforce_User_Latest
WHERE RN=1
--AND UserID__c IS NOT NULL
END
GO
