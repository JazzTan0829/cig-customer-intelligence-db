USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Load_ContractEventTypes]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Load_ContractEventTypes]
GO
/****** Object:  StoredProcedure [domain].[Load_ContractEventTypes]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================================================================
-- Author:		Alex Green (based on the original script from Ronald Dahne)
-- Create date: 24-11-2015
-- Description:	Loads the ContractEventTypes table

-- UPDATED: 16/10/2017
-- Changed to use Corporate BI DW version of ContractStatistics
-- =====================================================================================================================

CREATE PROCEDURE [domain].[Load_ContractEventTypes]

AS
BEGIN

TRUNCATE TABLE domain.ContractEventTypes

INSERT INTO domain.ContractEventTypes
(
	Environment,
	ContractEventTypeCode,
	ContractEventDescription
)

SELECT
	Distinct(CASE Environment
		WHEN 'GB'
		THEN 'UK'
		ELSE Environment
		END) AS Environment,
	EventType AS ContractEventTypeCode,
	EventDescription AS ContractEventDescription
FROM [raw].[DW_ContractStatistics]
WHERE
	META_LOAD_ENDDTS IS NULL		 -- If field is NULL then this means it is an old record
	AND META_ISDELETED = 0			 -- If equal to 1 then this row is one that should be deleted

END
GO
