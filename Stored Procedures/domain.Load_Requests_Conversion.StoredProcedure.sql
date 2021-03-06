USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_Conversion]    Script Date: 21-Dec-18 10:20:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_Conversion]

AS
BEGIN

TRUNCATE TABLE domain.Requests_ConversionRequest

INSERT INTO domain.Requests_ConversionRequest
(
	RequestID, 
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
	[Deliver the backup?], 
	[Conversion form], 
	[Only master data?], 
	[BU received], 
	[BU placed], 
	[Number of administrations], 
	[Number of administrations converted], 
	[Conversion done by], 
	StartDate, 
	EndDate, 
	Payment, 
	Costs,
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
	[FreeTextField_06],
	[FreeTextField_02],
	[FreeBoolField_01],
	[FreeDateField_01],
	[FreeTextField_01],
	[FreeIntField_01],
	[FreeTextField_10],
	[FreeGuidField_01],
	[StartDate],
	[EndDate],
	[FreeTextField_03],
	[FreeNumberField_01],
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
		[FreeTextField_06],
		[FreeTextField_02],
		[FreeBoolField_01],
		[FreeDateField_01],
		[FreeTextField_01],
		[FreeIntField_01],
		[FreeTextField_10],
		[FreeGuidField_01],
		[StartDate],
		[EndDate],
		[FreeTextField_03],
		[FreeNumberField_01],
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
	WHERE HID='1007' ) A
WHERE A.RowNumber='1'
END
