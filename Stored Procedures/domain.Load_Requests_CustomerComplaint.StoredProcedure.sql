USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_CustomerComplaint]    Script Date: 21-Dec-18 10:21:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_CustomerComplaint]
AS
BEGIN

TRUNCATE TABLE domain.Requests_CustomerComplaint

INSERT INTO domain.Requests_CustomerComplaint
(
	[Created],
	[Modified],
	[Realized],
	[Approved],
	[StatusChanged],
	Status, 
	ID, 
	HID, 
	TypeDescription, 
	AccountID, 
	ContactID, 
	Description, 
	RequestComments, 
	WorkflowComments, 
	StartDate, 
	EndDate, 
	[Claimed ammount], 
	[Reason complaint], 
	Module, 
	[Related request], 
	[Classification 1], 
	[Classification 2], 
	[Classification 3], 
	CIGCopyTime, 
	Environment, 
	Processed,
	RequestCode
)

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
	[StartDate],
	[EndDate],
	[FreeNumberField_01],
	[FreeTextField_01],
	[Item_1],
	[FreeGuidField_01],
	[FreeTextField_13],
	[FreeTextField_14],
	[FreeTextField_15],
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
		[StartDate],
		[EndDate],
		[FreeNumberField_01],
		[FreeTextField_01],
		[Item_1],
		[FreeGuidField_01],
		[FreeTextField_13],
		[FreeTextField_14],
		[FreeTextField_15],
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
	WHERE HID='1209' ) A
WHERE A.RowNumber='1'
END
