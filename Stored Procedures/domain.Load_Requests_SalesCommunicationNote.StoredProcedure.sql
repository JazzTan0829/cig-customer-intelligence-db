USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_SalesCommunicationNote]    Script Date: 21-Dec-18 10:25:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================================================================================================
-- Author:		Alex Green
-- Create date: 2018-05-02
-- Description: This builds the latest Sales Communication Note request. This request is used to log Sales' chats with leads/customers
-- =======================================================================================================================================

ALTER PROCEDURE [domain].[Load_Requests_SalesCommunicationNote]
AS
BEGIN

TRUNCATE TABLE domain.Requests_SalesCommunicationNote

INSERT INTO domain.Requests_SalesCommunicationNote
(
	[RequestID] ,
	[RequestHID],
	[Created],
	[Modified],
	[Realized],
	[ActionDate],
	[Status],
	[HID],
	[Subject],
	[AccountID],
	[ContactID],
	[UserID],
	[RequestComments],
	[Document],
	[Opportunity],
	[VAR],
	[CommunicationCategory], 
	[Product],
	[Price],
	[CIGCopyTime],
	[Environment],
	RequestCode
)
SELECT
	[ID] AS [RequestID],
	[RequestHID],
	[syscreated] AS [Created],
	[sysmodified] AS [Modified],
	[Realized],
	[StartDate] AS [ActionDate],
	[Status],
	[HID],
	[Description] AS [Subject],
	[Account] AS [AccountID] ,
	[Contact] AS [ContactID] ,
	[UserID] ,
	[RequestComments] ,
	[Document],
	[Opportunity],
	[FreeGuidField_01] AS [VAR],
	[FreeTextField_01] AS [CommunicationCategory],
	[FreeTextField_02] AS [Product],
	[FreeNumberField_01] AS [Price],
	[CIGCopyTime],
	[Environment],
	RequestCode

FROM
	(
		SELECT *, 
		concat(left(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),2),'.',SUBSTRING(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3,3),'.',right(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3)) as RequestCode
		,ROW_NUMBER() OVER (Partition by ID ORDER BY CIGCopyTime DESC) as RowNumber
		FROM raw.HOST_CIG_Requests
		WHERE HID='8445' 
	) SQ
WHERE SQ.RowNumber = 1
END