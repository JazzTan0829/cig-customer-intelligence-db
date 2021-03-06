USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_TransferRequest]    Script Date: 21-Dec-18 10:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ALex Green
-- Create date: 2017-09-01
-- Description:
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_TransferRequest]

AS
BEGIN

TRUNCATE TABLE domain.Requests_TransferRequest

INSERT INTO domain.Requests_TransferRequest
(
[RequestID] ,
[Created] ,
[Realized] ,
[Status] ,
[HID]  ,
[TypeDescription] ,
[AccountID] ,
[ContactID] ,
[UserID] ,
[Description] ,
[CIGCopyTime] ,
[Environment] ,
[Processed] ,
RequestCode
)

SELECT
	[ID],
	[syscreated],
	[Realized],
	[Status],
	[HID],
	[TypeDescription],
	[Account],
	[Contact],
	[UserID],
	[Description],
	[CIGCopyTime],
	[Environment],
	[Processed],
	RequestCode

FROM (
		SELECT
			[ID],
			[syscreated],
			[Realized],
			[Status],
			[HID],
			[TypeDescription],
			[Account],
			[Contact],
			[UserID],
			[Description],
			[CIGCopyTime],
			[Environment],
			[Processed],
			concat(left(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),2),'.',SUBSTRING(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3,3),'.',right(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3)) as RequestCode
			, ROW_NUMBER() OVER (Partition by ID ORDER BY CIGCopyTime DESC) as RowNumber
	FROM raw.HOST_CIG_Requests
	WHERE HID='14018' ) A
WHERE A.RowNumber='1'
END
