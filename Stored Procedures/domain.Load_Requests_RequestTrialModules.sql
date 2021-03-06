USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_RequestTrialModules]    Script Date: 21-Dec-18 10:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Levon Goceryan
-- Create date: 2018-10-12
-- Description: Stored Procedure Request Trial Modules
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_RequestTrialModules]
AS
BEGIN

TRUNCATE TABLE [domain].[Requests_RequestTrialModules]

INSERT INTO [domain].[Requests_RequestTrialModules]
(
       [RequestID]
      ,[Created]
      ,[Modified]
      ,[Realized]
      ,[Approved]
      ,[StatusChanged]
      ,[Status]
      ,[HID]
      ,[TypeDescription]
      ,[AccountID]
      ,[ContactID]
      ,[Description]
      ,[RequestComments]
      ,[WorkflowComments]
      ,[CIGCopyTime]
      ,[Environment]
      ,[Processed]
      ,[sysmodifier]
      ,[Approver]
      ,[Processor]
      ,[Realizer]
      ,[Division]
      ,[UserID]
	  ,[Trial_Modules]
	  ,RequestCode
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
	[CIGCopyTime],
	[Environment],
	[Processed],
	[sysmodifier],
	[Approver],
    [Processor],
    [Realizer],
    [Division],
	[UserID],
	[FreeTextField_01],
	RequestCode
	

FROM (
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
	[CIGCopyTime],
	[Environment],
	[Processed],
	[sysmodifier],
	[Approver],
    [Processor],
    [Realizer],
    [Division],
	[UserID],
	[FreeTextField_01],
	concat(left(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),2),'.',SUBSTRING(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3,3),'.',right(CONCAT(replicate ('0',8-LEN(requesthid)),requesthid),3)) as RequestCode
		, ROW_NUMBER() OVER (Partition by ID ORDER BY CIGCopyTime DESC) as RowNumber
	FROM raw.HOST_CIG_Requests
	WHERE HID='1008' ) A
WHERE A.RowNumber='1'
END
