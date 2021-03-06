USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_PriceAgreement]    Script Date: 21-Dec-18 10:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_PriceAgreement]
AS
BEGIN

TRUNCATE TABLE domain.Requests_PriceAgreement

INSERT INTO domain.Requests_PriceAgreement
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
	[Discount on],
	[Discount Amount],
	[Consultancy hour rate],
	CIGCopyTime,
	Environment,
	Processed,
	UserID,
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
	[FreeTextField_01],
	[FreeNumberField_02],
	[FreeNumberField_01],
	[CIGCopyTime],
	[Environment],
	[Processed],
	[UserID],
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
		[FreeTextField_01],
		[FreeNumberField_02],
		[FreeNumberField_01],
		[CIGCopyTime],
		[Environment],
		[Processed],
		[UserID],
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
	WHERE HID='1210' ) A
WHERE A.RowNumber='1'
END
