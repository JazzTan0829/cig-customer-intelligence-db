USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_OutstandingProductIssue]    Script Date: 21-Dec-18 10:23:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_OutstandingProductIssue] 
AS
BEGIN

TRUNCATE TABLE domain.Requests_OutstandingProductIssue

INSERT INTO domain.Requests_OutstandingProductIssue
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
	[Related question], 
	[Development question], 
	Module, 
	StartDate, 
	EndDate, 
	[Hotfix patched?], 
	[Test OK in SAT], 
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
	[FreeGuidField_01],
	[FreeTextField_01],
	[Item_1],
	[StartDate],
	[EndDate],
	[FreeBoolField_01],
	[FreeBoolField_02],
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
		[FreeGuidField_01],
		[FreeTextField_01],
		[Item_1],
		[StartDate],
		[EndDate],
		[FreeBoolField_01],
		[FreeBoolField_02],
		[CIGCopyTime],
		[Environment],
		[Processed],
		concat(left(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),2),'.',SUBSTRING(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3,3),'.',right(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3)) as RequestCode
		--[syscreated],
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
	WHERE HID='3' ) A
WHERE A.RowNumber='1'
END
