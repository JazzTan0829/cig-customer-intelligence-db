USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_Customer_Progress]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_Customer_Progress]
GO
/****** Object:  StoredProcedure [domain].[Load_Customer_Progress]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [domain].[Load_Customer_Progress]

AS
BEGIN

-- =================================================================================================================
-- Author:		Alex Green
-- Create date: 22-11-2016
-- Description:	Loads the Customer Progress Requests from ExportEOLRequests
-- =================================================================================================================

TRUNCATE TABLE CustomerIntelligence.[domain].[CustomerProgressRequest]

INSERT INTO CustomerIntelligence.[domain].[CustomerProgressRequest]
(
	[ID] , 
	[HID] ,
	[Environment] ,
	[AccountCode] ,
	[AccountName] ,
	[TypeDescription] ,
	[Created] ,
	[StartDate] ,
	[Approved] ,
	[Realized] ,
	[EndDate] ,
	[Status] ,
	[Description] ,
	[CreatorFullName] ,
	[UserFullName] 
)
SELECT
	ID ,
	HID ,
	 (CASE Environment
		WHEN 'GB' 
		THEN 'UK' 
		ELSE Environment 
		END) AS Environment ,
	[AccountCode] ,
	[AccountName] ,
	[TypeDescription] ,
	[Created] ,
	[StartDate] ,
	[Approved] ,
	[Realized] ,
	[EndDate] ,
	[Status] ,
	[Description] ,
	[CreatorFullName] ,
	[UserFullName]
FROM 
	ContractData.[dbo].[ExportEOLRequests]

WHERE TypeDescription = 'Customer Progress'

END

GO
