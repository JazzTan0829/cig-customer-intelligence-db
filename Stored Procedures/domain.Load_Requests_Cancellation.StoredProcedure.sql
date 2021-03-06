USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_Cancellation]    Script Date: 21-Dec-18 10:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_Cancellation]
AS
BEGIN

TRUNCATE TABLE domain.Requests_CancellationRequest

INSERT INTO domain.Requests_CancellationRequest
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
	[Trial?],
	[Full cancellation],
	[-],
	[Cancel administrations],
	[Cancel users],
	[View user],
	[Cancel budget],
	[Cancel cost analysis],
	[Cancel currency],
	[Cancel invoice],
	[Cancel activa],
	[Reason cancellation],
	[Internal reason cancellation],
	[Migrated to],
	[Rollback cancellation],
	[StartDate],
	[EndDate],
	[Confirmation cancellation sent?],
	[Confirmation cancellation],
	[Change per],
	[# months collection],
	[Done],
	[Classification 1],
	[Classification 2],
	[Classification 3],
	[Do not change],
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
	[FreeBoolField_01],
	[FreeBoolField_03],
	[FreeTextField_05],
	[FreeIntField_03],
	[FreeIntField_02],
	[FreeTextField_12],
	[FreeTextField_06],
	[FreeTextField_07],
	[FreeTextField_08],
	[FreeTextField_10],
	[FreeTextField_11],
	[FreeIntField_01],
	[FreeIntField_04],
	[FreeTextField_03],
	[FreeBoolField_02],
	[StartDate],
	[EndDate],
	[FreeTextField_04],
	[FreeGuidField_01],
	[FreeTextField_01],
	[FreeTextField_02],
	[FreeBoolField_05],
	[FreeTextField_13],
	[FreeTextField_14],
	[FreeTextField_15],
	[FreeDateField_01],
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
		[FreeBoolField_01],
		[FreeBoolField_03],
		[FreeTextField_05],
		[FreeIntField_03],
		[FreeIntField_02],
		[FreeTextField_12],
		[FreeTextField_06],
		[FreeTextField_07],
		[FreeTextField_08],
		[FreeTextField_10],
		[FreeTextField_11],
		[FreeIntField_01],
		[FreeIntField_04],
		[FreeTextField_03],
		[FreeBoolField_02],
		[StartDate],
		[EndDate],
		[FreeTextField_04],
		[FreeGuidField_01],
		[FreeTextField_01],
		[FreeTextField_02],
		[FreeBoolField_05],
		[FreeTextField_13],
		[FreeTextField_14],
		[FreeTextField_15],
		[FreeDateField_01],
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
	WHERE HID='1206' ) A
WHERE A.RowNumber='1'
END
