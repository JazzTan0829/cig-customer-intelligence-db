USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_Enablement]    Script Date: 21-Dec-18 10:22:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_Enablement]
AS
BEGIN

TRUNCATE TABLE domain.Requests_Enablement

INSERT INTO domain.Requests_Enablement
(
	[RequestID], 
	[Created],
	[Modified],
	[Realized],
	[Approved],
	[StatusChanged],
	Status, 

	HID, 
	TypeDescription, 
	AccountID, 
	ContactID, 
	Description, 
	RequestComments, 
	WorkflowComments, 
	[Next action date], 
	[Type of onboarding], 
	[Information], 
	[Date welcome call], 
	[Certification], 
	[Accountancy profile created], 
	[Risk profile], 
	[Desired date operational], 
	[Start date consult], 
	[Consultancy provided by], 
	[Date customer implemented], 
	[Training followed], 
	[Survey respons], 
	[Date onboarding review call],
	CIGCopyTime, 
	Environment, 
	Processed,
	RequestCode
)

SELECT 
	[ID],
	[syscreated],
	[sysmodified],
	[Realized],
	[Approved],
	[StatusChanged],
	[Status],

	[HID],
	[TypeDescription],
	[Account],
	[Contact],
	[Description],
	[RequestComments],
	[WorkflowComments],
	[FreeDateField_02],
	[FreeTextField_01],
	[FreeTextField_10],
	[FreeDateField_01],
	[FreeTextField_04],
	[FreeTextField_02],
	[FreeTextField_06],
	[FreeDateField_03],
	[FreeDateField_05],
	[FreeTextField_11],
	[FreeDateField_04],
	[FreeTextField_03],
	[FreeTextField_05],
	[EndDate],
	[CIGCopyTime],
	[Environment],
	[Processed],
	RequestCode
	--,[syscreated],
	--[syscreator],
	--[sysmodified],
	--[sysmodifier],
	--[Hours]
	--,[Days]
	--,[StartDateActual]
	--,[EndDateActual]
	--,[HoursActual]
	--,[DaysActual]
	--,[Amount]
	--,[Currency]
	--,[AmountFC]
	--,[AmountActual]
	--,[CurrencyActual]
	--,[AmountFCActual]
	--,[Employee]
	--,RowNumber
FROM (
		SELECT 
		[syscreated],
		[sysmodified],
		[Realized],
		[Approved],
		[StatusChanged],
		[Status],
		[ID],
		[HID],
		[TypeDescription],
		[Account],
		[Contact],
		[Description],
		[RequestComments],
		[WorkflowComments],
		[FreeDateField_02],
		[FreeTextField_01],
		[FreeTextField_10],
		[FreeDateField_01],
		[FreeTextField_04],
		[FreeTextField_02],
		[FreeTextField_06],
		[FreeDateField_03],
		[FreeDateField_05],
		[FreeTextField_11],
		[FreeDateField_04],
		[FreeTextField_03],
		[FreeTextField_05],
		[EndDate],
		[CIGCopyTime],
		[Environment],
		[Processed],
		concat(left(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),2),'.',SUBSTRING(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3,3),'.',right(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3)) as RequestCode
		--,[syscreated],
		--[syscreator],
		--[sysmodified],
		--[sysmodifier],
		--[Hours]
		--,[Days]
		--,[StartDateActual]
		--,[EndDateActual]
		--,[HoursActual]
		--,[DaysActual]
		--,[Amount]
		--,[Currency]
		--,[AmountFC]
		--,[AmountActual]
		--,[CurrencyActual]
		--,[AmountFCActual]
		--,[Employee]
		, ROW_NUMBER() OVER (Partition by ID ORDER BY CIGCopyTime DESC) as RowNumber
	FROM raw.HOST_CIG_Requests
	WHERE HID='8409' ) A
WHERE A.RowNumber='1'
END
