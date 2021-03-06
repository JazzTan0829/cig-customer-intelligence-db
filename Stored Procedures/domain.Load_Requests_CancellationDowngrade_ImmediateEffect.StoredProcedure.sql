USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_CancellationDowngrade_ImmediateEffect]    Script Date: 21-Dec-18 10:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_CancellationDowngrade_ImmediateEffect]
AS
BEGIN

TRUNCATE TABLE domain.Requests_CancellationDowngrade_ImmediateEffect

INSERT INTO domain.Requests_CancellationDowngrade_ImmediateEffect
(
	[Status],
	[RequestID],
	[HID],
	[TypeDescription],
	[AccountID],
	[Description],
	[RequestComments],
	[WorkflowComments],
	[Reason] ,
	[CIGCopyTime],
	[Environment],
	[RelatedRequest],
	[Type],
	[DecreaseInMRR] ,
	[Created],
	[Modified],
	[Realized],
	[Approved],
	[Processed],
	[StatusChanged],
	RequestCode
)

SELECT
		[Status],
		[ID],
		[HID],
		[TypeDescription],
		[Account],
		[Description],
		[RequestComments],
		[WorkflowComments],
		[FreeTextField_01] ,
		[CIGCopyTime],
		[Environment],
		[FreeGuidField_01],
		[Type],
		[Amount] ,
		[syscreated],
		[sysmodified],
		[Realized],
		[Approved],
		[Processed],
		[StatusChanged],
		RequestCode
FROM (
		SELECT
		[Status],
		[ID],
		[HID],
		[TypeDescription],
		[Account],
		[Description],
		[RequestComments],
		[WorkflowComments],
		[FreeTextField_01] ,
		[CIGCopyTime],
		[Environment],
		[FreeGuidField_01],
		[Type],
		[Amount] ,
		[syscreated],
		[sysmodified],
		[Realized],
		[Approved],
		[Processed],
		[StatusChanged] ,
		concat(left(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),2),'.',SUBSTRING(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3,3),'.',right(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3)) as RequestCode
		, ROW_NUMBER() OVER (Partition by ID ORDER BY CIGCopyTime DESC) as RowNumber
	FROM raw.HOST_CIG_Requests
	WHERE HID='8444' ) A
WHERE A.RowNumber='1'
END
