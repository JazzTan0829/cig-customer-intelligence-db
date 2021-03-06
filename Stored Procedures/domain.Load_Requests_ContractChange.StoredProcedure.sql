USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_ContractChange]    Script Date: 21-Dec-18 10:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_ContractChange]
AS
BEGIN

TRUNCATE TABLE domain.Requests_ContractChange

INSERT INTO domain.Requests_ContractChange
(
	[RequestID],
	[Created],
	[Modified],
	[Realized],
	[Approved],
	[StatusChanged],
	[Status],

	[HID],
	[TypeDescription],
	[AccountID],
	[ContactID],
	[Description],
	[RequestComments],
	[WorkflowComments],
	[Reason],
	[Old package],
	[New package],
	[New contract number],
	[Done],
	[Date of change],
	[Next action date],
	[Classification 1],
	[Classification 2],
	[Classification 3],
	[CIGCopyTime],
	[Environment],
	[Processed],
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
	[FreeIntField_01],
	[FreeGuidField_01],
	[FreeGuidField_02],
	[FreeTextField_01],
	[FreeBoolField_05],
	[StartDate],
	[EndDate],
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
		[FreeIntField_01],
		[FreeGuidField_01],
		[FreeGuidField_02],
		[FreeTextField_01],
		[FreeBoolField_05],
		[StartDate],
		[EndDate],
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
	WHERE HID='1015' ) A
WHERE A.RowNumber='1'
END
