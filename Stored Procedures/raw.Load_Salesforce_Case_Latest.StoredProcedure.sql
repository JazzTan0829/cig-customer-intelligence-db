USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_Case_Latest]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [raw].[Load_Salesforce_Case_Latest]
GO
/****** Object:  StoredProcedure [raw].[Load_Salesforce_Case_Latest]    Script Date: 24-sept.-18 14:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2018-02-05
-- Description:	Load Procedure Latest Salesforce Table
-- =============================================
CREATE PROCEDURE [raw].[Load_Salesforce_Case_Latest] 
AS

BEGIN 
TRUNCATE TABLE raw.Salesforce_Case_Latest
END
BEGIN

WITH Salesforce_Case_Latest	
	(
	Id, 
	AccountId, 
	CaseNumber, 
	ClosedDate, 
	CreatedDate, 
	Description, 
	IsClosed, 
	IsDeleted, 
	IsEscalated, 
	LastModifiedDate, 
	LastReferencedDate, 
	LastViewedDate, 
	Origin, 
	Priority, 
	Reason, 
	RecordTypeId, 
	Status, 
	Subject, 
	Type, 
	CreatedById, 
	LastModifiedById, 
	OwnerId, 
	Account_Number__c, 
	Call_me_back__c, 
	Case_subject__c, 
	Date_Time_Answered__c, 
	Enddate__c, 
	Exact_Creation_Date__c, 
	Exact_ID__c, 
	Exact_Request_Number__c,
	Main_Reason__c, 
	Planned_End_Date__c, 
	Reject_Reason__c, 
	Solution__c, 
	Startdate__c, 
	Start_Date__c, 
	Sub_Reason__c, 
	Owner_Role__c, 
	Related_case__c, 
	Account_Hosting_Environment__c, 
	EtlInsertTime, 
	ContactId, 
	[X2nd_Line_Help__c], 
	[Date_Time_Reopened__c], 
	[Number_of_times_reopened__c],
	Reason_Complaint__c,
	Sub_Reason_Complaint__c,
	RN)
	AS
	(
		SELECT 
			Id, 
			AccountId, 
			CaseNumber, 
			ClosedDate, 
			CreatedDate, 
			Description, 
			IsClosed, 
			IsDeleted, 
			IsEscalated, 
			LastModifiedDate, 
			LastReferencedDate,
			LastViewedDate, 
			Origin, 
			Priority, 
			Reason, 
			RecordTypeId,
			Status, 
			Subject, 
			Type, 
			CreatedById, 
			LastModifiedById, 
			OwnerId, 
			Account_Number__c, 
			Call_me_back__c, 
			Case_subject__c, 
			Date_Time_Answered__c, 
			Enddate__c, 
			Exact_Creation_Date__c, 
			Exact_ID__c, 
			Exact_Request_Number__c, 
			Main_Reason__c, 
			Planned_End_Date__c, 
			Reject_Reason__c, 
			Solution__c, 
			Startdate__c, 
			Start_Date__c, 
			Sub_Reason__c, 
			Owner_Role__c, 
			Related_case__c, 
			Account_Hosting_Environment__c, 
			EtlInsertTime, 
			ContactId, 
			[X2nd_Line_Help__c], 
			[Date_Time_Reopened__c], 
			[Number_of_times_reopened__c],
			Reason_Complaint__c,
			Sub_Reason_Complaint__c,
			ROW_NUMBER() OVER (PARTITION BY Id ORDER BY LastModifiedDate DESC, EtlInsertTime DESC) AS RN
		FROM [raw].[Salesforce_Case]
	)

INSERT INTO raw.Salesforce_Case_Latest
	(
	[Id], 
	[AccountId],
	[ContactId], 
	[CaseNumber], 
	[ClosedDate], 
	[CreatedDate], 
	[Description], 
	[IsClosed], 
	[IsDeleted], 
	[IsEscalated], 
	[LastModifiedDate], 
	[LastReferencedDate], 
	[LastViewedDate], 
	[Origin],
	[Priority],
	[Reason], 
	[RecordTypeId], 
	[Status], 
	[Subject], 
	[Type], 
	[CreatedById], 
	[LastModifiedById], 
	[OwnerId], 
	[Account_Number__c], 
	[Call_me_back__c], 
	[Case_subject__c], 
	[Date_Time_Answered__c], 
	[Enddate__c], 
	[Exact_Creation_Date__c], 
	[Exact_ID__c], 
	[Exact_Request_Number__c], 
	[Main_Reason__c], 
	[Planned_End_Date__c], 
	[Reject_Reason__c], 
	[Solution__c], 
	[Startdate__c], 
	[Start_Date__c], 
	[Sub_Reason__c],
	[Owner_Role__c], 
	[Related_case__c], 
	[Account_Hosting_Environment__c], 
	[EtlInsertTime], 
	[X2nd_Line_Help__c], 
	[Date_Time_Reopened__c], 
	[Number_of_times_reopened__c],
	Reason_Complaint__c,
	Sub_Reason_Complaint__c
	)
	SELECT 
		Id, 
		AccountId, 
		ContactId,
		CaseNumber, 
		ClosedDate, 
		CreatedDate, 
		Description, 
		IsClosed, 
		IsDeleted, 
		IsEscalated, 
		LastModifiedDate,
		LastReferencedDate, 
		LastViewedDate, 
		Origin, 
		Priority,
		Reason, 
		RecordTypeId, 
		Status,
		Subject, 
		Type, 
		CreatedById, 
		LastModifiedById, 
		OwnerId, 
		Account_Number__c,
		Call_me_back__c, 
		Case_subject__c, 
		Date_Time_Answered__c, 
		Enddate__c,
		Exact_Creation_Date__c, 
		Exact_ID__c, 
		Exact_Request_Number__c,
		Main_Reason__c, 
		Planned_End_Date__c, 
		Reject_Reason__c, 
		Solution__c, 
		Startdate__c, 
		Start_Date__c, 
		Sub_Reason__c, 
		Owner_Role__c, 
		Related_case__c, 
		Account_Hosting_Environment__c, 
		EtlInsertTime,
		[X2nd_Line_Help__c], 
		[Date_Time_Reopened__c], 
		[Number_of_times_reopened__c],
		Reason_Complaint__c,
		Sub_Reason_Complaint__c
	FROM Salesforce_Case_Latest
	WHERE RN = 1


END
GO
