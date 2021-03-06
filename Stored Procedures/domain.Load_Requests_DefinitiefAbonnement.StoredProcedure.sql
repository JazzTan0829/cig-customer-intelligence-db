USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Requests_DefinitiefAbonnement]    Script Date: 21-Dec-18 10:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 2017-01-27
-- Description:	
-- =============================================
ALTER PROCEDURE [domain].[Load_Requests_DefinitiefAbonnement]
AS
BEGIN

TRUNCATE TABLE domain.Requests_DefinitiefAbonnement

INSERT INTO domain.Requests_DefinitiefAbonnement
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
	StartDate, 
	EndDate, 
	[Soort Contract], 
	[Accountant?], 
	[Proef => vast!], 
	[Type contract], 
	[Validated accountant?], 
	[Source accountant validation], 
	[Migration?], 
	[Financial Exchange], 
	[Customer Code in Synergy], 
	[Exist in EOL?], 
	[Other customer code in EOL?], 
	[Accountant linked], 
	[Classification?], 
	[Dealer?], 
	[Customer information checked?], 
	[Digipass created?], 
	[Related question], 
	[Name, adress, etc], 
	[Contact person], 
	[Status old exact package], 
	[Reason not linked], 
	[Why online bookkeeping?], 
	[Decisive factor for EOL?], 
	[Which package before EOL], 
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
	[StartDate],
	[EndDate],
	[FreeTextField_10],
	[FreeTextField_01],
	[FreeIntField_02],
	[FreeTextField_11],    
	[FreeTextField_02],
	[FreeTextField_03],
	[FreeTextField_04],  
	[FreeTextField_14],
	[FreeIntField_01],
	[FreeTextField_05],     
	[FreeIntField_03],
	[FreeTextField_06],       
	[FreeBoolField_04],
	[FreeBoolField_02],
	[FreeBoolField_05],
	[FreeTextField_07],
	[FreeGuidField_01],
	[FreeBoolField_01],
	[FreeBoolField_03],
	[FreeTextField_13],
	[FreeTextField_15],
	[FreeTextField_09], 
	[FreeTextField_08],    
	[FreeTextField_12],                  
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
		[StartDate],
		[EndDate],
		[FreeTextField_10],
		[FreeTextField_01],
		[FreeIntField_02],
		[FreeTextField_11],    
		[FreeTextField_02],
		[FreeTextField_03],
		[FreeTextField_04],  
		[FreeTextField_14],
		[FreeIntField_01],
		[FreeTextField_05],     
		[FreeIntField_03],
		[FreeTextField_06],       
		[FreeBoolField_04],
		[FreeBoolField_02],
		[FreeBoolField_05],
		[FreeTextField_07],
		[FreeGuidField_01],
		[FreeBoolField_01],
		[FreeBoolField_03],
		[FreeTextField_13],
		[FreeTextField_15],
		[FreeTextField_09], 
		[FreeTextField_08],    
		[FreeTextField_12],                  
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
	WHERE (HID='1204' AND Environment='NL') OR (HID='1001' AND Environment='BE') ) A
WHERE A.RowNumber='1'
END

