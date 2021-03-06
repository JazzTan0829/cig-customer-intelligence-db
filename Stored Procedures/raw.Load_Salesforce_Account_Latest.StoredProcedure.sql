USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_Account_Latest]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Salesforce_Account_Latest]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_Account_Latest]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-02-05
-- Description:	Load Procedure Latest Salesforce Table
-- =============================================
CREATE PROCEDURE [raw].[Load_Salesforce_Account_Latest] 
AS
BEGIN 
TRUNCATE TABLE raw.Salesforce_Account_Latest
END
BEGIN

WITH Salesforce_Account_Latest
	(
	Id, 
	AccountNumber, 
	LastModifiedDate, 
	EtlInsertTime, 
	Exact_ID__c, 
	[Active__c], 
	[Business_Type__c], 
	[Company_Size__c], 
	[Contract_value__c], 
	[ControlledRelease__c], 
	[Enddate__c], 
	[Industry], 
	[IsPartner], 
	[Name], 
	[Package__c], 
	[Sector__c], 
	[Status__c], 
	[Subscription__c], 
	[Type], 
	RN
	)
	AS
		(
		SELECT 
			Id, 
			AccountNumber, 
			LastModifiedDate, 
			EtlInsertTime, 
			Exact_ID__c, 
			[Active__c], 
			[Business_Type__c], 
			[Company_Size__c], 
			[Contract_value__c], 
			[ControlledRelease__c], 
			[Enddate__c], 
			[Industry], 
			[IsPartner], 
			[Name], 
			[Package__c], 
			[Sector__c], 
			[Status__c], 
			[Subscription__c], 
			[Type],
			ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
		FROM [raw].[Salesforce_Account]
		)

	INSERT INTO raw.Salesforce_Account_Latest
		(
			[Id], 
			[AccountNumber],
			[LastModifiedDate],
			[EtlInsertTime],
			[Exact_ID__c],    
			[Active__c], 
			[Business_Type__c], 
			[Company_Size__c], 
			[Contract_value__c], 
			[ControlledRelease__c], 
			[Enddate__c], 
			[Industry], 
			[IsPartner], 
			[Name], 
			[Package__c], 
			[Sector__c], 
			[Status__c], 
			[Subscription__c], 
			[Type]
		)

	SELECT 
		Id, 
		AccountNumber, 
		LastModifiedDate, 
		EtlInsertTime, 
		Exact_ID__c, 
		[Active__c], 
		[Business_Type__c], 
		[Company_Size__c], 
		[Contract_value__c], 
		[ControlledRelease__c], 
		[Enddate__c], 
		[Industry], 
		[IsPartner], 
		[Name], 
		[Package__c], 
		[Sector__c], 
		[Status__c], 
		[Subscription__c], 
		[Type]
	FROM Salesforce_Account_Latest
	WHERE RN = 1

END
GO
